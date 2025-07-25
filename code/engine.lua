m=math
mx=m.max
mn=m.min
sqrt=math.sqrt
flr=m.floor
pi=m.pi
gN=input.getNumber
gB=input.getBool
sN=output.setNumber
trueVar=true
falseVar=false
ipairsVar=ipairs
abs=m.abs
tableRemove=table.remove
str=string
sin=m.sin
cos=m.cos
tan=m.tan
unpack=table.unpack
bigNum=math.huge

function add2(a,b)return{(a[1]+b[1]),(a[2]+b[2])}end
function sub2(a,b)return{(a[1]-b[1]),(a[2]-b[2])}end
function mul2(a,b)return{a[1]*b,a[2]*b}end
--function clmp(a,b,c)return mn(mx(b,a),c)end
--function rnd(a)return flr(a+0.5)end
--function dist(a,b)return sqrt(((a[1]-b[1])^2)+((a[2]-b[2])^2)+((a[3]-b[3])^2))end
function add3(a,b)return{a[1]+b[1],a[2]+b[2],a[3]+b[3]}end
function sub3(a,b)return{a[1]-b[1],a[2]-b[2],a[3]-b[3]}end
function mul3(a,b)return{a[1]*b,a[2]*b,a[3]*b}end
--function stringRound3(a)return string.format("%.3f", a or 0)end
function crossPoints(a,b,c)return cross(sub3(b,a),sub3(c,a))end
function norm3(a)return mul3(a,1/sqrt(a[1]^2+a[2]^2+a[3]^2))end
function dist3(a,b)return sqrt((a[1]-b[1])^2 + (a[2]-b[2])^2 + (a[3]-b[3])^2)end

M={}
romCr=1
levelCr=3
stg=1
--loaded=falseVar
init=trueVar
httpTk=0
tick=0
camPos={0,0.3,-2}
camRot={0,0,0}
camDistStart=3
camDistEnd=1
camHeightStart=0.3
camHeightEnd=0.6
tickRate=62.5
angleConvert=pi/180
moveSpeed=0.5/tickRate
rotateSpeed=3*angleConvert/tickRate
offsetSpeed=0.05/tickRate
fovStart=20*angleConvert
fovEnd=90*angleConvert
fov=fovStart
ballStart=-19.5
ballEnd=-3
screenScale=1
tick=0
deltaTime=1/62.5

function getMovementPerUnitForce(object,position,direction)
	trueContactPoint1 = sub3(position,object[1])
	return dot(cross(mul3(cross(trueContactPoint1,direction),object[11]),trueContactPoint1),direction) + object[10]
end

function applyForce(object,position,force)
	collPointObjectRelative=sub3(position,object[1])
	--collDirObjectRelative=divVectorByRotationMatrix(cameraRotationVector,curRotationMatrix)
	object[5]=add3(object[5],mul3(cross(collPointObjectRelative,force),object[11]))
	object[2]=add3(object[2],mul3(force,object[10]))
end

