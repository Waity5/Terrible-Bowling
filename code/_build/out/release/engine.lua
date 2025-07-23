
z=255
Q=.5
O=math
ck=O.max
bQ=O.min
sqrt=math.sqrt
cS=O.floor
pi=O.pi
ae=input.getNumber
P=input.getBool
cU=output.setBool
bf=true
aE=false
ax=ipairs
abs=O.abs
bz=table.remove
bv=string
sin=O.sin
cos=O.cos
tan=O.tan
unpack=table.unpack
bZ=math.huge
function aP(_,a)return{(_[1]+a[1]),(_[2]+a[2])}end
function aB(_,a)return{(_[1]-a[1]),(_[2]-a[2])}end
function aD(_,a)return{_[1]*a,_[2]*a}end
function t(_,a)return{_[1]+a[1],_[2]+a[2],_[3]+a[3]}end
function f(_,a)return{_[1]-a[1],_[2]-a[2],_[3]-a[3]}end
function e(_,a)return{_[1]*a,_[2]*a,_[3]*a}end
function be(_,a,p)return i(f(a,_),f(p,_))end
function b_(_)return e(_,1/sqrt(_[1]^2+_[2]^2+_[3]^2))end
function cg(_,a)return sqrt((_[1]-a[1])^2+(_[2]-a[2])^2+(_[3]-a[3])^2)end
s={}bt=1
cR=3
W=1
ca=bf
aU=0
bd=0
M={0,.3,-1}C={0,0,0}bS=62.5
bM=pi/180
aX=3/bS
bA=90*bM/bS
cJ=90*bM
ao=1
bd=0
bu=1/62.5
function aA(b,bm,bJ)bT=f(bm,b[1])return j(i(e(i(bT,bJ),b[11]),bT),bJ)+b[10]end
function aj(b,bm,bY)cv=f(bm,b[1])b[5]=t(b[5],e(i(cv,bY),b[11]))b[2]=t(b[2],e(bY,b[10]))end
function al(ct,m)local ab=-bZ
for c,o in ax(ct)do
ah=j(o[2],m)if abs(ah-ab)<.0005 then
aM[#aM+1]=o[2]elseif ah>ab then
bO=o[2]aM={bO}ab=ah
end
end
return bO
end
function cH(bC,bH)m={1,0,0}x={}for cV=1,32 do
h=f(al(bC,m),al(bH,e(m,-1)))if j(h,m)<=0 then
return
end
x={h,x[1],x[2],x[3]}_,a,p,aa=unpack(x)if aa then
F=f(a,_)V=f(p,_)cm=f(aa,_)w=e(_,-1)S=i(F,V)cn=i(V,cm)bE=i(cm,F)if j(S,w)>0 then
x={_,a,p}m=S
elseif j(cn,w)>0 then
x={_,p,aa}m=cn
elseif j(bE,w)>0 then
x={_,aa,a}m=bE
else
ac={{_,a,p},{_,p,aa},{_,aa,a},{a,aa,p}}for c,o in ipairs(ac)do
o[4]=b_(be(o[1],o[2],o[3]))end
for cP=1,32 do
ab=bZ
for c,o in ipairs(ac)do
ah=j(o[1],o[4])if ah<ab then
ab=ah
bD=o
end
end
m=bD[4]h=f(al(bC,m),al(bH,e(m,-1)))if j(h,m)-.001<=ab then
return{bD[4],j(h,m)}end
ap={}for c=#ac,1,-1 do
aL=ac[c]if j(aL[4],f(h,aL[1]))>0 then
for g=1,3 do
aq={aL[g],aL[(g%3)+1]}for aH,bw in ipairs(ap)do
if bw[1]==aq[2]and bw[2]==aq[1]then
bz(ap,aH)aq=cT
break
end
end
if aq then
ap[#ap+1]=aq
end
end
bz(ac,c)end
end
for c,o in ipairs(ap)do
an={o[1],o[2],h}an[4]=b_(be(an[1],an[2],an[3]))ac[#ac+1]=an
end
end
return
end
elseif p then
F=f(a,_)V=f(p,_)w=e(_,-1)S=i(F,V)if j(i(S,V),w)>0 then
x={_,p}m=i(i(V,w),V)elseif j(i(F,S),w)>0 then
x={_,a}m=i(i(F,w),F)else
if j(S,w)>0 then
m=S;
else
x={_,p,a}m=e(S,-1)end
end
elseif a then
F=f(a,_)w=e(_,-1)if j(F,w)>0 then
m=i(i(F,w),F)else
x={_}m=w
end
else
x={_}m=e(_,-1)end
end
end
function aW(I,E)E=E or{}bB={}g=1
for c=s[1][I][1],s[1][I][2]do
n=s[2][c]bB[g]={{n[1],n[2],n[3]},{}}g=g+1
end
bR={}g=1
for c=s[1][I][3],s[1][I][4]do
n=s[3][c]bR[g]=n
g=g+1
end
bG={}g=1
for c=s[1][I][5],s[1][I][6]do
n=s[2][c]bG[g]={{n[1],n[2],n[3]},{}}g=g+1
end
cx={E[1]or{0,0,0},E[2]or{0,0,0},E[3]or{0,0,0},E[4]or{1,0,0,0},E[5]or{0,0,0},E[6]or{0,0,0},bB,bR,bG,E[7]or 1,E[8]or 1,E[9]or{0,0,0},s[1][I][7],I}L[#L+1]=cx
end
function cE(cK,cc,_,a,p)bN=f(a,_)by=f(p,_)cb=i(bN,by)ch=-j(cc,cb)bg=1.0/ch
co=f(cK,_)bP=i(co,cc)bx=j(by,bP)*bg
o=-j(bN,bP)*bg
br=j(co,cb)*bg
return(-ch>=1e-6 and br>=.0 and bx>=.0 and o>=.0 and(bx+o)<=1.0)end
function i(_,a)return{_[2]*a[3]-_[3]*a[2],_[3]*a[1]-_[1]*a[3],_[1]*a[2]-_[2]*a[1]}end
function j(_,a)return _[1]*a[1]+_[2]*a[2]+_[3]*a[3]end
function cD(J)if J[1]==0 and J[2]==0 and J[3]==0 then
return{1,0,0,0}else
return{0,J[1],J[2],J[3]}end
end
function cN(aS,J)local bb=cr(aS,cD(J))for c=1,4 do
bb[c]=aS[c]+bb[c]*Q
end
return bb
end
function cr(cw,cI)local aF,aR,aC,aO=unpack(cw)local v,aK,aT,aG=unpack(cI)return{aF*v-aR*aK-aC*aT-aO*aG,aF*aK+aR*v+aC*aG-aO*aT,aF*aT-aR*aG+aC*v+aO*aK,aF*aG+aR*aT-aC*aK+aO*v}end
function ba(J,cM)local bF={}for g=1,3 do
n=0
for aH=1,3 do
n=n+J[aH]*cM[g][aH]end
bF[g]=n
end
return bF
end
function bV(_,ay)ay=1/sqrt(_[1]^2+_[2]^2+_[3]^2+_[4]^2)return{_[1]*ay,_[2]*ay,_[3]*ay,_[4]*ay}end
function cL(aS)local T,K,H,G=unpack(aS)return{{1-(2*H*H+2*G*G),2*K*H+2*G*T,2*K*G-2*H*T},{2*K*H-2*G*T,1-(2*K*K+2*G*G),2*H*G+2*K*T},{2*K*G+2*H*T,2*H*G-2*K*T,1-(2*K*K+2*H*H)}}end
function httpReply(_,a,p)cQ=aU//2
aU=0
end
function onTick()for g=1,1 do
if P(32)and not bh then
bc=property.getText(bt)c=1
D=""
n=bv.sub(bc,c,c)while n~=""do
bI=bv.byte(n)if bI>64 then
D=(D..bI-65)+0
if W==1 then
c_=D
s[D]=s[D]or{}elseif W==2 then
cy=D
at=0
elseif W==3 then
bj=D
else
if at==0 then
at=cy
bj=bj-1
bq={}s[c_][#s[c_]+1]=bq
end
bq[#bq+1]=D
at=at-1
W=ck(at,bj)>0 and W-1 or 0
end
W=W+1
D=""
else
D=D..n
end
c=c+1
n=bv.sub(bc,c,c)end
bt=bt+1
bh=bc==""
end
end
if bh then
bd=bd+1
if ca then
L={}aW("icoball",{[1]={0,.4,-1},[7]=.2,[8]=10,[9]={0,-9.81,0}})aW("wide_cube",{[1]={0,-1,0},[7]=0,[8]=0})for c=1,4 do
for g=1,c do
aW("bowling_pin",{[1]={(g-c/2-Q)*.3,.15,(c-1)*sqrt(.3^2-.15^2)},[7]=.75,[8]=50,[9]={0,-9.81,0}})end
end
end
if P(31)then
M[2]=M[2]+ae(2)*aX
else
M[1]=M[1]+(ae(1)*cos(C[1])-ae(2)*sin(C[1]))*aX
M[3]=M[3]+(ae(1)*sin(C[1])+ae(2)*cos(C[1]))*aX
end
C[1]=C[1]-ae(3)*bA
C[2]=C[2]+ae(4)*bA
U=0
if P(1)then
aj(L[1],L[1][1],{0,0,1})end
if P(31)then
aY=.05
else
aY=.01
end
ar={z,z,z}if P(1)then
U=-aY
ar={0,0,z}end
if P(3)then
U=aY
ar={z,0,0}end
if not P(31)then
for c=1,3 do
ar[c]=bQ(ar[c]+50,z)end
end
_=C[1]a=C[2]p=C[3]ai=cos(_)am=sin(_)ag=cos(a)af=sin(a)av=cos(p)as=sin(p)bK={{ai*av-am*af*as,-ag*as,ai*af*as+av*am},{ai*as+av*am*af,ag*av,am*as-ai*av*af},{-ag*am,af,ai*ag}}bp={-am*ag,af,ai*ag}bU=aE
B={}for I=1,#L do
b=L[I]b[4]=bV(cN(b[4],e(b[5],-bu)))b[1]=t(b[1],e(b[2],bu))b[2]=t(b[2],e(b[3],bu))b[3]=e(b[12],1)b[2]=e(b[2],.9995)b[5]=e(b[5],.9995)cu=cL(bV(b[4]))for c=7,9,2 do
for g=1,#b[c]do
h=b[c][g]h[2]=ba(h[1],cu)h[2]=t(h[2],b[1])h[3]=f(h[2],M)h[4]=ba(h[3],bK)bo=h[3]h[7]=sqrt(bo[1]^2+bo[2]^2+bo[3]^2)h[5]={h[4][1]*ao/h[4][3],-h[4][2]*ao/h[4][3]}h[6]=h[4][3]>0 and 1 or-1
end
end
if b[11]>0 or not b[8][1][8]then
for c=1,#b[8]do
d=b[8][c]d[8]=be(b[7][d[1]][2],b[7][d[2]][2],b[7][d[3]][2])end
end
for c,d in ax(b[8])do
u=b[7][d[1]]y=b[7][d[2]]A=b[7][d[3]]d[7]=ck(u[7],y[7],A[7])_=d[8]a=u[3]if j(_,a)>0 then
az=u[6]+y[6]+A[6]if az==3 then
B[#B+1]={u[5],y[5],A[5],d[4],d[5],d[6],d[7]}elseif az>=-1 then
if u[6]==-az then
X=u[5]Z=y[5]R=A[5]elseif y[6]==-az then
X=y[5]Z=u[5]R=A[5]else
X=A[5]Z=y[5]R=u[5]end
if az==1 then
aN=aP(aD(aB(Z,X),1000),Z)bk=aP(aD(aB(R,X),1000),R)B[#B+1]={Z,aN,R,d[4],d[5],d[6],d[7]}B[#B+1]={R,aN,bk,d[4],d[5],d[6],d[7]}else
aN=aP(aD(aB(X,Z),1000),Z)bk=aP(aD(aB(X,R),1000),R)B[#B+1]={X,aN,bk,d[4],d[5],d[6],d[7]}end
end
end
end
end
if aE then
cp=aE
bl=2^16
for c,b in ax(L)do
for g=1,#b[8]do
d=b[8][g]cA=cE({0,0,0},bp,b[7][d[1]][3],b[7][d[2]][3],b[7][d[3]][3])if cA and br<bl then
cp=bf
bl=br
bX=b
end
end
end
if cp then
bU=bf
ce=t(e(bp,bl),M)aj(bX,ce,e(bp,U))if P(2)then
bX[12]={0,-9.81,0}end
au=ba(f(ce,M),bK)bW={au[1]*ao/au[3],au[2]*ao/au[3]}end
end
bs=0
for c,l in ax(L)do
for g,k in ax(L)do
if c~=g and(l[10]>0 or k[10]>0 or l[11]>0 or k[11]>0)and cg(l[1],k[1])<=l[13]+k[13]then
bs=bs+1
r=cH(l[9],k[9])if r then
al(l[9],r[1])N=aM
al(k[9],e(r[1],-1))ak=aM
if#N==1 then
q=N[1]elseif#ak==1 then
q=ak[1]elseif#N==2 and#ak==2 then
bi=f(N[2],N[1])cj=f(ak[2],ak[1])ci=i(cj,i(bi,cj))q=t(N[1],e(bi,j(f(ak[1],N[1]),ci)/j(bi,ci)))else
q=N[1]end
bn=t(i(l[5],f(q,l[1])),l[2])aZ=t(i(k[5],f(q,k[1])),k[2])aV=f(bn,aZ)aI=j(r[1],aV)if aI>0 then
cO=aA(l,q,r[1])+aA(k,q,r[1])cF=aI*1
U=cF/cO
aj(l,q,e(r[1],-U))aj(k,q,e(r[1],U))bn=t(i(l[5],f(q,l[1])),l[2])aZ=t(i(k[5],f(q,k[1])),k[2])aV=f(bn,aZ)aI=j(r[1],aV)cl=f(aV,e(r[1],aI))cf=cg(cl,{0,0,0})if cf>.001 then
aJ=b_(cl)cB=aA(l,q,aJ)+aA(k,q,aJ)cd=bQ(cf/cB,U*.3)aj(l,q,e(aJ,-cd))aj(k,q,e(aJ,cd))end
bL=l[10]+k[10]l[1]=t(l[1],e(r[1],-r[2]*l[10]/bL))k[1]=t(k[1],e(r[1],r[2]*k[10]/bL))end
end
end
end
end
table.sort(B,function(_,a)return _[7]>a[7]end)ca=aE
end
aU=aU+1
end
function onDraw()Y=screen
local cC,cq,cz,aw,cG=Y.drawTriangleF,Y.drawTriangle,Y.drawRectF,Y.setColor,Y.drawText
T=Y.getWidth()cs=Y.getHeight()v=T/2
ad=cs/2
ao=tan(cJ/2)*v
aw(z,z,z)if bh then
for c=1,#B do
d=B[c]u=d[1]y=d[2]A=d[3]aw(d[4],d[5],d[6])cC(u[1]+v,u[2]+ad,y[1]+v,y[2]+ad,A[1]+v,A[2]+ad)aw(d[4]*Q,d[5]*Q,d[6]*Q)cq(u[1]+v,u[2]+ad-Q,y[1]+v,y[2]+ad-Q,A[1]+v,A[2]+ad-Q)end
aw(z,z,z)cG(1,1,bs)aw(unpack(ar))if bU then
aQ=30/au[3]cz(bW[1]+v-(aQ//2),bW[2]+ad-(aQ//2),aQ,aQ)end
end
end
