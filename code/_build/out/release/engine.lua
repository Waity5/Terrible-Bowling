
ax=.2
K=.5
ar=.3
P=math
co=P.max
bU=P.min
sqrt=math.sqrt
dl=P.floor
pi=P.pi
bv=input.getNumber
bu=input.getBool
ch=output.setNumber
Q=true
bw=false
ap=ipairs
abs=P.abs
be=table.remove
ba=string
sin=P.sin
cos=P.cos
tan=P.tan
unpack=table.unpack
ce=math.huge
function aE(_,a)return{(_[1]+a[1]),(_[2]+a[2])}end
function aJ(_,a)return{(_[1]-a[1]),(_[2]-a[2])}end
function aA(_,a)return{_[1]*a,_[2]*a}end
function y(_,a)return{_[1]+a[1],_[2]+a[2],_[3]+a[3]}end
function h(_,a)return{_[1]-a[1],_[2]-a[2],_[3]-a[3]}end
function e(_,a)return{_[1]*a,_[2]*a,_[3]*a}end
function bx(_,a,p)return j(h(a,_),h(p,_))end
function aK(_)return e(_,1/sqrt(_[1]^2+_[2]^2+_[3]^2))end
function bV(_,a)return sqrt((_[1]-a[1])^2+(_[2]-a[2])^2+(_[3]-a[3])^2)end
q={}bf=1
di=3
V=1
aF=Q
bF=0
bg=0
aG={0,ar,-2}M={0,0,0}bP=3
cD=1
cA=ar
cN=.6
bd=62.5
bb=pi/180
dk=K/bd
cP=3*bb/bd
ca=.05/bd
bn=20*bb
cO=90*bb
bS=bn
aH=-19.5
cM=-3
au=1
bg=0
bz=1/62.5
function aD(b,by,cd)cw=h(by,b[1])return k(j(e(j(cw,cd),b[11]),cw),cd)+b[10]end
function at(b,by,bC)cE=h(by,b[1])b[5]=y(b[5],e(j(cE,bC),b[11]))b[2]=y(b[2],e(bC,b[10]))end
function ae(cG,m)local U=-ce
for d,n in ap(cG)do
aj=k(n[2],m)if abs(aj-U)<.0005 then
aO[#aO+1]=n[2]elseif aj>U then
bZ=n[2]aO={bZ}U=aj
end
end
return bZ
end
function cI(bR,cr)m={1,0,0}t={}for dg=1,32 do
g=h(ae(bR,m),ae(cr,e(m,-1)))if k(g,m)<=0 then
return
end
t={g,t[1],t[2],t[3]}_,a,p,X=unpack(t)if X then
E=h(a,_)W=h(p,_)cs=h(X,_)u=e(_,-1)O=j(E,W)cz=j(W,cs)bI=j(cs,E)if k(O,u)>0 then
t={_,a,p}m=O
elseif k(cz,u)>0 then
t={_,p,X}m=cz
elseif k(bI,u)>0 then
t={_,X,a}m=bI
else
aa={{_,a,p},{_,p,X},{_,X,a},{a,X,p}}for d,n in ipairs(aa)do
n[4]=aK(bx(n[1],n[2],n[3]))end
for dh=1,32 do
U=ce
for d,n in ipairs(aa)do
aj=k(n[1],n[4])if aj<U then
U=aj
bN=n
end
end
m=bN[4]g=h(ae(bR,m),ae(cr,e(m,-1)))if k(g,m)-.001<=U then
return{bN[4],k(g,m)}end
aw={}for d=#aa,1,-1 do
az=aa[d]if k(az[4],h(g,az[1]))>0 then
for f=1,3 do
av={az[f],az[(f%3)+1]}for aT,cy in ipairs(aw)do
if cy[1]==av[2]and cy[2]==av[1]then
be(aw,aT)av=dj
break
end
end
if av then
aw[#aw+1]=av
end
end
be(aa,d)end
end
for d,n in ipairs(aw)do
as={n[1],n[2],g}as[4]=aK(bx(as[1],as[2],as[3]))aa[#aa+1]=as
end
end
return
end
elseif p then
E=h(a,_)W=h(p,_)u=e(_,-1)O=j(E,W)if k(j(O,W),u)>0 then
t={_,p}m=j(j(W,u),W)elseif k(j(E,O),u)>0 then
t={_,a}m=j(j(E,u),E)else
if k(O,u)>0 then
m=O;
else
t={_,p,a}m=e(O,-1)end
end
elseif a then
E=h(a,_)u=e(_,-1)if k(E,u)>0 then
m=j(j(E,u),E)else
t={_}m=u
end
else
t={_}m=e(_,-1)end
end
end
function ab(G,C)C=C or{}bM={}f=1
for d=q[1][G][1],q[1][G][2]do
o=q[2][d]bM[f]={{o[1],o[2],o[3]},{}}f=f+1
end
bE={}f=1
for d=q[1][G][3],q[1][G][4]do
o=q[3][d]bE[f]=o
f=f+1
end
c_={}f=1
for d=q[1][G][5],q[1][G][6]do
o=q[2][d]c_[f]={{o[1],o[2],o[3]},{}}f=f+1
end
df={C[1]or{0,0,0},C[2]or{0,0,0},C[3]or{0,0,0},C[4]or{1,0,0,0},C[5]or{0,0,0},C[6]or{0,0,0},bM,bE,c_,C[7]or 1,C[8]or 1,C[9]or{0,0,0},q[1][G][7],G}z[#z+1]=df
end
function cF(cX,ag,_,a,p)bH=h(a,_)bK=h(p,_)bX=j(bH,bK)bY=-k(ag,bX)bj=1.0/bY
bQ=h(cX,_)cb=j(bQ,ag)bB=k(bK,cb)*bj
n=-k(bH,cb)*bj
aX=k(bQ,bX)*bj
return(-bY>=1e-6 and aX>=0 and bB>=0 and n>=0 and(bB+n)<=1)end
function j(_,a)return{_[2]*a[3]-_[3]*a[2],_[3]*a[1]-_[1]*a[3],_[1]*a[2]-_[2]*a[1]}end
function k(_,a)return _[1]*a[1]+_[2]*a[2]+_[3]*a[3]end
function cC(I)if I[1]==0 and I[2]==0 and I[3]==0 then
return{1,0,0,0}else
return{0,I[1],I[2],I[3]}end
end
function dd(aW,I)bc=cS(aW,cC(I))for d=1,4 do
bc[d]=aW[d]+bc[d]*K
end
return bc
end
function cS(cJ,cU)aM,aP,aQ,aI=unpack(cJ)w,aC,aV,aL=unpack(cU)return{aM*w-aP*aC-aQ*aV-aI*aL,aM*aC+aP*w+aQ*aL-aI*aV,aM*aV-aP*aL+aQ*w+aI*aC,aM*aL+aP*aV-aQ*aC+aI*w}end
function bl(I,cQ)cm={}for f=1,3 do
o=0
for aT=1,3 do
o=o+I[aT]*cQ[f][aT]end
cm[f]=o
end
return cm
end
function cu(_,aq)aq=1/sqrt(_[1]^2+_[2]^2+_[3]^2+_[4]^2)return{_[1]*aq,_[2]*aq,_[3]*aq,_[4]*aq}end
function cW(aW)N,J,F,H=unpack(aW)return{{1-(2*F*F+2*H*H),2*J*F+2*H*N,2*J*H-2*F*N},{2*J*F-2*H*N,1-(2*J*J+2*H*H),2*F*H+2*J*N},{2*J*H+2*F*N,2*F*H-2*J*N,1-(2*J*J+2*F*F)}}end
function ck(i,l)d_=y(j(i[5],h(v,i[1])),i[2])db=y(j(l[5],h(v,l[1])),l[2])cp=h(d_,db)br=k(r[1],cp)end
function onTick()for f=1,1 do
if bu(32)and not aZ then
bi=property.getText(bf)d=1
D=""
o=ba.sub(bi,d,d)while o~=""do
bA=ba.byte(o)if bA>64 then
D=(D..bA-65)+0
if V==1 then
bW=D
q[D]=q[D]or{}elseif V==2 then
dc=D
am=0
elseif V==3 then
b_=D
else
if am==0 then
am=dc
b_=b_-1
bq={}q[bW][#q[bW]+1]=bq
end
bq[#bq+1]=D
am=am-1
V=co(am,b_)>0 and V-1 or 0
end
V=V+1
D=""
else
D=D..o
end
d=d+1
o=ba.sub(bi,d,d)end
bf=bf+1
aZ=bi==""
end
end
if aZ then
bg=bg+1
if aF then
z={}al={0,-.15,0}aS=10
ab("bowling_lane1",{[1]={0,-ax,-8.15},[7]=0,[8]=0})ab("bowling_lane2",{[1]={0,-ax,-18.4},[7]=0,[8]=0})ab("bowling_lane3",{[1]={0,-ax,-19.5},[7]=0,[8]=0})for d=1,4 do
for f=1,d do
ab("bowling_pin",{[1]={(f-d/2-K)*ar,.15,(d-1)*sqrt(ar^2-.15^2)},[7]=.75,[8]=50,[9]={0,-5,0}})end
end
ab("icoball",{[1]={0,.4,aH},[7]=ax,[8]=10,[9]={0,-9.81,0}})end
ch(1,-1)if aF or bo>120 then
ch(1,aS)be(z,#z)ab("icoball",{[1]={0,.4,aH},[7]=ax,[8]=10,[9]={0,-9.81,0}})bm,aR,aF=Q
bo=0
if aS==0 then
aF=Q
end
end
ci=z[#z]bs=bU((ci[1][3]-aH)/(cM-aH),1)cj=bP+(cD-bP)*bs
bS=bn+(cO-bn)*bs
de=cA+(cN-cA)*bs
if not aR then
M[1]=M[1]-bv(3)*cP
M[2]=-.01
al[2]=al[2]+bv(2)*ca
al[1]=al[1]+bv(1)*ca
aG={sin(M[1])*cj,de,-cos(M[1])*cj+ci[1][3]}end
if aR then
bo=bo+1
end
_=M[1]a=M[2]p=M[3]ai=cos(_)ah=sin(_)ad=cos(a)ac=sin(a)ao=cos(p)an=sin(p)cc={{ai*ao-ah*ac*an,-ad*an,ai*ac*an+ao*ah},{ai*an+ao*ah*ac,ad*ao,ah*an-ai*ao*ac},{-ad*ah,ac,ai*ad}}cx={-ah*ad,ac,ai*ad}bD=bw
B={}for G=1,#z do
b=z[G]b[4]=cu(dd(b[4],e(b[5],-bz)))b[1]=y(b[1],e(b[2],bz))b[2]=y(b[2],e(b[3],bz))b[3]=e(b[12],1)if b[14]=="bowling_pin" then
b[5]=e(b[5],.9)if b[1][2]<.1 and not b[15]then
b[15]=Q
aS=aS-1
end
elseif b[14]=="icoball" then
if b[1][2]<-1 or(b[2][3]<1 and not bm)then
aR=Q
end
end
cL=cW(cu(b[4]))for d=7,9,2 do
for f=1,#b[d]do
g=b[d][f]g[2]=bl(g[1],cL)g[2]=y(g[2],b[1])g[3]=h(g[2],aG)g[4]=bl(g[3],cc)cH=g[3]g[7]=cH[3]g[5]={g[4][1]*au/g[4][3],-g[4][2]*au/g[4][3]}g[6]=g[4][3]>0 and 1 or-1
end
end
if b[11]>0 or not b[8][1][8]then
for d=1,#b[8]do
c=b[8][d]c[8]=bx(b[7][c[1]][2],b[7][c[2]][2],b[7][c[3]][2])end
end
for d,c in ap(b[8])do
s=b[7][c[1]]x=b[7][c[2]]A=b[7][c[3]]c[7]=co(s[7],x[7],A[7])_=c[8]a=s[3]if k(_,a)>0 then
ay=s[6]+x[6]+A[6]if ay==3 then
B[#B+1]={s[5],x[5],A[5],c[4],c[5],c[6],c[7]}elseif ay>=-1 then
if s[6]==-ay then
Z=s[5]Y=x[5]R=A[5]elseif x[6]==-ay then
Z=x[5]Y=s[5]R=A[5]else
Z=A[5]Y=x[5]R=s[5]end
if ay==1 then
aU=aE(aA(aJ(Y,Z),1000),Y)aY=aE(aA(aJ(R,Z),1000),R)B[#B+1]={Y,aU,R,c[4],c[5],c[6],c[7]}B[#B+1]={R,aU,aY,c[4],c[5],c[6],c[7]}else
aU=aE(aA(aJ(Z,Y),1000),Y)aY=aE(aA(aJ(Z,R),1000),R)B[#B+1]={Z,aU,aY,c[4],c[5],c[6],c[7]}end
end
end
end
end
if bm then
bJ=bw
bh=2^16
ag=aK({cx[1],0,cx[3]})cf=al
for d,b in ap(z)do
if b[14]=="icoball" then
for f=1,#b[8]do
c=b[8][f]da=cF(cf,ag,b[7][c[1]][3],b[7][c[2]][3],b[7][c[3]][3])if da and aX<bh then
bJ=Q
bh=aX
bt=b
end
end
end
end
if bJ then
bD=Q
bG=y(y(e(ag,bh),aG),cf)if bu(31)then
at(bt,bG,e(ag,55))bt[11]=1.5
bm=bw
end
if bu(2)then
bt[12]={0,-9.81,0}end
ak=bl(h(bG,aG),cc)bL={ak[1]*au/ak[3],ak[2]*au/ak[3]}end
end
cq=0
for d,i in ap(z)do
for f,l in ap(z)do
if d~=f and(i[10]>0 or l[10]>0 or i[11]>0 or l[11]>0)and bV(i[1],l[1])<=i[13]+l[13]then
cq=cq+1
r=cI(i[9],l[9])if r then
if i[14]=="icoball" and l[14]=="bowling_pin" then
aR=Q
end
ae(i[9],r[1])L=aO
ae(l[9],e(r[1],-1))T=aO
if#L==1 then
v=L[1]elseif#T==1 then
v=T[1]elseif#L==2 and#T==2 then
bk=h(L[2],L[1])cn=h(T[2],T[1])bT=j(cn,j(bk,cn))v=y(L[1],e(bk,k(h(T[1],L[1]),bT)/k(bk,bT)))else
v=i[13]>l[13]and T[1]or L[1]end
ck(i,l)if br>0 then
cB=aD(i,v,r[1])+aD(l,v,r[1])cR=br*1
bp=cR/cB
at(i,v,e(r[1],-bp))at(l,v,e(r[1],bp))ck(i,l)cl=h(cp,e(r[1],br))ct=bV(cl,{0,0,0})if ct>.001 then
aN=aK(cl)cT=aD(i,v,aN)+aD(l,v,aN)cg=bU(ct/cT,bp*ar)at(i,v,e(aN,-cg))at(l,v,e(aN,cg))end
bO=i[10]+l[10]i[1]=y(i[1],e(r[1],-r[2]*i[10]/bO))l[1]=y(l[1],e(r[1],r[2]*l[10]/bO))end
end
end
end
end
table.sort(B,function(_,a)return _[7]>a[7]end)end
bF=bF+1
end
function onDraw()af=screen
local cK,cV,cY,cv=af.drawTriangleF,af.drawTriangle,af.drawRectF,af.setColor
N=af.getWidth()cZ=af.getHeight()w=N/2
S=cZ/2
au=w/tan(bS/2)if aZ then
for d=1,#B do
c=B[d]s=c[1]x=c[2]A=c[3]cv(c[4],c[5],c[6])cK(s[1]+w,s[2]+S,x[1]+w,x[2]+S,A[1]+w,A[2]+S)cv(c[4]*K,c[5]*K,c[6]*K)cV(s[1]+w,s[2]+S-K,x[1]+w,x[2]+S-K,A[1]+w,A[2]+S-K)end
if bD then
aB=30/ak[3]cY(bL[1]+w-(aB//2),-bL[2]+S-(aB//2),aB,aB)end
end
end
