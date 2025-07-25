
an=.2
K=.5
aq=.3
Q=math
cb=Q.max
bE=Q.min
sqrt=math.sqrt
dh=Q.floor
pi=Q.pi
bz=input.getNumber
bm=input.getBool
bC=output.setNumber
P=true
bq=false
al=ipairs
abs=Q.abs
bk=table.remove
bp=string
sin=Q.sin
cos=Q.cos
tan=Q.tan
unpack=table.unpack
c_=math.huge
function aH(_,a)return{(_[1]+a[1]),(_[2]+a[2])}end
function aM(_,a)return{(_[1]-a[1]),(_[2]-a[2])}end
function aE(_,a)return{_[1]*a,_[2]*a}end
function y(_,a)return{_[1]+a[1],_[2]+a[2],_[3]+a[3]}end
function g(_,a)return{_[1]-a[1],_[2]-a[2],_[3]-a[3]}end
function e(_,a)return{_[1]*a,_[2]*a,_[3]*a}end
function aY(_,a,p)return l(g(a,_),g(p,_))end
function aR(_)return e(_,1/sqrt(_[1]^2+_[2]^2+_[3]^2))end
function co(_,a)return sqrt((_[1]-a[1])^2+(_[2]-a[2])^2+(_[3]-a[3])^2)end
q={}bb=1
dj=3
Z=1
aS=P
bV=0
by=0
aO={0,aq,-2}N={0,0,0}cw=3
cW=1
bX=aq
cP=.6
bl=62.5
bw=pi/180
dg=K/bl
d_=3*bw/bl
cy=.05/bl
bj=20*bw
cB=90*bw
bI=bj
aN=-19.5
cG=-3
ar=1
by=0
bv=1/62.5
function aW(b,bh,bM)bJ=g(bh,b[1])return k(l(e(l(bJ,bM),b[11]),bJ),bM)+b[10]end
function am(b,bh,bS)cC=g(bh,b[1])b[5]=y(b[5],e(l(cC,bS),b[11]))b[2]=y(b[2],e(bS,b[10]))end
function ac(cQ,m)local Y=-c_
for d,n in al(cQ)do
ah=k(n[2],m)if abs(ah-Y)<.0005 then
aB[#aB+1]=n[2]elseif ah>Y then
ce=n[2]aB={ce}Y=ah
end
end
return ce
end
function cR(cx,bA)m={1,0,0}u={}for dk=1,32 do
h=g(ac(cx,m),ac(bA,e(m,-1)))if k(h,m)<=0 then
return
end
u={h,u[1],u[2],u[3]}_,a,p,T=unpack(u)if T then
B=g(a,_)X=g(p,_)bT=g(T,_)v=e(_,-1)M=l(B,X)bK=l(X,bT)cn=l(bT,B)if k(M,v)>0 then
u={_,a,p}m=M
elseif k(bK,v)>0 then
u={_,p,T}m=bK
elseif k(cn,v)>0 then
u={_,T,a}m=cn
else
S={{_,a,p},{_,p,T},{_,T,a},{a,T,p}}for d,n in ipairs(S)do
n[4]=aR(aY(n[1],n[2],n[3]))end
for di=1,32 do
Y=c_
for d,n in ipairs(S)do
ah=k(n[1],n[4])if ah<Y then
Y=ah
bG=n
end
end
m=bG[4]h=g(ac(cx,m),ac(bA,e(m,-1)))if k(h,m)-.001<=Y then
return{bG[4],k(h,m)}end
au={}for d=#S,1,-1 do
aG=S[d]if k(aG[4],g(h,aG[1]))>0 then
for f=1,3 do
ay={aG[f],aG[(f%3)+1]}for aP,bU in ipairs(au)do
if bU[1]==ay[2]and bU[2]==ay[1]then
bk(au,aP)ay=dl
break
end
end
if ay then
au[#au+1]=ay
end
end
bk(S,d)end
end
for d,n in ipairs(au)do
aw={n[1],n[2],h}aw[4]=aR(aY(aw[1],aw[2],aw[3]))S[#S+1]=aw
end
end
return
end
elseif p then
B=g(a,_)X=g(p,_)v=e(_,-1)M=l(B,X)if k(l(M,X),v)>0 then
u={_,p}m=l(l(X,v),X)elseif k(l(B,M),v)>0 then
u={_,a}m=l(l(B,v),B)else
if k(M,v)>0 then
m=M;
else
u={_,p,a}m=e(M,-1)end
end
elseif a then
B=g(a,_)v=e(_,-1)if k(B,v)>0 then
m=l(l(B,v),B)else
u={_}m=v
end
else
u={_}m=e(_,-1)end
end
end
function ab(F,C)C=C or{}bW={}f=1
for d=q[1][F][1],q[1][F][2]do
o=q[2][d]bW[f]={{o[1],o[2],o[3]},{}}f=f+1
end
cr={}f=1
for d=q[1][F][3],q[1][F][4]do
o=q[3][d]cr[f]=o
f=f+1
end
cj={}f=1
for d=q[1][F][5],q[1][F][6]do
o=q[2][d]cj[f]={{o[1],o[2],o[3]},{}}f=f+1
end
cE={C[1]or{0,0,0},C[2]or{0,0,0},C[3]or{0,0,0},C[4]or{1,0,0,0},C[5]or{0,0,0},C[6]or{0,0,0},bW,cr,cj,C[7]or 1,C[8]or 1,C[9]or{0,0,0},q[1][F][7],F}D[#D+1]=cE
end
function cT(cO,af,_,a,p)ci=g(a,_)cA=g(p,_)cz=l(ci,cA)cm=-k(af,cz)bf=1.0/cm
bB=g(cO,_)ck=l(bB,af)bQ=k(cA,ck)*bf
n=-k(ci,ck)*bf
ba=k(bB,cz)*bf
return(-cm>=1e-6 and ba>=0 and bQ>=0 and n>=0 and(bQ+n)<=1)end
function l(_,a)return{_[2]*a[3]-_[3]*a[2],_[3]*a[1]-_[1]*a[3],_[1]*a[2]-_[2]*a[1]}end
function k(_,a)return _[1]*a[1]+_[2]*a[2]+_[3]*a[3]end
function cS(I)if I[1]==0 and I[2]==0 and I[3]==0 then
return{1,0,0,0}else
return{0,I[1],I[2],I[3]}end
end
function cK(aT,I)b_=db(aT,cS(I))for d=1,4 do
b_[d]=aT[d]+b_[d]*K
end
return b_
end
function db(cU,cH)aU,aL,aQ,aI=unpack(cU)w,aV,aC,aD=unpack(cH)return{aU*w-aL*aV-aQ*aC-aI*aD,aU*aV+aL*w+aQ*aD-aI*aC,aU*aC-aL*aD+aQ*w+aI*aV,aU*aD+aL*aC-aQ*aV+aI*w}end
function bo(I,cD)bN={}for f=1,3 do
o=0
for aP=1,3 do
o=o+I[aP]*cD[f][aP]end
bN[f]=o
end
return bN
end
function cu(_,ao)ao=1/sqrt(_[1]^2+_[2]^2+_[3]^2+_[4]^2)return{_[1]*ao,_[2]*ao,_[3]*ao,_[4]*ao}end
function da(aT)L,G,J,H=unpack(aT)return{{1-(2*J*J+2*H*H),2*G*J+2*H*L,2*G*H-2*J*L},{2*G*J-2*H*L,1-(2*G*G+2*H*H),2*J*H+2*G*L},{2*G*H+2*J*L,2*J*H-2*G*L,1-(2*G*G+2*J*J)}}end
function cq(i,j)dc=y(l(i[5],g(t,i[1])),i[2])cX=y(l(j[5],g(t,j[1])),j[2])bY=g(dc,cX)bd=k(r[1],bY)end
function onTick()for f=1,1 do
if bm(32)and not bg then
bu=property.getText(bb)d=1
A=""
o=bp.sub(bu,d,d)while o~=""do
cd=bp.byte(o)if cd>64 then
A=(A..cd-65)+0
if Z==1 then
bO=A
q[A]=q[A]or{}elseif Z==2 then
cF=A
ap=0
elseif Z==3 then
be=A
else
if ap==0 then
ap=cF
be=be-1
bs={}q[bO][#q[bO]+1]=bs
end
bs[#bs+1]=A
ap=ap-1
Z=cb(ap,be)>0 and Z-1 or 0
end
Z=Z+1
A=""
else
A=A..o
end
d=d+1
o=bp.sub(bu,d,d)end
bb=bb+1
bg=bu==""
end
end
if bg then
by=by+1
if aS then
D={}av={0,-.15,0}aK=10
ab("bowling_lane1",{[1]={0,-an,-8.15},[7]=0,[8]=0})ab("bowling_lane2",{[1]={0,-an,-18.4},[7]=0,[8]=0})ab("bowling_lane3",{[1]={0,-an,-19.5},[7]=0,[8]=0})for d=1,4 do
for f=1,d do
ab("bowling_pin",{[1]={(f-d/2-K)*aq,.15,(d-1)*sqrt(aq^2-.15^2)},[7]=.75,[8]=50,[9]={0,-5,0}})end
end
ab("icoball",{[1]={0,.4,aN},[7]=an,[8]=10,[9]={0,-9.81,0}})end
bC(1,-1)if aS or aX>120 then
bC(1,aK)bk(D,#D)ab("icoball",{[1]={0,.4,aN},[7]=an,[8]=10,[9]={0,-9.81,0}})aZ,aA,aS=P
aX=0
if aK==0 then
aS=P
end
end
bR=D[#D]bi=bE((bR[1][3]-aN)/(cG-aN),1)bP=cw+(cW-cw)*bi
bI=bj+(cB-bj)*bi
cZ=bX+(cP-bX)*bi
if not aA then
N[1]=N[1]-bz(3)*d_
N[2]=-.01
av[2]=av[2]+bz(2)*cy
av[1]=av[1]+bz(1)*cy
aO={sin(N[1])*bP,cZ,-cos(N[1])*bP+bR[1][3]}end
if aA then
aX=aX+1
end
_=N[1]a=N[2]p=N[3]ag=cos(_)aj=sin(_)ae=cos(a)ai=sin(a)ax=cos(p)at=sin(p)bF={{ag*ax-aj*ai*at,-ae*at,ag*ai*at+ax*aj},{ag*at+ax*aj*ai,ae*ax,aj*at-ag*ax*ai},{-ae*aj,ai,ag*ae}}cp={-aj*ae,ai,ag*ae}bZ=bq
z={}for F=1,#D do
b=D[F]b[4]=cu(cK(b[4],e(b[5],-bv)))b[1]=y(b[1],e(b[2],bv))b[2]=y(b[2],e(b[3],bv))b[3]=e(b[12],1)if b[14]=="bowling_pin" then
b[5]=e(b[5],.9)if b[1][2]<.1 and not b[15]then
b[15]=P
aK=aK-1
end
elseif b[14]=="icoball" then
if b[1][2]<-1 or(b[2][3]<1 and not aZ)then
aA=P
end
end
dd=da(cu(b[4]))for d=7,9,2 do
for f=1,#b[d]do
h=b[d][f]h[2]=bo(h[1],dd)h[2]=y(h[2],b[1])h[3]=g(h[2],aO)h[4]=bo(h[3],bF)cV=h[3]h[7]=cV[3]h[5]={h[4][1]*ar/h[4][3],-h[4][2]*ar/h[4][3]}h[6]=h[4][3]>0 and 1 or-1
end
end
if b[11]>0 or not b[8][1][8]then
for d=1,#b[8]do
c=b[8][d]c[8]=aY(b[7][c[1]][2],b[7][c[2]][2],b[7][c[3]][2])end
end
for d,c in al(b[8])do
s=b[7][c[1]]x=b[7][c[2]]E=b[7][c[3]]c[7]=cb(s[7],x[7],E[7])_=c[8]a=s[3]if k(_,a)>0 then
ak=s[6]+x[6]+E[6]if ak==3 then
z[#z+1]={s[5],x[5],E[5],c[4],c[5],c[6],c[7]}elseif ak>=-1 then
if s[6]==-ak then
U=s[5]W=x[5]O=E[5]elseif x[6]==-ak then
U=x[5]W=s[5]O=E[5]else
U=E[5]W=x[5]O=s[5]end
if ak==1 then
aJ=aH(aE(aM(W,U),1000),W)bt=aH(aE(aM(O,U),1000),O)z[#z+1]={W,aJ,O,c[4],c[5],c[6],c[7]}z[#z+1]={O,aJ,bt,c[4],c[5],c[6],c[7]}else
aJ=aH(aE(aM(U,W),1000),W)bt=aH(aE(aM(U,O),1000),O)z[#z+1]={U,aJ,bt,c[4],c[5],c[6],c[7]}end
end
end
end
end
if aZ then
bL=bq
br=2^16
af=aR({cp[1],0,cp[3]})cg=av
for d,b in al(D)do
if b[14]=="icoball" then
for f=1,#b[8]do
c=b[8][f]cY=cT(cg,af,b[7][c[1]][3],b[7][c[2]][3],b[7][c[3]][3])if cY and ba<br then
bL=P
br=ba
bn=b
end
end
end
end
if bL then
bZ=P
bD=y(y(e(af,br),aO),cg)if bm(31)then
am(bn,bD,e(af,55))bn[11]=1.5
aZ=bq
end
if bm(2)then
bn[12]={0,-9.81,0}end
as=bo(g(bD,aO),bF)ch={as[1]*ar/as[3],as[2]*ar/as[3]}end
end
cf=0
for d,i in al(D)do
for f,j in al(D)do
if d~=f and(i[10]>0 or j[10]>0 or i[11]>0 or j[11]>0)and co(i[1],j[1])<=i[13]+j[13]then
cf=cf+1
r=cR(i[9],j[9])if r then
if i[14]=="icoball" and j[14]=="bowling_pin" then
aA=P
end
ac(i[9],r[1])R=aB
ac(j[9],e(r[1],-1))V=aB
if#R==1 then
t=R[1]elseif#V==1 then
t=V[1]elseif#R==2 and#V==2 then
bc=g(R[2],R[1])cc=g(V[2],V[1])ca=l(cc,l(bc,cc))t=y(R[1],e(bc,k(g(V[1],R[1]),ca)/k(bc,ca)))else
t=i[13]>j[13]and V[1]or R[1]end
cq(i,j)if bd>0 then
df=aW(i,t,r[1])+aW(j,t,r[1])de=bd*1
bx=de/df
am(i,t,e(r[1],-bx))am(j,t,e(r[1],bx))cq(i,j)ct=g(bY,e(r[1],bd))cs=co(ct,{0,0,0})if cs>.001 then
az=aR(ct)cL=aW(i,t,az)+aW(j,t,az)cl=bE(cs/cL,bx*aq)am(i,t,e(az,-cl))am(j,t,e(az,cl))end
cv=i[10]+j[10]i[1]=y(i[1],e(r[1],-r[2]*i[10]/cv))j[1]=y(j[1],e(r[1],r[2]*j[10]/cv))end
end
end
end
end
table.sort(z,function(_,a)return _[7]>a[7]end)end
bV=bV+1
end
function onDraw()ad=screen
local cM,cN,cI,bH=ad.drawTriangleF,ad.drawTriangle,ad.drawRectF,ad.setColor
L=ad.getWidth()cJ=ad.getHeight()w=L/2
aa=cJ/2
ar=w/tan(bI/2)if bg then
for d=1,#z do
c=z[d]s=c[1]x=c[2]E=c[3]bH(c[4],c[5],c[6])cM(s[1]+w,s[2]+aa,x[1]+w,x[2]+aa,E[1]+w,E[2]+aa)bH(c[4]*K,c[5]*K,c[6]*K)cN(s[1]+w,s[2]+aa-K,x[1]+w,x[2]+aa-K,E[1]+w,E[2]+aa-K)end
if bZ then
aF=30/as[3]cI(ch[1]+w-(aF//2),-ch[2]+aa-(aF//2),aF,aF)end
end
end