function gjkSupport(points,searchDirection)
	local crDist=-bigNum
	for i,v in ipairsVar(points) do
		crDot = dot(v[2],searchDirection)
		if abs(crDot-crDist)<0.0005 then -- must be more strict than the epa's exit condition to prevent unreachable conditions
			pointList[#pointList+1]=v[2]
		elseif crDot>crDist then
			point=v[2]
			pointList={point}
			crDist=crDot
		end
	end
	return point
end

function gjkCollisionDetection(points1,points2)
	searchDirection={1,0,0}
	collPoints={}
	for itteration1 = 1,32 do
		crPoint = sub3(gjkSupport(points1,searchDirection),gjkSupport(points2,mul3(searchDirection,-1)))
		
		if dot(crPoint,searchDirection)<=0 then
			return
		end
		
		collPoints = {crPoint, collPoints[1], collPoints[2], collPoints[3]}
		
		a,b,c,d=unpack(collPoints)
		
		if d then
			ab = sub3(b,a)
			ac = sub3(c,a)
			ad = sub3(d,a)
			ao = mul3(a,-1)
			
			abc = cross(ab,ac)
			acd = cross(ac,ad)
			adb = cross(ad,ab)
			
			if dot(abc, ao)>0 then
				collPoints = {a,b,c}
				searchDirection = abc
			elseif dot(acd, ao)>0 then
				collPoints = {a,c,d}
				searchDirection = acd
			elseif dot(adb, ao)>0 then
				collPoints = {a,d,b}
				searchDirection = adb
			else -- expanded polytope algorithm
				-- taken from https://github.com/kevinmoran/GJK/blob/master/GJK.h
				--if trueVar then return "GOOD" end
				faces={
					{a,b,c},
					{a,c,d},
					{a,d,b},
					{b,d,c}
				}
				for i,v in ipairs(faces) do -- gives every face a normal
					v[4]=norm3(crossPoints(v[1],v[2],v[3]))
				end
				
				for itteration2 = 1,32 do
					crDist=bigNum -- zero should work
					for i,v in ipairs(faces) do -- find closest face to origin
						crDot = dot(v[1],v[4])
						if crDot<crDist then
							crDist = crDot
							closestFace = v
						end
					end
					searchDirection = closestFace[4]
					
					crPoint = sub3(gjkSupport(points1,searchDirection),gjkSupport(points2,mul3(searchDirection,-1)))
					
					if dot(crPoint,searchDirection)-0.001 <= crDist then
						return {closestFace[4],dot(crPoint,searchDirection)}
					end
					
					looseEdges={}
					for i=#faces,1,-1 do
						crFace=faces[i]
						if dot(crFace[4],sub3(crPoint,crFace[1]))>0 then -- triangle faces new point, remove it
							for j=1,3 do
								crEdge = {crFace[j],crFace[(j%3)+1]}
								for k,crLooseEdge in ipairs(looseEdges) do
									if crLooseEdge[1]==crEdge[2] and crLooseEdge[2]==crEdge[1] then -- edge is in list already, delete both
										tableRemove(looseEdges,k)
										crEdge=nilVar
										break
									end
								end
								
								if crEdge then -- if edge wasn't deleted
									looseEdges[#looseEdges+1]=crEdge
								end
							end
							
							-- now that its edges are dealt with, the triangle can be removed from the list
							
							tableRemove(faces,i)
						end
					end
					
					-- now with the edges found and the old triangles deleted, new triangles can be created
					
					for i,v in ipairs(looseEdges) do
						newFace = {v[1],v[2],crPoint}
						newFace[4] = norm3(crossPoints(newFace[1],newFace[2],newFace[3]))
						
						--if dot(newFace[1], newFace[4]) < 0 then -- I don't think this is needed, the winding should be preserved naturally
						--	newFace[1],newFace[2]=newFace[2],newFace[1]
						--	newFace[4] = mul3(newFace[4],-1)
						--end
						faces[#faces+1]=newFace
					end
				end
				return --TIMEOUT
			end -- expanded polytope algorithm over, now back to the code which will feed it
		elseif c then
			ab = sub3(b,a)
			ac = sub3(c,a)
			ao = mul3(a,-1)
			
			abc = cross(ab,ac)
			
			if dot(cross(abc, ac), ao)>0 then -- closest to edge AC
				collPoints = {a,c}
				searchDirection = cross(cross(ac, ao), ac)
			elseif dot(cross(ab, abc), ao)>0 then --closest to edge AB
				collPoints = {a,b}
				searchDirection = cross(cross(ab, ao), ab)
			else
				if dot(abc, ao)>0 then
					--collPoints = {a,b,c} --above triangle
					searchDirection = abc;
				else
					collPoints = {a,c,b} --below triangle
					searchDirection = mul3(abc,-1)
				end
			end
		elseif b then
			ab = sub3(b,a)
			ao = mul3(a,-1)
			
			if dot(ab, ao)>0 then
				searchDirection = cross(cross(ab, ao), ab)
			else
				collPoints = {a}
				searchDirection = ao
			end
		else
			collPoints={a}
			searchDirection=mul3(a,-1)
		end
	end
	-- only reaches here when a timeout happens
end

function summonObject(index,conditions)
	conditions=conditions or{}
	newPoints={}
	j=1
	for i=M[1][index][1],M[1][index][2] do
		cr=M[2][i]
		newPoints[j]={{cr[1],cr[2],cr[3]},{}}
		j=j+1
	end
	newTris={}
	j=1
	for i=M[1][index][3],M[1][index][4] do
		cr=M[3][i]
		newTris[j]=cr
		j=j+1
	end
	newPhys={}
	j=1
	for i=M[1][index][5],M[1][index][6] do
		cr=M[2][i]
		newPhys[j]={{cr[1],cr[2],cr[3]},{}}
		j=j+1
	end
	
	newObject={-- position, velocity, acceleration, orientation, rotation velocity, rotation acceleration, points, tris
		conditions[1]or{0,0,0}, -- 1
		conditions[2]or{0,0,0}, -- 2
		conditions[3]or{0,0,0}, -- 3
		conditions[4]or{1,0,0,0}, -- 4
		conditions[5]or{0,0,0}, -- 5
		conditions[6]or{0,0,0}, -- 6
		newPoints, -- 7
		newTris, -- 8
		newPhys, -- 9 collision mesh, not yet added
		conditions[7]or 1, -- 10 ability to be moved, higher is easier to be moved
		conditions[8]or 1, -- 11 ability to be rotated, should really be a vec3
		conditions[9]or{0,0,0}, -- 12 gravity
		M[1][index][7], -- 13 max point dist from object's origin
		index, -- 14
	}
	objects[#objects+1]=newObject
end

function intersectTriangle(rayPos,rayDir,a,b,c) -- https://stackoverflow.com/questions/42740765/intersection-between-line-and-triangle-in-3d
	E1 = sub3(b, a)
	E2 = sub3(c, a)
	N = cross(E1,E2)
	det = -dot(rayDir, N)
	invdet = 1.0/det
	AO  = sub3(rayPos, a)
	DAO = cross(AO, rayDir)
	u =  dot(E2,DAO) * invdet
	v = -dot(E1,DAO) * invdet
	t =  dot(AO,N)  * invdet
	return (-det >= 1e-6 and t >= 0 and u >= 0 and v >= 0 and (u+v) <= 1)
end

function cross(a,b)
	return {a[2]*b[3] - a[3]*b[2], a[3]*b[1] - a[1]*b[3], a[1]*b[2] - a[2]*b[1]}
end

function dot(a,b)
	return a[1]*b[1]+a[2]*b[2]+a[3]*b[3]
end

function vectorToQuaternion(vec)
	if vec[1]==0 and vec[2]==0 and vec[3]==0 then
		return {1,0,0,0}
	else
		return {0,vec[1],vec[2],vec[3]}
	end
end

function updateQuaternionByVector(quat,vec)
	newQuat=multQuaternionByQuaternion(quat,vectorToQuaternion(vec))
	for i=1,4 do
		newQuat[i]=quat[i] + newQuat[i]*0.5
	end
	return newQuat
end

function multQuaternionByQuaternion(quat1,quat2)
	w1,x1,y1,z1=unpack(quat1)
	w2,x2,y2,z2=unpack(quat2)
	return {
		w1*w2-x1*x2-y1*y2-z1*z2,
		w1*x2+x1*w2+y1*z2-z1*y2,
		w1*y2-x1*z2+y1*w2+z1*x2,
		w1*z2+x1*y2-y1*x2+z1*w2
	}
end

function multVectorByMatrix(vec,matrix)
	newVec={}
	for j = 1,3 do
		cr=0
		for k = 1,3 do
			cr=cr + vec[k]*matrix[j][k]
		end
		newVec[j]=cr
	end
	return newVec
end

--function divVectorByRotationMatrix(vec,matrix)
--	local newVec={}
--	for j = 1,3 do
--		cr=0
--		for k = 1,3 do
--			cr=cr + vec[k]*matrix[k][j]
--		end
--		newVec[j]=cr
--	end
--	return newVec
--end

function norm4(a,correction)
	correction=1/sqrt(a[1]^2 + a[2]^2 + a[3]^2 + a[4]^2)
	return {a[1]*correction, a[2]*correction, a[3]*correction, a[4]*correction}
end

function quaternionToMatrix(quat)
	w,x,y,z=unpack(quat)
	return {
		{1-(2*y*y + 2*z*z), 2*x*y + 2*z*w,     2*x*z - 2*y*w},
		{2*x*y - 2*z*w,     1-(2*x*x + 2*z*z), 2*y*z + 2*x*w},
		{2*x*z + 2*y*w,     2*y*z - 2*x*w,     1-(2*x*x + 2*y*y)},
	}
end

function calcNormal(object1,object2)
	velocity1 = add3(cross(object1[5],sub3(trueContactPoint,object1[1])),object1[2])
	velocity2 = add3(cross(object2[5],sub3(trueContactPoint,object2[1])),object2[2])
	totalVelocity = sub3(velocity1,velocity2)
	
	totalVelocityNormal = dot(isColliding[1],totalVelocity)
end

--function httpReply(a,b,c)
--	httpTkP=httpTk//2
--	httpTk=0
--end

function onTick()
	for j=1,1 do
		if gB(32) and not loaded then
			rom=property.getText(romCr)
			i=1
			nm=""
			cr=str.sub(rom,i,i)
			while cr~=""do
				pos=str.byte(cr)
				if pos>64 then
					nm=(nm..pos-65)+0
					if stg==1 then
						curIndex=nm
						M[nm]=M[nm]or{}
					elseif stg==2 then
						intH=nm
						curLength=0
					elseif stg==3 then
						count=nm
					else
						if curLength==0 then
							curLength=intH
							count=count-1
							curM={}
							M[curIndex][#M[curIndex]+1]=curM
						end
						curM[#curM+1]=nm
						curLength=curLength-1
						stg=mx(curLength,count)>0 and stg-1 or 0
					end
					stg=stg+1
					nm=""
				else
					nm=nm..cr
				end
				i=i+1
				cr=str.sub(rom,i,i)
			end
			romCr=romCr+1
			loaded=rom==""
		end
	end

	if loaded then
		tick = tick+1
		
		if init then
			
			
			objects={}
			rayOffset={0,-0.15,0}
			standingPins=10
			
			--for i=-1,1 do
			--	for j=-1,1 do
			--		summonObject("blender_cube",{[1]={i*2.5,0,j*2.5}})
			--	end
			--end
			--summonObject(2)
			--summonObject(2,{[1]={2,0,0}})
			--summonObject(2,{[1]={-2,0,0}})
			
			--summonObject("cylinder",{[1]={-6,0,0}})
			--summonObject("utah_teapot",{[1]={6,0,0}})
			
			
			--summonObject("wide_cube",{[1]={0,-1,0},[7]=0,[8]=0})
			summonObject("bowling_lane1",{[1]={0,-0.2,-8.15},[7]=0,[8]=0})
			summonObject("bowling_lane2",{[1]={0,-0.2,-18.4},[7]=0,[8]=0})
			summonObject("bowling_lane3",{[1]={0,-0.2,-19.5},[7]=0,[8]=0})
			
			--summonObject(4,{[1]={-20,-5,0},[7]=0,[8]=0})
			
			for i=1,4 do
				for j=1,i do
					summonObject("bowling_pin",{[1]={(j-i/2-0.5)*0.3,0.15,(i-1)*sqrt(0.3^2-0.15^2)},[7]=0.75,[8]=50,[9]={0,-5,0}})
				end
			end
			
			summonObject("icoball",{[1]={0,0.4,ballStart},[7]=0.2,[8]=10,[9]={0,-9.81,0}})
		end
		
		sN(1,-1)
		if init or ballHitTimer>120 then
			sN(1,standingPins)
			
			tableRemove(objects,#objects)
			summonObject("icoball",{[1]={0,0.4,ballStart},[7]=0.2,[8]=10,[9]={0,-9.81,0}})
			
			ableToShoot,ballHit,init=trueVar
			ballHitTimer=0
			
			if standingPins==0 then
				init=trueVar
			end
		end
		
		--if gB(31) then
		--	camPos[2]=camPos[2]+gN(2)*moveSpeed
		--else
		--	camPos[1]=camPos[1]+(gN(1)*cos(camRot[1]) - gN(2)*sin(camRot[1]))*moveSpeed
		--	camPos[3]=camPos[3]+(gN(1)*sin(camRot[1]) + gN(2)*cos(camRot[1]))*moveSpeed
		--end
		--camRot[3]=camRot[3]+gN(1)*rotateSpeed
		--camRot[1]=camRot[1]-gN(3)*rotateSpeed
		--camRot[2]=camRot[2]+gN(4)*rotateSpeed
		
		ball = objects[#objects]
		lerpDist = mn((ball[1][3]-ballStart)/(ballEnd-ballStart),1)
		camDist = camDistStart + (camDistEnd-camDistStart)*lerpDist
		fov = fovStart + (fovEnd-fovStart)*lerpDist
		camHeight = camHeightStart + (camHeightEnd-camHeightStart)*lerpDist
		
		if not ballHit then
			camRot[1] = camRot[1]-gN(3)*rotateSpeed
			camRot[2] = -0.01
			rayOffset[2] = rayOffset[2]+gN(2)*offsetSpeed
			rayOffset[1] = rayOffset[1]+gN(1)*offsetSpeed
			camPos = {sin(camRot[1])*camDist,camHeight,-cos(camRot[1])*camDist+ball[1][3]}
		end
		
		--if gB(1) then
		--	camRot[3]=camRot[3]-rotateSpeed
		--end
		--if gB(3) then
		--	camRot[3]=camRot[3]+rotateSpeed
		--end
		--pushForce=0
		--if gB(1) then
		--	applyForce(objects[1],objects[1][1],{0,0,0.5})
		--end
		
		if ballHit then
			ballHitTimer = ballHitTimer+1
		end
		
		
		
		--cr=0
		--if gB(4) then
		--	cr=-0.025
		--end
		--if gB(5) then
		--	cr=0.025
		--end
		--objects[2][1][1]=objects[2][1][1]+cr
		
		a=camRot[1]
		b=camRot[2]
		c=camRot[3]
		c_a = cos(a)
		s_a = sin(a)
		c_b = cos(b)
		s_b = sin(b)
		c_c = cos(c)
		s_c = sin(c)

		--cameraRotationMatrix = {
     	--	{cb*cc, sa*sb*cc-ca*sc, ca*sb*cc+sa*sc},
		--	{cb*sc, sa*sb*sc+ca*cc, ca*sb*sc-sa*cc},
		--	{-sb, sa*cb, ca*cb}
		--}
		
		--cameraRotationMatrix = {
		--	{ cc*ca + sc*sb*sa,   -sc*cb,            cc*sa + sc*sb*ca },
		--	{ sc*ca - cc*sb*sa,    cc*cb,            sc*sa - cc*sb*ca },
		--	{ -cb*sa,              sb,               cb*ca }
		--}
		
		--cameraRotationMatrix = {
		--	{c_a*c_c - s_a*s_b*s_c , c_a*s_c + c_c*s_a*s_b , -c_b*s_a },
		--	{-c_b*s_c , c_b*c_c , s_b},
		--	{c_a*s_b*s_c + c_c*s_a , s_a*s_c - c_a*c_c*s_b , c_a*c_b},
		--}
		
		cameraRotationMatrix = {
			{c_a*c_c - s_a*s_b*s_c , -c_b*s_c , c_a*s_b*s_c + c_c*s_a},
			{c_a*s_c + c_c*s_a*s_b , c_b*c_c , s_a*s_c - c_a*c_c*s_b},
			{-c_b*s_a , s_b , c_a*c_b}
		}
		
		cameraRotationVector = {-s_a*c_b,s_b,c_a*c_b}
		
		--keyboardRotationInput = {-0.01*gN(2),0.01*gN(1),0.01*gN(3)}
		overalRayHit = falseVar
		renderTris = {}
		
		for index = 1,#objects do
			object = objects[index]
			object[4] = norm4(updateQuaternionByVector(object[4],mul3(object[5],-deltaTime))) -- apply rotational velocity to orientation, not sure why the minus is needed
			object[1] = add3(object[1],mul3(object[2],deltaTime)) -- apply velocity to position
			object[2] = add3(object[2],mul3(object[3],deltaTime)) -- apply acceleration to velocity
			object[3] = mul3(object[12],1) -- reset acceleration to gravity
			--object[2] = mul3(object[2],0.9995) -- slow down velocity
			if object[14] == "bowling_pin" then
				object[5] = mul3(object[5],0.9) -- slow down rotation
				if object[1][2]<0.1 and not object[15] then
					object[15]=trueVar
					standingPins=standingPins-1
				end
			elseif object[14] == "icoball" then
				if object[1][2]<-1 or (object[2][3]<1 and not ableToShoot) then
					ballHit = trueVar
				end
			end
		
			curRotationMatrix = quaternionToMatrix(norm4(object[4]))
		
			
			for i=7,9,2 do
				for j=1,#object[i] do
					crPoint=object[i][j]
					crPoint[2] = multVectorByMatrix(crPoint[1],curRotationMatrix)
					crPoint[2]=add3(crPoint[2],object[1])
					crPoint[3]=sub3(crPoint[2],camPos)
					
					crPoint[4]=multVectorByMatrix(crPoint[3],cameraRotationMatrix)
					distances=crPoint[3]
					crPoint[7]=distances[3]--sqrt(distances[1]^2 + distances[2]^2 + distances[3]^2)
					
					crPoint[5]={crPoint[4][1]*screenScale/crPoint[4][3],
					-crPoint[4][2]*screenScale/crPoint[4][3]}
					crPoint[6]=crPoint[4][3]>0 and 1 or -1
					
				end
			end
			
			if object[11]>0 or not object[8][1][8] then
				for i=1,#object[8] do
					curTri = object[8][i]
					curTri[8]=crossPoints(object[7][curTri[1]][2], object[7][curTri[2]][2], object[7][curTri[3]][2])
				end
			end
			
			for i,curTri in ipairsVar(object[8]) do
				p1 = object[7][curTri[1]]
				p2 = object[7][curTri[2]]
				p3 = object[7][curTri[3]]
				curTri[7]=mx(p1[7],p2[7],p3[7])
				a=curTri[8]
				b=p1[3]
				if dot(a,b)>0 then
					sideVal=p1[6]+p2[6]+p3[6]
					if sideVal == 3 then
						renderTris[#renderTris+1] = {p1[5],p2[5],p3[5],curTri[4],curTri[5],curTri[6],curTri[7]}
					elseif sideVal >= -1 then
						if p1[6]==-sideVal then
							screenPoint1=p1[5]
							screenPoint2=p2[5]
							screenPoint3=p3[5]
						elseif p2[6]==-sideVal then
							screenPoint1=p2[5]
							screenPoint2=p1[5]
							screenPoint3=p3[5]
						else
							screenPoint1=p3[5]
							screenPoint2=p2[5]
							screenPoint3=p1[5]
						end
						if sideVal == 1 then
							screenPoint4=add2(mul2(sub2(screenPoint2,screenPoint1),1000),screenPoint2)
							screenPoint5=add2(mul2(sub2(screenPoint3,screenPoint1),1000),screenPoint3)
							--renderTris[#renderTris+1] = {screenPoint2,screenPoint4,screenPoint3,255,0,0,curTri[7]}
							--renderTris[#renderTris+1] = {screenPoint3,screenPoint4,screenPoint5,0,0,255,curTri[7]}
							renderTris[#renderTris+1] = {screenPoint2,screenPoint4,screenPoint3,curTri[4],curTri[5],curTri[6],curTri[7]}
							renderTris[#renderTris+1] = {screenPoint3,screenPoint4,screenPoint5,curTri[4],curTri[5],curTri[6],curTri[7]}
						else
							screenPoint4=add2(mul2(sub2(screenPoint1,screenPoint2),1000),screenPoint2)
							screenPoint5=add2(mul2(sub2(screenPoint1,screenPoint3),1000),screenPoint3)
							--renderTris[#renderTris+1] = {screenPoint1,screenPoint4,screenPoint5,255,0,255,curTri[7]}
							renderTris[#renderTris+1] = {screenPoint1,screenPoint4,screenPoint5,curTri[4],curTri[5],curTri[6],curTri[7]}
						end
					end
				end
			end
		end
		
		if ableToShoot then
			pushRayHit = falseVar
			bestT=2^16
			rayDir = norm3({cameraRotationVector[1],0,cameraRotationVector[3]}) -- norm3(sub3(cameraRotationVector,rayOffset))
			rayStart = rayOffset
			for i,object in ipairsVar(objects) do
				if object[14]=="icoball" then
					for j=1,#object[8] do
						curTri = object[8][j]
						curHit = intersectTriangle(rayStart,rayDir,object[7][curTri[1]][3],object[7][curTri[2]][3],object[7][curTri[3]][3])
						if curHit and t<bestT then
							pushRayHit = trueVar
							bestT=t
							bestObject=object
						end
					end
				end
			end
			
			if pushRayHit then
				overalRayHit = trueVar
				collPoint=add3(add3(mul3(rayDir,bestT),camPos),rayStart)
				if gB(31) then
					applyForce(bestObject,collPoint,mul3(rayDir,55))
					bestObject[11]=1.5
					ableToShoot=falseVar
				end
				if gB(2) then
					bestObject[12]={0,-9.81,0}
				end
				
				collPointCamRelative=multVectorByMatrix(sub3(collPoint,camPos),cameraRotationMatrix)
				collPointScreenPos={collPointCamRelative[1]*screenScale/collPointCamRelative[3],
				collPointCamRelative[2]*screenScale/collPointCamRelative[3]}
			end
		end
		
		--collideAtAll = falseVar
		collCals = 0
		for i,object1 in ipairsVar(objects) do
			for j,object2 in ipairsVar(objects) do
				if i~=j and (object1[10]>0 or object2[10]>0 or object1[11]>0 or object2[11]>0)
				 and dist3(object1[1],object2[1])<=object1[13]+object2[13] then
					collCals=collCals+1
					isColliding = gjkCollisionDetection(object1[9],object2[9])
					--monkeyCollision = gjkCollisionDetection(objects[1][7],objects[2][7])
					if isColliding then
						if object1[14]=="icoball" and object2[14]=="bowling_pin" then
							ballHit = trueVar
						end
						--collideAtAll = trueVar
						gjkSupport(object1[9],isColliding[1])
						collPoints1 = pointList
						gjkSupport(object2[9],mul3(isColliding[1],-1))
						collPoints2 = pointList
						
						if #collPoints1==1 then
							trueContactPoint = collPoints1[1]
						elseif #collPoints2==1 then
							trueContactPoint = collPoints2[1]
						elseif #collPoints1==2 and #collPoints2==2 then -- https://en.wikipedia.org/wiki/Skew_lines#Distance
							direction1=sub3(collPoints1[2],collPoints1[1])
							direction2=sub3(collPoints2[2],collPoints2[1])
							normal2 = cross(direction2,cross(direction1,direction2))
							trueContactPoint = add3(collPoints1[1],
							mul3(direction1,
							dot(sub3(collPoints2[1],collPoints1[1]),normal2) / dot(direction1,normal2)))
						else
							trueContactPoint = object1[13]>object2[13] and collPoints2[1] or collPoints1[1]
						end
						--velocity1 = object1[2]
						--velocity2 = object2[2]
						
						calcNormal(object1,object2)
						
						if totalVelocityNormal>0 then
							--totalInverseResistance = object1[10]+object2[10]
							--totalForce = mul3(isColliding[1],totalVelocity*(0.5-0.25*(abs(object1[10]-object2[10])/totalInverseResistance))) -- the inverse resistance maths causes a mult of 0.5 between identically weighted objects
							-- and a multiplier of 0.25 between very differently weighted objects
							--applyForce(object1,trueContactPoint,mul3(totalForce,-1))
							--applyForce(object2,trueContactPoint,totalForce)
							
							--object1[1] = add3(object1[1],mul3(isColliding[1],-isColliding[2]*object1[10]/totalInverseResistance))
							--object2[1] = add3(object2[1],mul3(isColliding[1],isColliding[2]*object2[10]/totalInverseResistance))
							
							movementFromPushing = getMovementPerUnitForce(object1,trueContactPoint,isColliding[1]) + getMovementPerUnitForce(object2,trueContactPoint,isColliding[1])
							-- ^ should technically be velocityChangeFromPushing, but that's a bit long for my tastes
							
							desiredChangeInVelocity = totalVelocityNormal*1
							pushForce = desiredChangeInVelocity/movementFromPushing
							
							applyForce(object1,trueContactPoint,mul3(isColliding[1],-pushForce))
							applyForce(object2,trueContactPoint,mul3(isColliding[1],pushForce))
							
							-- re-calculating velocites since they will have changed
							-- this step bugs me but it produces inaccurate & visibly wrong results otherwise
							
							calcNormal(object1,object2)
							
							totalVelocityTangential = sub3(totalVelocity,mul3(isColliding[1],totalVelocityNormal))
							
							totalSpeedTangential = dist3(totalVelocityTangential,{0,0,0})
							if totalSpeedTangential>0.001 then
								unitFriction = norm3(totalVelocityTangential)
								movementFromFriction = getMovementPerUnitForce(object1,trueContactPoint,unitFriction) + getMovementPerUnitForce(object2,trueContactPoint,unitFriction)
								frictionForce = mn(totalSpeedTangential/movementFromFriction, pushForce*0.3) -- the last number is friction coefficient
								
								applyForce(object1,trueContactPoint,mul3(unitFriction,-frictionForce))
								applyForce(object2,trueContactPoint,mul3(unitFriction,frictionForce))
							end
							
							totalInverseResistance = object1[10]+object2[10]
							object1[1] = add3(object1[1],mul3(isColliding[1],-isColliding[2]*object1[10]/totalInverseResistance))
							object2[1] = add3(object2[1],mul3(isColliding[1],isColliding[2]*object2[10]/totalInverseResistance))
						end
					end
				end
			end
		end
		
		
		table.sort(renderTris,function(a,b)return a[7]>b[7]end)
		
		
	end

	httpTk=httpTk+1
	--async.httpGet(8,"")
end

function onDraw()
	screenVar=screen
	local triF,tri,rec,stCl=screenVar.drawTriangleF,screenVar.drawTriangle,screenVar.drawRectF,screenVar.setColor --locals are faster because lua
	w = screenVar.getWidth()
	h = screenVar.getHeight()
	w2=w/2
	h2=h/2
	screenScale = w2/tan(fov/2)
	
	
	
	--text(1,1,"TPS: ")
	--text(26,1,httpTkP)
	
	
	--for i=1,#allM do
	--	stCl(255,255,255)
	--	text(0,i*6-5,allM[i])
	--	text(20,i*6-5,M[allM[i]])
	--end
	
	if loaded then
		--text(1,1,standingPins)
		
		for i=1,#renderTris do
			curTri = renderTris[i]
			p1 = curTri[1]
			p2 = curTri[2]
			p3 = curTri[3]
			stCl(curTri[4],curTri[5],curTri[6])
			triF(p1[1]+w2,p1[2]+h2,p2[1]+w2,p2[2]+h2,p3[1]+w2,p3[2]+h2)
			stCl(curTri[4]*0.5,curTri[5]*0.5,curTri[6]*0.5)
			tri(p1[1]+w2,p1[2]+h2-0.5,p2[1]+w2,p2[2]+h2-0.5,p3[1]+w2,p3[2]+h2-0.5)
		end
		
		--if collideAtAll then
		--	stCl(255,255,0)
		--	for i=1,#collPoints1 do
		--		crPoint=multVectorByMatrix(sub3(collPoints1[i],camPos),cameraRotationMatrix)
		--		crPoint=mul(mul(crPoint,1/crPoint[3]),screenScale)
		--		rec(w2+crPoint[1]-2,h2-crPoint[2]-2,5,5)
		--	end
		--		stCl(0,255,255)
		--	for i=1,#collPoints2 do
		--		crPoint=multVectorByMatrix(sub3(collPoints2[i],camPos),cameraRotationMatrix)
		--		crPoint=mul(mul(crPoint,1/crPoint[3]),screenScale)
		--		rec(w2+crPoint[1]-2,h2-crPoint[2]-2,5,5)
		--	end
		--	if trueContactPoint then
		--		stCl(255,0,255)
		--		crPoint=multVectorByMatrix(sub3(trueContactPoint,camPos),cameraRotationMatrix)
		--		crPoint=mul(mul(crPoint,1/crPoint[3]),screenScale)
		--		rec(w2+crPoint[1]-2,h2-crPoint[2]-2,5,5)
		--	end
		--end
		
		
		
		--if monkeyCollision then
		--	text(1,1,"Collision:")
		--	for i=1,3 do
		--		text(1,i*6+1,stringRound3(monkeyCollision[1][i]))
		--	end
		--	text(1,4*6+1,stringRound3(monkeyCollision[2]))
		--end
		--if trueContactPoint then
		--	for i=1,3 do
		--		text(1,i*6+37,stringRound3(trueContactPoint[i]))
		--	end
		--end
		--text(1,1,"Orientation Quaternion:")
		--for i=1,4 do
		--	text(1,i*6+1,stringRound3(monkeyRotationQuaternion[i]))
		--end
		--text(1,37,"Rotational Velocity:")
		--for i=1,3 do
		--	text(1,i*6+37,stringRound3(monkeyRotationVelocity[i]))
		--end
		--text(1,73,"Ray col pos:")
		--for i=1,3 do
		--	text(1,i*6+73,stringRound3(collPointMonkeyRelative[i]))
		--end
		--text(1,109,"Ray dir:")
		--for i=1,3 do
		--	text(1,i*6+109,stringRound3(collDirMonkeyRelative[i]))
		--end
		
		--text(100,1,monkeyRayHit and "YES" or "NO")
		
		if overalRayHit then
			recSize=30/collPointCamRelative[3]
			rec(collPointScreenPos[1]+w2-(recSize//2),-collPointScreenPos[2]+h2-(recSize//2),recSize,recSize)
		end
	end
end