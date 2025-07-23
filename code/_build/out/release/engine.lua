
y=255
R=.5
Q=math
by=Q.max
ca=Q.min
sqrt=math.sqrt
cP=Q.floor
pi=Q.pi
V=input.getNumber
ae=input.getBool
cQ=output.setBool
bp=true
bo=false
aQ=ipairs
abs=Q.abs
bW=table.remove
bt=string
sin=Q.sin
cos=Q.cos
tan=Q.tan
unpack=table.unpack
bv=math.huge
function aU(_,a)return{(_[1]+a[1]),(_[2]+a[2])}end
function aE(_,a)return{(_[1]-a[1]),(_[2]-a[2])}end
function aK(_,a)return{_[1]*a,_[2]*a}end
function t(_,a)return{_[1]+a[1],_[2]+a[2],_[3]+a[3]}end
function e(_,a)return{_[1]-a[1],_[2]-a[2],_[3]-a[3]}end
function f(_,a)return{_[1]*a,_[2]*a,_[3]*a}end
function bi(_,a,p)return i(e(a,_),e(p,_))end
function ba(_)return f(_,1/sqrt(_[1]^2+_[2]^2+_[3]^2))end
function ci(_,a)return sqrt((_[1]-a[1])^2+(_[2]-a[2])^2+(_[3]-a[3])^2)end
s={}aV=1
cU=3
Z=1
bT=bp
aG=0
bu=0
K={0,1,-3}C={0,0,0}cc=62.5
ch=pi/180
bj=3/cc
bC=90*ch/cc
cv=90*ch
aq=1
bu=0
bc=1/62.5
function aF(b,bd,bI)bO=e(bd,b[1])return j(i(f(i(bO,bI),b[11]),bO),bI)+b[10]end
function aw(b,bd,bV)cO=e(bd,b[1])b[5]=t(b[5],f(i(cO,bV),b[11]))b[2]=t(b[2],f(bV,b[10]))end
function aj(cA,m)local aa=-bv
for c,n in aQ(cA)do
ai=j(n[2],m)if abs(ai-aa)<.0005 then
aB[#aB+1]=n[2]elseif ai>aa then
bw=n[2]aB={bw}aa=ai
end
end
return bw
end
function cu(bB,bD)m={1,0,0}v={}for cR=1,32 do
h=e(aj(bB,m),aj(bD,f(m,-1)))if j(h,m)<=0 then
return
end
v={h,v[1],v[2],v[3]}_,a,p,ac=unpack(v)if ac then
A=e(a,_)Y=e(p,_)cp=e(ac,_)w=f(_,-1)O=i(A,Y)bE=i(Y,cp)co=i(cp,A)if j(O,w)>0 then
v={_,a,p}m=O
elseif j(bE,w)>0 then
v={_,p,ac}m=bE
elseif j(co,w)>0 then
v={_,ac,a}m=co
else
T={{_,a,p},{_,p,ac},{_,ac,a},{a,ac,p}}for c,n in ipairs(T)do
n[4]=ba(bi(n[1],n[2],n[3]))end
for cV=1,32 do
aa=bv
for c,n in ipairs(T)do
ai=j(n[1],n[4])if ai<aa then
aa=ai
bF=n
end
end
m=bF[4]h=e(aj(bB,m),aj(bD,f(m,-1)))if j(h,m)-.001<=aa then
return{bF[4],j(h,m)}end
as={}for c=#T,1,-1 do
aJ=T[c]if j(aJ[4],e(h,aJ[1]))>0 then
for g=1,3 do
an={aJ[g],aJ[(g%3)+1]}for aM,bK in ipairs(as)do
if bK[1]==an[2]and bK[2]==an[1]then
bW(as,aM)an=cS
break
end
end
if an then
as[#as+1]=an
end
end
bW(T,c)end
end
for c,n in ipairs(as)do
au={n[1],n[2],h}au[4]=ba(bi(au[1],au[2],au[3]))T[#T+1]=au
end
end
return
end
elseif p then
A=e(a,_)Y=e(p,_)w=f(_,-1)O=i(A,Y)if j(i(O,Y),w)>0 then
v={_,p}m=i(i(Y,w),Y)elseif j(i(A,O),w)>0 then
v={_,a}m=i(i(A,w),A)else
if j(O,w)>0 then
m=O;
else
v={_,p,a}m=f(O,-1)end
end
elseif a then
A=e(a,_)w=f(_,-1)if j(A,w)>0 then
m=i(i(A,w),A)else
v={_}m=w
end
else
v={_}m=f(_,-1)end
end
end
function cj(L,F)F=F or{}bX={}g=1
for c=s[1][L][1],s[1][L][2]do
o=s[2][c]bX[g]={{o[1],o[2],o[3]},{}}g=g+1
end
bG={}g=1
for c=s[1][L][3],s[1][L][4]do
o=s[3][c]bG[g]=o
g=g+1
end
bN={}g=1
for c=s[1][L][5],s[1][L][6]do
o=s[2][c]bN[g]={{o[1],o[2],o[3]},{}}g=g+1
end
cF={F[1]or{0,0,0},F[2]or{0,0,0},F[3]or{0,0,0},F[4]or{1,0,0,0},F[5]or{0,0,0},F[6]or{0,0,0},bX,bG,bN,F[7]or 1,F[8]or 1,F[9]or{0,0,0},s[1][L][7]}X[#X+1]=cF
end
function cJ(cH,bA,_,a,p)bx=e(a,_)bS=e(p,_)cn=i(bx,bS)bH=-j(bA,cn)bg=1.0/bH
c_=e(cH,_)cm=i(c_,bA)cg=j(bS,cm)*bg
n=-j(bx,cm)*bg
aY=j(c_,cn)*bg
return(-bH>=1e-6 and aY>=.0 and cg>=.0 and n>=.0 and(cg+n)<=1.0)end
function i(_,a)return{_[2]*a[3]-_[3]*a[2],_[3]*a[1]-_[1]*a[3],_[1]*a[2]-_[2]*a[1]}end
function j(_,a)return _[1]*a[1]+_[2]*a[2]+_[3]*a[3]end
function ct(H)if H[1]==0 and H[2]==0 and H[3]==0 then
return{1,0,0,0}else
return{0,H[1],H[2],H[3]}end
end
function cr(aH,H)local bk=cC(aH,ct(H))for c=1,4 do
bk[c]=aH[c]+bk[c]*R
end
return bk
end
function cC(cK,cN)local az,aC,aD,aN=unpack(cK)local u,aI,aT,aS=unpack(cN)return{az*u-aC*aI-aD*aT-aN*aS,az*aI+aC*u+aD*aS-aN*aT,az*aT-aC*aS+aD*u+aN*aI,az*aS+aC*aT-aD*aI+aN*u}end
function br(H,cB)local ck={}for g=1,3 do
o=0
for aM=1,3 do
o=o+H[aM]*cB[g][aM]end
ck[g]=o
end
return ck
end
function bY(_,ap)ap=1/sqrt(_[1]^2+_[2]^2+_[3]^2+_[4]^2)return{_[1]*ap,_[2]*ap,_[3]*ap,_[4]*ap}end
function cq(aH)local M,I,J,G=unpack(aH)return{{1-(2*J*J+2*G*G),2*I*J+2*G*M,2*I*G-2*J*M},{2*I*J-2*G*M,1-(2*I*I+2*G*G),2*J*G+2*I*M},{2*I*G+2*J*M,2*J*G-2*I*M,1-(2*I*I+2*J*J)}}end
function httpReply(_,a,p)cT=aG//2
aG=0
end
function onTick()for g=1,1 do
if ae(32)and not bs then
bl=property.getText(aV)c=1
E=""
o=bt.sub(bl,c,c)while o~=""do
bz=bt.byte(o)if bz>64 then
E=(E..bz-65)+0
if Z==1 then
bL=E
s[E]=s[E]or{}elseif Z==2 then
cx=E
at=0
elseif Z==3 then
bf=E
else
if at==0 then
at=cx
bf=bf-1
be={}s[bL][#s[bL]+1]=be
end
be[#be+1]=E
at=at-1
Z=by(at,bf)>0 and Z-1 or 0
end
Z=Z+1
E=""
else
E=E..o
end
c=c+1
o=bt.sub(bl,c,c)end
aV=aV+1
bs=bl==""
end
end
if bs then
bu=bu+1
if bT then
X={}cj("widest_cube",{[1]={0,-1,0},[7]=0,[8]=0})for c=1,4 do
for g=1,c do
cj("bowling_pin",{[1]={(g-c/2-R)*.3,.15,(c-1)*sqrt(.3^2-.15^2)},[7]=100,[8]=5000,[9]={0,-1,0}})end
end
end
if ae(31)then
K[2]=K[2]+V(2)*bj
else
K[1]=K[1]+(V(1)*cos(C[1])-V(2)*sin(C[1]))*bj
K[3]=K[3]+(V(1)*sin(C[1])+V(2)*cos(C[1]))*bj
end
C[1]=C[1]-V(3)*bC
C[2]=C[2]+V(4)*bC
ad=0
if ae(31)then
bq=.05
else
bq=.01
end
ay={y,y,y}if ae(1)then
ad=-bq
ay={0,0,y}end
if ae(3)then
ad=bq
ay={y,0,0}end
if not ae(31)then
for c=1,3 do
ay[c]=ca(ay[c]+50,y)end
end
_=C[1]a=C[2]p=C[3]af=cos(_)ag=sin(_)al=cos(a)ah=sin(a)ar=cos(p)ao=sin(p)ce={{af*ar-ag*ah*ao,-al*ao,af*ah*ao+ar*ag},{af*ao+ar*ag*ah,al*ar,ag*ao-af*ar*ah},{-al*ag,ah,af*al}}bm={-ag*al,ah,af*al}bZ=bo
B={}for L=1,#X do
b=X[L]b[4]=bY(cr(b[4],f(b[5],-bc)))b[1]=t(b[1],f(b[2],bc))b[2]=t(b[2],f(b[3],bc))b[3]=f(b[12],1)b[2]=f(b[2],.9995)b[5]=f(b[5],.9995)cI=cq(bY(b[4]))for c=7,9,2 do
for g=1,#b[c]do
h=b[c][g]h[2]=br(h[1],cI)h[2]=t(h[2],b[1])h[3]=e(h[2],K)h[4]=br(h[3],ce)aW=h[3]h[7]=sqrt(aW[1]^2+aW[2]^2+aW[3]^2)h[5]={h[4][1]*aq/h[4][3],-h[4][2]*aq/h[4][3]}h[6]=h[4][3]>0 and 1 or-1
end
end
if b[11]>0 or not b[8][1][8]then
for c=1,#b[8]do
d=b[8][c]d[8]=bi(b[7][d[1]][2],b[7][d[2]][2],b[7][d[3]][2])end
end
for c=1,#b[8]do
d=b[8][c]x=b[7][d[1]]z=b[7][d[2]]D=b[7][d[3]]d[7]=by(x[7],z[7],D[7])_=d[8]a=x[3]if j(_,a)>0 then
av=x[6]+z[6]+D[6]if av==3 then
B[#B+1]={x[5],z[5],D[5],d[4],d[5],d[6],d[7]}elseif av>=-1 then
if x[6]==-av then
U=x[5]W=z[5]N=D[5]elseif z[6]==-av then
U=z[5]W=x[5]N=D[5]else
U=D[5]W=z[5]N=x[5]end
if av==1 then
aO=aU(aK(aE(W,U),1000),W)bb=aU(aK(aE(N,U),1000),N)B[#B+1]={W,aO,N,d[4],d[5],d[6],d[7]}B[#B+1]={N,aO,bb,d[4],d[5],d[6],d[7]}else
aO=aU(aK(aE(U,W),1000),W)bb=aU(aK(aE(U,N),1000),N)B[#B+1]={U,aO,bb,d[4],d[5],d[6],d[7]}end
end
end
end
end
cf=bo
aZ=2^16
for c,b in aQ(X)do
for g=1,#b[8]do
d=b[8][g]cE=cJ({0,0,0},bm,b[7][d[1]][3],b[7][d[2]][3],b[7][d[3]][3])if cE and aY<aZ then
cf=bp
aZ=aY
bU=b
end
end
end
if cf then
bZ=bp
cd=t(f(bm,aZ),K)aw(bU,cd,f(bm,ad))if ae(2)then
bU[12]={0,-9.81,0}end
ax=br(e(cd,K),ce)cl={ax[1]*aq/ax[3],ax[2]*aq/ax[3]}end
bh=0
for c,k in aQ(X)do
for g,l in aQ(X)do
if c~=g and(k[10]>0 or l[10]>0 or k[11]>0 or l[11]>0)and ci(k[1],l[1])<=k[13]+l[13]then
bh=bh+1
r=cu(k[9],l[9])if r then
aj(k[9],r[1])P=aB
aj(l[9],f(r[1],-1))ak=aB
if#P==1 then
q=P[1]elseif#ak==1 then
q=ak[1]elseif#P==2 and#ak==2 then
aX=e(P[2],P[1])bJ=e(ak[2],ak[1])bQ=i(bJ,i(aX,bJ))q=t(P[1],f(aX,j(e(ak[1],P[1]),bQ)/j(aX,bQ)))else
q=P[1]end
b_=t(i(k[5],e(q,k[1])),k[2])bn=t(i(l[5],e(q,l[1])),l[2])aL=e(b_,bn)aR=j(r[1],aL)if aR>0 then
cD=aF(k,q,r[1])+aF(l,q,r[1])cw=aR*1
ad=cw/cD
aw(k,q,f(r[1],-ad))aw(l,q,f(r[1],ad))b_=t(i(k[5],e(q,k[1])),k[2])bn=t(i(l[5],e(q,l[1])),l[2])aL=e(b_,bn)aR=j(r[1],aL)bP=e(aL,f(r[1],aR))cb=ci(bP,{0,0,0})if cb>.001 then
aA=ba(bP)cM=aF(k,q,aA)+aF(l,q,aA)bR=ca(cb/cM,ad)aw(k,q,f(aA,-bR))aw(l,q,f(aA,bR))end
bM=k[10]+l[10]k[1]=t(k[1],f(r[1],-r[2]*k[10]/bM))l[1]=t(l[1],f(r[1],r[2]*l[10]/bM))end
end
end
end
end
table.sort(B,function(_,a)return _[7]>a[7]end)bT=bo
end
aG=aG+1
end
function onDraw()S=screen
local cL,cG,cy,am,cs=S.drawTriangleF,S.drawTriangle,S.drawRectF,S.setColor,S.drawText
M=S.getWidth()cz=S.getHeight()u=M/2
ab=cz/2
aq=tan(cv/2)*u
am(y,y,y)if bs then
for c=1,#B do
d=B[c]x=d[1]z=d[2]D=d[3]am(d[4],d[5],d[6])cL(x[1]+u,x[2]+ab,z[1]+u,z[2]+ab,D[1]+u,D[2]+ab)am(d[4]*R,d[5]*R,d[6]*R)cG(x[1]+u,x[2]+ab-R,z[1]+u,z[2]+ab-R,D[1]+u,D[2]+ab-R)end
am(y,y,y)cs(1,1,bh)am(unpack(ay))if bZ then
aP=30/ax[3]cy(cl[1]+u-(aP//2),cl[2]+ab-(aP//2),aP,aP)end
end
end
