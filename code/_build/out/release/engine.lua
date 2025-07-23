
z=255
O=.5
P=math
cg=P.max
cc=P.min
sqrt=math.sqrt
cU=P.floor
pi=P.pi
aa=input.getNumber
N=input.getBool
cQ=output.setBool
bd=true
aL=false
ay=ipairs
abs=P.abs
bx=table.remove
bo=string
sin=P.sin
cos=P.cos
tan=P.tan
unpack=table.unpack
bM=math.huge
function aP(_,a)return{(_[1]+a[1]),(_[2]+a[2])}end
function aF(_,a)return{(_[1]-a[1]),(_[2]-a[2])}end
function aV(_,a)return{_[1]*a,_[2]*a}end
function u(_,a)return{_[1]+a[1],_[2]+a[2],_[3]+a[3]}end
function f(_,a)return{_[1]-a[1],_[2]-a[2],_[3]-a[3]}end
function e(_,a)return{_[1]*a,_[2]*a,_[3]*a}end
function bq(_,a,o)return i(f(a,_),f(o,_))end
function bc(_)return e(_,1/sqrt(_[1]^2+_[2]^2+_[3]^2))end
function cj(_,a)return sqrt((_[1]-a[1])^2+(_[2]-a[2])^2+(_[3]-a[3])^2)end
r={}bj=1
cT=3
W=1
ce=bd
aE=0
br=0
L={0,.3,-1}B={0,0,0}cn=62.5
bQ=pi/180
bm=3/cn
co=90*bQ/cn
cK=90*bQ
aw=1
br=0
bf=1/62.5
function aQ(b,bt,bT)bK=f(bt,b[1])return j(i(e(i(bK,bT),b[11]),bK),bT)+b[10]end
function ah(b,bt,cd)cN=f(bt,b[1])b[5]=u(b[5],e(i(cN,cd),b[11]))b[2]=u(b[2],e(cd,b[10]))end
function am(cO,m)local Z=-bM
for c,n in ay(cO)do
af=j(n[2],m)if abs(af-Z)<.0005 then
aC[#aC+1]=n[2]elseif af>Z then
bU=n[2]aC={bU}Z=af
end
end
return bU
end
function cD(c_,bR)m={1,0,0}t={}for cV=1,32 do
h=f(am(c_,m),am(bR,e(m,-1)))if j(h,m)<=0 then
return
end
t={h,t[1],t[2],t[3]}_,a,o,ac=unpack(t)if ac then
F=f(a,_)ae=f(o,_)bN=f(ac,_)x=e(_,-1)Q=i(F,ae)bz=i(ae,bN)bA=i(bN,F)if j(Q,x)>0 then
t={_,a,o}m=Q
elseif j(bz,x)>0 then
t={_,o,ac}m=bz
elseif j(bA,x)>0 then
t={_,ac,a}m=bA
else
Y={{_,a,o},{_,o,ac},{_,ac,a},{a,ac,o}}for c,n in ipairs(Y)do
n[4]=bc(bq(n[1],n[2],n[3]))end
for cP=1,32 do
Z=bM
for c,n in ipairs(Y)do
af=j(n[1],n[4])if af<Z then
Z=af
ca=n
end
end
m=ca[4]h=f(am(c_,m),am(bR,e(m,-1)))if j(h,m)-.001<=Z then
return{ca[4],j(h,m)}end
az={}for c=#Y,1,-1 do
aN=Y[c]if j(aN[4],f(h,aN[1]))>0 then
for g=1,3 do
at={aN[g],aN[(g%3)+1]}for aS,bL in ipairs(az)do
if bL[1]==at[2]and bL[2]==at[1]then
bx(az,aS)at=cS
break
end
end
if at then
az[#az+1]=at
end
end
bx(Y,c)end
end
for c,n in ipairs(az)do
au={n[1],n[2],h}au[4]=bc(bq(au[1],au[2],au[3]))Y[#Y+1]=au
end
end
return
end
elseif o then
F=f(a,_)ae=f(o,_)x=e(_,-1)Q=i(F,ae)if j(i(Q,ae),x)>0 then
t={_,o}m=i(i(ae,x),ae)elseif j(i(F,Q),x)>0 then
t={_,a}m=i(i(F,x),F)else
if j(Q,x)>0 then
m=Q;
else
t={_,o,a}m=e(Q,-1)end
end
elseif a then
F=f(a,_)x=e(_,-1)if j(F,x)>0 then
m=i(i(F,x),F)else
t={_}m=x
end
else
t={_}m=e(_,-1)end
end
end
function bb(J,E)E=E or{}bG={}g=1
for c=r[1][J][1],r[1][J][2]do
p=r[2][c]bG[g]={{p[1],p[2],p[3]},{}}g=g+1
end
bH={}g=1
for c=r[1][J][3],r[1][J][4]do
p=r[3][c]bH[g]=p
g=g+1
end
bZ={}g=1
for c=r[1][J][5],r[1][J][6]do
p=r[2][c]bZ[g]={{p[1],p[2],p[3]},{}}g=g+1
end
cs={E[1]or{0,0,0},E[2]or{0,0,0},E[3]or{0,0,0},E[4]or{1,0,0,0},E[5]or{0,0,0},E[6]or{0,0,0},bG,bH,bZ,E[7]or 1,E[8]or 1,E[9]or{0,0,0},r[1][J][7],J}M[#M+1]=cs
end
function cw(cz,bB,_,a,o)bC=f(a,_)bO=f(o,_)bF=i(bC,bO)bE=-j(bB,bF)bi=1.0/bE
cb=f(cz,_)bw=i(cb,bB)bD=j(bO,bw)*bi
n=-j(bC,bw)*bi
aW=j(cb,bF)*bi
return(-bE>=1e-6 and aW>=.0 and bD>=.0 and n>=.0 and(bD+n)<=1.0)end
function i(_,a)return{_[2]*a[3]-_[3]*a[2],_[3]*a[1]-_[1]*a[3],_[1]*a[2]-_[2]*a[1]}end
function j(_,a)return _[1]*a[1]+_[2]*a[2]+_[3]*a[3]end
function cA(G)if G[1]==0 and G[2]==0 and G[3]==0 then
return{1,0,0,0}else
return{0,G[1],G[2],G[3]}end
end
function cq(aB,G)local bk=cv(aB,cA(G))for c=1,4 do
bk[c]=aB[c]+bk[c]*O
end
return bk
end
function cv(ct,cx)local aD,aI,aM,aH=unpack(ct)local w,aJ,aT,aO=unpack(cx)return{aD*w-aI*aJ-aM*aT-aH*aO,aD*aJ+aI*w+aM*aO-aH*aT,aD*aT-aI*aO+aM*w+aH*aJ,aD*aO+aI*aT-aM*aJ+aH*w}end
function bp(G,cM)local bJ={}for g=1,3 do
p=0
for aS=1,3 do
p=p+G[aS]*cM[g][aS]end
bJ[g]=p
end
return bJ
end
function bV(_,as)as=1/sqrt(_[1]^2+_[2]^2+_[3]^2+_[4]^2)return{_[1]*as,_[2]*as,_[3]*as,_[4]*as}end
function cr(aB)local T,K,I,H=unpack(aB)return{{1-(2*I*I+2*H*H),2*K*I+2*H*T,2*K*H-2*I*T},{2*K*I-2*H*T,1-(2*K*K+2*H*H),2*I*H+2*K*T},{2*K*H+2*I*T,2*I*H-2*K*T,1-(2*K*K+2*I*I)}}end
function httpReply(_,a,o)cR=aE//2
aE=0
end
function onTick()for g=1,1 do
if N(32)and not aY then
aX=property.getText(bj)c=1
C=""
p=bo.sub(aX,c,c)while p~=""do
bI=bo.byte(p)if bI>64 then
C=(C..bI-65)+0
if W==1 then
ck=C
r[C]=r[C]or{}elseif W==2 then
cB=C
av=0
elseif W==3 then
bh=C
else
if av==0 then
av=cB
bh=bh-1
be={}r[ck][#r[ck]+1]=be
end
be[#be+1]=C
av=av-1
W=cg(av,bh)>0 and W-1 or 0
end
W=W+1
C=""
else
C=C..p
end
c=c+1
p=bo.sub(aX,c,c)end
bj=bj+1
aY=aX==""
end
end
if aY then
br=br+1
if ce then
M={}bb("icoball",{[1]={0,.4,-1},[7]=.2,[8]=10,[9]={0,-9.81,0}})bb("wide_cube",{[1]={0,-1,0},[7]=0,[8]=0})for c=1,4 do
for g=1,c do
bb("bowling_pin",{[1]={(g-c/2-O)*.3,.15,(c-1)*sqrt(.3^2-.15^2)},[7]=.75,[8]=50,[9]={0,-9.81,0}})end
end
end
if N(31)then
L[2]=L[2]+aa(2)*bm
else
L[1]=L[1]+(aa(1)*cos(B[1])-aa(2)*sin(B[1]))*bm
L[3]=L[3]+(aa(1)*sin(B[1])+aa(2)*cos(B[1]))*bm
end
B[1]=B[1]-aa(3)*co
B[2]=B[2]+aa(4)*co
X=0
if N(1)then
ah(M[1],M[1][1],{0,0,1})end
if N(31)then
bn=.05
else
bn=.01
end
ap={z,z,z}if N(1)then
X=-bn
ap={0,0,z}end
if N(3)then
X=bn
ap={z,0,0}end
if not N(31)then
for c=1,3 do
ap[c]=cc(ap[c]+50,z)end
end
_=B[1]a=B[2]o=B[3]al=cos(_)aj=sin(_)ak=cos(a)ai=sin(a)ax=cos(o)ar=sin(o)by={{al*ax-aj*ai*ar,-ak*ar,al*ai*ar+ax*aj},{al*ar+ax*aj*ai,ak*ax,aj*ar-al*ax*ai},{-ak*aj,ai,al*ak}}bl={-aj*ak,ai,al*ak}ch=aL
D={}for J=1,#M do
b=M[J]b[4]=bV(cq(b[4],e(b[5],-bf)))b[1]=u(b[1],e(b[2],bf))b[2]=u(b[2],e(b[3],bf))b[3]=e(b[12],1)b[2]=e(b[2],.9995)b[5]=e(b[5],.9995)cy=cr(bV(b[4]))for c=7,9,2 do
for g=1,#b[c]do
h=b[c][g]h[2]=bp(h[1],cy)h[2]=u(h[2],b[1])h[3]=f(h[2],L)h[4]=bp(h[3],by)b_=h[3]h[7]=sqrt(b_[1]^2+b_[2]^2+b_[3]^2)h[5]={h[4][1]*aw/h[4][3],-h[4][2]*aw/h[4][3]}h[6]=h[4][3]>0 and 1 or-1
end
end
if b[11]>0 or not b[8][1][8]then
for c=1,#b[8]do
d=b[8][c]d[8]=bq(b[7][d[1]][2],b[7][d[2]][2],b[7][d[3]][2])end
end
for c,d in ay(b[8])do
v=b[7][d[1]]y=b[7][d[2]]A=b[7][d[3]]d[7]=cg(v[7],y[7],A[7])_=d[8]a=v[3]if j(_,a)>0 then
an=v[6]+y[6]+A[6]if an==3 then
D[#D+1]={v[5],y[5],A[5],d[4],d[5],d[6],d[7]}elseif an>=-1 then
if v[6]==-an then
ad=v[5]U=y[5]R=A[5]elseif y[6]==-an then
ad=y[5]U=v[5]R=A[5]else
ad=A[5]U=y[5]R=v[5]end
if an==1 then
aU=aP(aV(aF(U,ad),1000),U)bs=aP(aV(aF(R,ad),1000),R)D[#D+1]={U,aU,R,d[4],d[5],d[6],d[7]}D[#D+1]={R,aU,bs,d[4],d[5],d[6],d[7]}else
aU=aP(aV(aF(ad,U),1000),U)bs=aP(aV(aF(ad,R),1000),R)D[#D+1]={ad,aU,bs,d[4],d[5],d[6],d[7]}end
end
end
end
end
if aL then
bY=aL
bv=2^16
for c,b in ay(M)do
for g=1,#b[8]do
d=b[8][g]cC=cw({0,0,0},bl,b[7][d[1]][3],b[7][d[2]][3],b[7][d[3]][3])if cC and aW<bv then
bY=bd
bv=aW
cl=b
end
end
end
if bY then
ch=bd
bW=u(e(bl,bv),L)ah(cl,bW,e(bl,X))if N(2)then
cl[12]={0,-9.81,0}end
aq=bp(f(bW,L),by)bP={aq[1]*aw/aq[3],aq[2]*aw/aq[3]}end
end
bu=0
for c,l in ay(M)do
for g,k in ay(M)do
if c~=g and(l[10]>0 or k[10]>0 or l[11]>0 or k[11]>0)and cj(l[1],k[1])<=l[13]+k[13]then
bu=bu+1
s=cD(l[9],k[9])if s then
am(l[9],s[1])S=aC
am(k[9],e(s[1],-1))ag=aC
if#S==1 then
q=S[1]elseif#ag==1 then
q=ag[1]elseif#S==2 and#ag==2 then
ba=f(S[2],S[1])cf=f(ag[2],ag[1])ci=i(cf,i(ba,cf))q=u(S[1],e(ba,j(f(ag[1],S[1]),ci)/j(ba,ci)))else
q=S[1]end
bg=u(i(l[5],f(q,l[1])),l[2])aZ=u(i(k[5],f(q,k[1])),k[2])aR=f(bg,aZ)aK=j(s[1],aR)if aK>0 then
cJ=aQ(l,q,s[1])+aQ(k,q,s[1])cH=aK*1
X=cH/cJ
ah(l,q,e(s[1],-X))ah(k,q,e(s[1],X))bg=u(i(l[5],f(q,l[1])),l[2])aZ=u(i(k[5],f(q,k[1])),k[2])aR=f(bg,aZ)aK=j(s[1],aR)cm=f(aR,e(s[1],aK))bS=cj(cm,{0,0,0})if bS>.001 then
aG=bc(cm)cu=aQ(l,q,aG)+aQ(k,q,aG)cp=cc(bS/cu,X*.3)ah(l,q,e(aG,-cp))ah(k,q,e(aG,cp))end
bX=l[10]+k[10]l[1]=u(l[1],e(s[1],-s[2]*l[10]/bX))k[1]=u(k[1],e(s[1],s[2]*k[10]/bX))end
end
end
end
end
table.sort(D,function(_,a)return _[7]>a[7]end)ce=aL
end
aE=aE+1
end
function onDraw()ab=screen
local cE,cI,cL,ao,cG=ab.drawTriangleF,ab.drawTriangle,ab.drawRectF,ab.setColor,ab.drawText
T=ab.getWidth()cF=ab.getHeight()w=T/2
V=cF/2
aw=tan(cK/2)*w
ao(z,z,z)if aY then
for c=1,#D do
d=D[c]v=d[1]y=d[2]A=d[3]ao(d[4],d[5],d[6])cE(v[1]+w,v[2]+V,y[1]+w,y[2]+V,A[1]+w,A[2]+V)ao(d[4]*O,d[5]*O,d[6]*O)cI(v[1]+w,v[2]+V-O,y[1]+w,y[2]+V-O,A[1]+w,A[2]+V-O)end
ao(z,z,z)cG(1,1,bu)ao(unpack(ap))if ch then
aA=30/aq[3]cL(bP[1]+w-(aA//2),bP[2]+V-(aA//2),aA,aA)end
end
end
