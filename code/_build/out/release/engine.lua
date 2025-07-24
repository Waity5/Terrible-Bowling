
ab=255
J=.5
aj=.3
N=math
cm=N.max
cc=N.min
sqrt=math.sqrt
de=N.floor
pi=N.pi
br=input.getNumber
bj=input.getBool
dh=output.setBool
aq=true
an=false
ax=ipairs
abs=N.abs
ce=table.remove
bv=string
sin=N.sin
cos=N.cos
tan=N.tan
unpack=table.unpack
bX=math.huge
function aK(_,a)return{(_[1]+a[1]),(_[2]+a[2])}end
function aA(_,a)return{(_[1]-a[1]),(_[2]-a[2])}end
function aW(_,a)return{_[1]*a,_[2]*a}end
function r(_,a)return{_[1]+a[1],_[2]+a[2],_[3]+a[3]}end
function e(_,a)return{_[1]-a[1],_[2]-a[2],_[3]-a[3]}end
function f(_,a)return{_[1]*a,_[2]*a,_[3]*a}end
function bm(_,a,n)return i(e(a,_),e(n,_))end
function aB(_)return f(_,1/sqrt(_[1]^2+_[2]^2+_[3]^2))end
function cd(_,a)return sqrt((_[1]-a[1])^2+(_[2]-a[2])^2+(_[3]-a[3])^2)end
t={}aY=1
dj=3
Y=1
bN=aq
aE=0
bh=0
aG={0,aj,-2}L={0,0,0}cw=3
cA=1
bO=aj
cF=.6
aZ=62.5
bz=pi/180
dg=J/aZ
cV=5*bz/aZ
bU=.05/aZ
bw=20*bz
cJ=90*bz
bH=bw
bl=-19.5
cN=-3
ay=1
bh=0
by=1/62.5
function aI(b,bq,bT)cb=e(bq,b[1])return j(i(f(i(cb,bT),b[11]),cb),bT)+b[10]end
function al(b,bq,cv)cT=e(bq,b[1])b[5]=r(b[5],f(i(cT,cv),b[11]))b[2]=r(b[2],f(cv,b[10]))end
function ac(cD,m)local aa=-bX
for d,p in ax(cD)do
ai=j(p[2],m)if abs(ai-aa)<.0005 then
aR[#aR+1]=p[2]elseif ai>aa then
cf=p[2]aR={cf}aa=ai
end
end
return cf
end
function cI(bB,ca)m={1,0,0}x={}for di=1,32 do
h=e(ac(bB,m),ac(ca,f(m,-1)))if j(h,m)<=0 then
return
end
x={h,x[1],x[2],x[3]}_,a,n,V=unpack(x)if V then
z=e(a,_)T=e(n,_)cu=e(V,_)w=f(_,-1)Q=i(z,T)bP=i(T,cu)cp=i(cu,z)if j(Q,w)>0 then
x={_,a,n}m=Q
elseif j(bP,w)>0 then
x={_,n,V}m=bP
elseif j(cp,w)>0 then
x={_,V,a}m=cp
else
Z={{_,a,n},{_,n,V},{_,V,a},{a,V,n}}for d,p in ipairs(Z)do
p[4]=aB(bm(p[1],p[2],p[3]))end
for dc=1,32 do
aa=bX
for d,p in ipairs(Z)do
ai=j(p[1],p[4])if ai<aa then
aa=ai
bW=p
end
end
m=bW[4]h=e(ac(bB,m),ac(ca,f(m,-1)))if j(h,m)-.001<=aa then
return{bW[4],j(h,m)}end
aw={}for d=#Z,1,-1 do
aN=Z[d]if j(aN[4],e(h,aN[1]))>0 then
for g=1,3 do
ap={aN[g],aN[(g%3)+1]}for aU,cl in ipairs(aw)do
if cl[1]==ap[2]and cl[2]==ap[1]then
ce(aw,aU)ap=df
break
end
end
if ap then
aw[#aw+1]=ap
end
end
ce(Z,d)end
end
for d,p in ipairs(aw)do
am={p[1],p[2],h}am[4]=aB(bm(am[1],am[2],am[3]))Z[#Z+1]=am
end
end
return
end
elseif n then
z=e(a,_)T=e(n,_)w=f(_,-1)Q=i(z,T)if j(i(Q,T),w)>0 then
x={_,n}m=i(i(T,w),T)elseif j(i(z,Q),w)>0 then
x={_,a}m=i(i(z,w),z)else
if j(Q,w)>0 then
m=Q;
else
x={_,n,a}m=f(Q,-1)end
end
elseif a then
z=e(a,_)w=f(_,-1)if j(z,w)>0 then
m=i(i(z,w),z)else
x={_}m=w
end
else
x={_}m=f(_,-1)end
end
end
function ao(H,B)B=B or{}ch={}g=1
for d=t[1][H][1],t[1][H][2]do
o=t[2][d]ch[g]={{o[1],o[2],o[3]},{}}g=g+1
end
cr={}g=1
for d=t[1][H][3],t[1][H][4]do
o=t[3][d]cr[g]=o
g=g+1
end
cg={}g=1
for d=t[1][H][5],t[1][H][6]do
o=t[2][d]cg[g]={{o[1],o[2],o[3]},{}}g=g+1
end
cU={B[1]or{0,0,0},B[2]or{0,0,0},B[3]or{0,0,0},B[4]or{1,0,0,0},B[5]or{0,0,0},B[6]or{0,0,0},ch,cr,cg,B[7]or 1,B[8]or 1,B[9]or{0,0,0},t[1][H][7],H}K[#K+1]=cU
end
function cK(cY,ag,_,a,n)bY=e(a,_)bZ=e(n,_)cx=i(bY,bZ)bJ=-j(ag,cx)bi=1.0/bJ
co=e(cY,_)cj=i(co,ag)bD=j(bZ,cj)*bi
p=-j(bY,cj)*bi
bt=j(co,cx)*bi
return(-bJ>=1e-6 and bt>=.0 and bD>=.0 and p>=.0 and(bD+p)<=1.0)end
function i(_,a)return{_[2]*a[3]-_[3]*a[2],_[3]*a[1]-_[1]*a[3],_[1]*a[2]-_[2]*a[1]}end
function j(_,a)return _[1]*a[1]+_[2]*a[2]+_[3]*a[3]end
function cC(E)if E[1]==0 and E[2]==0 and E[3]==0 then
return{1,0,0,0}else
return{0,E[1],E[2],E[3]}end
end
function cz(aQ,E)local bg=cZ(aQ,cC(E))for d=1,4 do
bg[d]=aQ[d]+bg[d]*J
end
return bg
end
function cZ(cB,cP)local aF,aH,aP,aM=unpack(cB)local u,aT,aL,aC=unpack(cP)return{aF*u-aH*aT-aP*aL-aM*aC,aF*aT+aH*u+aP*aC-aM*aL,aF*aL-aH*aC+aP*u+aM*aT,aF*aC+aH*aL-aP*aT+aM*u}end
function bb(E,d_)local bL={}for g=1,3 do
o=0
for aU=1,3 do
o=o+E[aU]*d_[g][aU]end
bL[g]=o
end
return bL
end
function cs(_,ak)ak=1/sqrt(_[1]^2+_[2]^2+_[3]^2+_[4]^2)return{_[1]*ak,_[2]*ak,_[3]*ak,_[4]*ak}end
function cQ(aQ)local O,F,G,I=unpack(aQ)return{{1-(2*G*G+2*I*I),2*F*G+2*I*O,2*F*I-2*G*O},{2*F*G-2*I*O,1-(2*F*F+2*I*I),2*G*I+2*F*O},{2*F*I+2*G*O,2*G*I-2*F*O,1-(2*F*F+2*G*G)}}end
function httpReply(_,a,n)dd=aE//2
aE=0
end
function onTick()for g=1,1 do
if bj(32)and not bn then
bk=property.getText(aY)d=1
D=""
o=bv.sub(bk,d,d)while o~=""do
bV=bv.byte(o)if bV>64 then
D=(D..bV-65)+0
if Y==1 then
bI=D
t[D]=t[D]or{}elseif Y==2 then
cX=D
av=0
elseif Y==3 then
bp=D
else
if av==0 then
av=cX
bp=bp-1
ba={}t[bI][#t[bI]+1]=ba
end
ba[#ba+1]=D
av=av-1
Y=cm(av,bp)>0 and Y-1 or 0
end
Y=Y+1
D=""
else
D=D..o
end
d=d+1
o=bv.sub(bk,d,d)end
aY=aY+1
bn=bk==""
end
end
if bn then
bh=bh+1
if bN then
ct=an
c_=aq
K={}ar={0,-.15,0}ao("icoball",{[1]={0,.4,bl},[7]=.2,[8]=10,[9]={0,-9.81,0}})ao("bowling_lane1",{[1]={0,-.2,-8.15},[7]=0,[8]=0})ao("bowling_lane2",{[1]={0,-.2,-18.4},[7]=0,[8]=0})ao("bowling_lane3",{[1]={0,-.2,-19.5},[7]=0,[8]=0})for d=1,4 do
for g=1,d do
ao("bowling_pin",{[1]={(g-d/2-J)*aj,.15,(d-1)*sqrt(aj^2-.15^2)},[7]=.75,[8]=50,[9]={0,-5,0}})end
end
end
bd=cc((K[1][1][3]-bl)/(cN-bl),1)bQ=cw+(cA-cw)*bd
bH=bw+(cJ-bw)*bd
cH=bO+(cF-bO)*bd
if not ct then
L[1]=L[1]-br(3)*cV
L[2]=-.01
ar[2]=ar[2]+br(2)*bU
ar[1]=ar[1]+br(1)*bU
aG={sin(L[1])*bQ,cH,-cos(L[1])*bQ+K[1][1][3]}end
_=L[1]a=L[2]n=L[3]ad=cos(_)ah=sin(_)ae=cos(a)af=sin(a)au=cos(n)az=sin(n)bK={{ad*au-ah*af*az,-ae*az,ad*af*az+au*ah},{ad*az+au*ah*af,ae*au,ah*az-ad*au*af},{-ae*ah,af,ad*ae}}bG={-ah*ae,af,ad*ae}bF=an
C={}for H=1,#K do
b=K[H]b[4]=cs(cz(b[4],f(b[5],-by)))b[1]=r(b[1],f(b[2],by))b[2]=r(b[2],f(b[3],by))b[3]=f(b[12],1)if b[14]=="bowling_pin" then
b[5]=f(b[5],.9)end
cE=cQ(cs(b[4]))for d=7,9,2 do
for g=1,#b[d]do
h=b[d][g]h[2]=bb(h[1],cE)h[2]=r(h[2],b[1])h[3]=e(h[2],aG)h[4]=bb(h[3],bK)cL=h[3]h[7]=cL[3]h[5]={h[4][1]*ay/h[4][3],-h[4][2]*ay/h[4][3]}h[6]=h[4][3]>0 and 1 or-1
end
end
if b[11]>0 or not b[8][1][8]then
for d=1,#b[8]do
c=b[8][d]c[8]=bm(b[7][c[1]][2],b[7][c[2]][2],b[7][c[3]][2])end
end
for d,c in ax(b[8])do
v=b[7][c[1]]y=b[7][c[2]]A=b[7][c[3]]c[7]=cm(v[7],y[7],A[7])_=c[8]a=v[3]if j(_,a)>0 then
at=v[6]+y[6]+A[6]if at==3 then
C[#C+1]={v[5],y[5],A[5],c[4],c[5],c[6],c[7]}elseif at>=-1 then
if v[6]==-at then
U=v[5]X=y[5]M=A[5]elseif y[6]==-at then
U=y[5]X=v[5]M=A[5]else
U=A[5]X=y[5]M=v[5]end
if at==1 then
aD=aK(aW(aA(X,U),1000),X)bo=aK(aW(aA(M,U),1000),M)C[#C+1]={X,aD,M,c[4],c[5],c[6],c[7]}C[#C+1]={M,aD,bo,c[4],c[5],c[6],c[7]}else
aD=aK(aW(aA(U,X),1000),X)bo=aK(aW(aA(U,M),1000),M)C[#C+1]={U,aD,bo,c[4],c[5],c[6],c[7]}end
end
end
end
end
if c_ then
cn=an
be=2^16
ag=aB({bG[1],0,bG[3]})cq=ar
for d,b in ax(K)do
if b[14]=="icoball" then
for g=1,#b[8]do
c=b[8][g]db=cK(cq,ag,b[7][c[1]][3],b[7][c[2]][3],b[7][c[3]][3])if db and bt<be then
cn=aq
be=bt
b_=b
end
end
end
end
if cn then
bF=aq
bM=r(r(f(ag,be),aG),cq)if bj(31)then
al(b_,bM,f(ag,50))b_[11]=1
c_=an
end
if bj(2)then
b_[12]={0,-9.81,0}end
as=bb(e(bM,aG),bK)ck={as[1]*ay/as[3],as[2]*ay/as[3]}end
end
bu=0
for d,k in ax(K)do
for g,l in ax(K)do
if d~=g and(k[10]>0 or l[10]>0 or k[11]>0 or l[11]>0)and cd(k[1],l[1])<=k[13]+l[13]then
bu=bu+1
s=cI(k[9],l[9])if s then
if k[14]=="icoball" and l[14]=="bowling_pin" then
ct=aq
end
ac(k[9],s[1])P=aR
ac(l[9],f(s[1],-1))W=aR
if#P==1 then
q=P[1]elseif#W==1 then
q=W[1]elseif#P==2 and#W==2 then
bc=e(P[2],P[1])bS=e(W[2],W[1])bA=i(bS,i(bc,bS))q=r(P[1],f(bc,j(e(W[1],P[1]),bA)/j(bc,bA)))else
if k[13]>l[13]then
q=W[1]else
q=P[1]end
end
bf=r(i(k[5],e(q,k[1])),k[2])bx=r(i(l[5],e(q,l[1])),l[2])aS=e(bf,bx)aJ=j(s[1],aS)if aJ>0 then
cR=aI(k,q,s[1])+aI(l,q,s[1])cS=aJ*1
bs=cS/cR
al(k,q,f(s[1],-bs))al(l,q,f(s[1],bs))bf=r(i(k[5],e(q,k[1])),k[2])bx=r(i(l[5],e(q,l[1])),l[2])aS=e(bf,bx)aJ=j(s[1],aS)bC=e(aS,f(s[1],aJ))ci=cd(bC,{0,0,0})if ci>.001 then
aV=aB(bC)cG=aI(k,q,aV)+aI(l,q,aV)bR=cc(ci/cG,bs*aj)al(k,q,f(aV,-bR))al(l,q,f(aV,bR))end
bE=k[10]+l[10]k[1]=r(k[1],f(s[1],-s[2]*k[10]/bE))l[1]=r(l[1],f(s[1],s[2]*l[10]/bE))end
end
end
end
end
table.sort(C,function(_,a)return _[7]>a[7]end)bN=an
end
aE=aE+1
end
function onDraw()R=screen
local cM,da,cy,aX,cW=R.drawTriangleF,R.drawTriangle,R.drawRectF,R.setColor,R.drawText
O=R.getWidth()cO=R.getHeight()u=O/2
S=cO/2
ay=u/tan(bH/2)aX(ab,ab,ab)if bn then
for d=1,#C do
c=C[d]v=c[1]y=c[2]A=c[3]aX(c[4],c[5],c[6])cM(v[1]+u,v[2]+S,y[1]+u,y[2]+S,A[1]+u,A[2]+S)aX(c[4]*J,c[5]*J,c[6]*J)da(v[1]+u,v[2]+S-J,y[1]+u,y[2]+S-J,A[1]+u,A[2]+S-J)end
aX(ab,ab,ab)cW(1,1,bu)if bF then
aO=30/as[3]cy(ck[1]+u-(aO//2),-ck[2]+S-(aO//2),aO,aO)end
end
end
