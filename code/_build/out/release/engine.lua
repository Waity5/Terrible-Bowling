
aj=255
am=.2
K=.5
at=.3
L=math
bP=L.max
cf=L.min
sqrt=math.sqrt
dg=L.floor
pi=L.pi
cP=input.getNumber
b_=input.getBool
dc=output.setBool
au=true
aa=false
an=ipairs
abs=L.abs
cc=table.remove
bv=string
sin=L.sin
cos=L.cos
tan=L.tan
unpack=table.unpack
c_=math.huge
function aH(_,a)return{(_[1]+a[1]),(_[2]+a[2])}end
function aV(_,a)return{(_[1]-a[1]),(_[2]-a[2])}end
function aS(_,a)return{_[1]*a,_[2]*a}end
function s(_,a)return{_[1]+a[1],_[2]+a[2],_[3]+a[3]}end
function f(_,a)return{_[1]-a[1],_[2]-a[2],_[3]-a[3]}end
function e(_,a)return{_[1]*a,_[2]*a,_[3]*a}end
function ba(_,a,p)return i(f(a,_),f(p,_))end
function bd(_)return e(_,1/sqrt(_[1]^2+_[2]^2+_[3]^2))end
function bW(_,a)return sqrt((_[1]-a[1])^2+(_[2]-a[2])^2+(_[3]-a[3])^2)end
r={}bx=1
de=3
U=1
bO=au
aQ=0
bg=0
aP={0,at,-2}P={0,0,0}bS=3
cK=1
bJ=at
cD=.6
bZ=62.5
bi=pi/180
di=K/bZ
cx=10*bi/bZ
bf=20*bi
cy=90*bi
bU=bf
be=-19.5
cX=-3
ak=1
bg=0
bp=1/62.5
function aI(b,by,bB)co=f(by,b[1])return j(i(e(i(co,bB),b[11]),co),bB)+b[10]end
function ab(b,by,cl)cV=f(by,b[1])b[5]=s(b[5],e(i(cV,cl),b[11]))b[2]=s(b[2],e(cl,b[10]))end
function ag(cL,m)local W=-c_
for d,n in an(cL)do
ae=j(n[2],m)if abs(ae-W)<.0005 then
aA[#aA+1]=n[2]elseif ae>W then
ck=n[2]aA={ck}W=ae
end
end
return ck
end
function cZ(cd,bY)m={1,0,0}u={}for dh=1,32 do
h=f(ag(cd,m),ag(bY,e(m,-1)))if j(h,m)<=0 then
return
end
u={h,u[1],u[2],u[3]}_,a,p,V=unpack(u)if V then
A=f(a,_)Z=f(p,_)cu=f(V,_)v=e(_,-1)Q=i(A,Z)bL=i(Z,cu)cq=i(cu,A)if j(Q,v)>0 then
u={_,a,p}m=Q
elseif j(bL,v)>0 then
u={_,p,V}m=bL
elseif j(cq,v)>0 then
u={_,V,a}m=cq
else
Y={{_,a,p},{_,p,V},{_,V,a},{a,V,p}}for d,n in ipairs(Y)do
n[4]=bd(ba(n[1],n[2],n[3]))end
for df=1,32 do
W=c_
for d,n in ipairs(Y)do
ae=j(n[1],n[4])if ae<W then
W=ae
bF=n
end
end
m=bF[4]h=f(ag(cd,m),ag(bY,e(m,-1)))if j(h,m)-.001<=W then
return{bF[4],j(h,m)}end
as={}for d=#Y,1,-1 do
aW=Y[d]if j(aW[4],f(h,aW[1]))>0 then
for g=1,3 do
av={aW[g],aW[(g%3)+1]}for aM,ce in ipairs(as)do
if ce[1]==av[2]and ce[2]==av[1]then
cc(as,aM)av=db
break
end
end
if av then
as[#as+1]=av
end
end
cc(Y,d)end
end
for d,n in ipairs(as)do
aw={n[1],n[2],h}aw[4]=bd(ba(aw[1],aw[2],aw[3]))Y[#Y+1]=aw
end
end
return
end
elseif p then
A=f(a,_)Z=f(p,_)v=e(_,-1)Q=i(A,Z)if j(i(Q,Z),v)>0 then
u={_,p}m=i(i(Z,v),Z)elseif j(i(A,Q),v)>0 then
u={_,a}m=i(i(A,v),A)else
if j(Q,v)>0 then
m=Q;
else
u={_,p,a}m=e(Q,-1)end
end
elseif a then
A=f(a,_)v=e(_,-1)if j(A,v)>0 then
m=i(i(A,v),A)else
u={_}m=v
end
else
u={_}m=e(_,-1)end
end
end
function ap(I,B)B=B or{}ct={}g=1
for d=r[1][I][1],r[1][I][2]do
o=r[2][d]ct[g]={{o[1],o[2],o[3]},{}}g=g+1
end
cs={}g=1
for d=r[1][I][3],r[1][I][4]do
o=r[3][d]cs[g]=o
g=g+1
end
bE={}g=1
for d=r[1][I][5],r[1][I][6]do
o=r[2][d]bE[g]={{o[1],o[2],o[3]},{}}g=g+1
end
cE={B[1]or{0,0,0},B[2]or{0,0,0},B[3]or{0,0,0},B[4]or{1,0,0,0},B[5]or{0,0,0},B[6]or{0,0,0},ct,cs,bE,B[7]or 1,B[8]or 1,B[9]or{0,0,0},r[1][I][7],I}C[#C+1]=cE
end
function cC(cG,cw,_,a,p)bC=f(a,_)ci=f(p,_)bQ=i(bC,ci)bK=-j(cw,bQ)bw=1.0/bK
cr=f(cG,_)ca=i(cr,cw)ch=j(ci,ca)*bw
n=-j(bC,ca)*bw
bs=j(cr,bQ)*bw
return(-bK>=1e-6 and bs>=.0 and ch>=.0 and n>=.0 and(ch+n)<=1.0)end
function i(_,a)return{_[2]*a[3]-_[3]*a[2],_[3]*a[1]-_[1]*a[3],_[1]*a[2]-_[2]*a[1]}end
function j(_,a)return _[1]*a[1]+_[2]*a[2]+_[3]*a[3]end
function d_(J)if J[1]==0 and J[2]==0 and J[3]==0 then
return{1,0,0,0}else
return{0,J[1],J[2],J[3]}end
end
function cT(aL,J)local bm=cz(aL,d_(J))for d=1,4 do
bm[d]=aL[d]+bm[d]*K
end
return bm
end
function cz(da,cA)local aF,aD,aC,aE=unpack(da)local x,aK,aG,aT=unpack(cA)return{aF*x-aD*aK-aC*aG-aE*aT,aF*aK+aD*x+aC*aT-aE*aG,aF*aG-aD*aT+aC*x+aE*aK,aF*aT+aD*aG-aC*aK+aE*x}end
function br(J,cF)local bX={}for g=1,3 do
o=0
for aM=1,3 do
o=o+J[aM]*cF[g][aM]end
bX[g]=o
end
return bX
end
function bN(_,ar)ar=1/sqrt(_[1]^2+_[2]^2+_[3]^2+_[4]^2)return{_[1]*ar,_[2]*ar,_[3]*ar,_[4]*ar}end
function cU(aL)local N,G,H,F=unpack(aL)return{{1-(2*H*H+2*F*F),2*G*H+2*F*N,2*G*F-2*H*N},{2*G*H-2*F*N,1-(2*G*G+2*F*F),2*H*F+2*G*N},{2*G*F+2*H*N,2*H*F-2*G*N,1-(2*G*G+2*H*H)}}end
function httpReply(_,a,p)dd=aQ//2
aQ=0
end
function onTick()for g=1,1 do
if b_(32)and not aY then
bu=property.getText(bx)d=1
D=""
o=bv.sub(bu,d,d)while o~=""do
cn=bv.byte(o)if cn>64 then
D=(D..cn-65)+0
if U==1 then
bM=D
r[D]=r[D]or{}elseif U==2 then
cY=D
ax=0
elseif U==3 then
bj=D
else
if ax==0 then
ax=cY
bj=bj-1
bk={}r[bM][#r[bM]+1]=bk
end
bk[#bk+1]=D
ax=ax-1
U=bP(ax,bj)>0 and U-1 or 0
end
U=U+1
D=""
else
D=D..o
end
d=d+1
o=bv.sub(bu,d,d)end
bx=bx+1
aY=bu==""
end
end
if aY then
bg=bg+1
if bO then
bT=aa
aX=au
C={}ap("icoball",{[1]={0,.4,be},[7]=am,[8]=10,[9]={0,-9.81,0}})ap("bowling_lane1",{[1]={0,-am,-8.15},[7]=0,[8]=0})ap("bowling_lane2",{[1]={0,-am,-18.4},[7]=0,[8]=0})ap("bowling_lane3",{[1]={0,-am,-19.5},[7]=0,[8]=0})for d=1,4 do
for g=1,d do
ap("bowling_pin",{[1]={(g-d/2-K)*at,.15,(d-1)*sqrt(at^2-.15^2)},[7]=.75,[8]=50,[9]={0,-9.81,0}})end
end
end
bq=cf((C[1][1][3]-be)/(cX-be),1)cp=bS+(cK-bS)*bq
bU=bf+(cy-bf)*bq
cB=bJ+(cD-bJ)*bq
if not bT then
P[1]=P[1]-cP(3)*cx
P[2]=-.01
aP={sin(P[1])*cp,cB,-cos(P[1])*cp+C[1][1][3]}end
if aX and b_(31)then
aX=aa
bz=0
ab(C[1],s(C[1][1],{0,am,0}),{0,0,50})end
if not aX then
bz=bz+1
end
_=P[1]a=P[2]p=P[3]ah=cos(_)ai=sin(_)ac=cos(a)af=sin(a)ao=cos(p)al=sin(p)bI={{ah*ao-ai*af*al,-ac*al,ah*af*al+ao*ai},{ah*al+ao*ai*af,ac*ao,ai*al-ah*ao*af},{-ac*ai,af,ah*ac}}bo={-ai*ac,af,ah*ac}bD=aa
E={}for I=1,#C do
b=C[I]b[4]=bN(cT(b[4],e(b[5],-bp)))b[1]=s(b[1],e(b[2],bp))b[2]=s(b[2],e(b[3],bp))b[3]=e(b[12],1)b[2]=e(b[2],.9995)b[5]=e(b[5],.9995)cH=cU(bN(b[4]))for d=7,9,2 do
for g=1,#b[d]do
h=b[d][g]h[2]=br(h[1],cH)h[2]=s(h[2],b[1])h[3]=f(h[2],aP)h[4]=br(h[3],bI)bn=h[3]h[7]=sqrt(bn[1]^2+bn[2]^2+bn[3]^2)h[5]={h[4][1]*ak/h[4][3],-h[4][2]*ak/h[4][3]}h[6]=h[4][3]>0 and 1 or-1
end
end
if b[11]>0 or not b[8][1][8]then
for d=1,#b[8]do
c=b[8][d]c[8]=ba(b[7][c[1]][2],b[7][c[2]][2],b[7][c[3]][2])end
end
for d,c in an(b[8])do
w=b[7][c[1]]y=b[7][c[2]]z=b[7][c[3]]c[7]=bP(w[7],y[7],z[7])_=c[8]a=w[3]if j(_,a)>0 then
ay=w[6]+y[6]+z[6]if ay==3 then
E[#E+1]={w[5],y[5],z[5],c[4],c[5],c[6],c[7]}elseif ay>=-1 then
if w[6]==-ay then
S=w[5]T=y[5]M=z[5]elseif y[6]==-ay then
S=y[5]T=w[5]M=z[5]else
S=z[5]T=y[5]M=w[5]end
if ay==1 then
aJ=aH(aS(aV(T,S),1000),T)bh=aH(aS(aV(M,S),1000),M)E[#E+1]={T,aJ,M,c[4],c[5],c[6],c[7]}E[#E+1]={M,aJ,bh,c[4],c[5],c[6],c[7]}else
aJ=aH(aS(aV(S,T),1000),T)bh=aH(aS(aV(S,M),1000),M)E[#E+1]={S,aJ,bh,c[4],c[5],c[6],c[7]}end
end
end
end
end
if aa then
bA=aa
bb=2^16
for d,b in an(C)do
for g=1,#b[8]do
c=b[8][g]cM=cC({0,0,0},bo,b[7][c[1]][3],b[7][c[2]][3],b[7][c[3]][3])if cM and bs<bb then
bA=au
bb=bs
bV=b
end
end
end
if bA then
bD=au
bG=s(e(bo,bb),aP)ab(bV,bG,e(bo,az))if b_(2)then
bV[12]={0,-9.81,0}end
aq=br(f(bG,aP),bI)cm={aq[1]*ak/aq[3],aq[2]*ak/aq[3]}end
end
bt=0
for d,k in an(C)do
for g,l in an(C)do
if d~=g and(k[10]>0 or l[10]>0 or k[11]>0 or l[11]>0)and bW(k[1],l[1])<=k[13]+l[13]then
bt=bt+1
t=cZ(k[9],l[9])if t then
if d==1 and g>=5 then
bT=au
end
ag(k[9],t[1])O=aA
ag(l[9],e(t[1],-1))ad=aA
if#O==1 then
q=O[1]elseif#ad==1 then
q=ad[1]elseif#O==2 and#ad==2 then
bc=f(O[2],O[1])cv=f(ad[2],ad[1])cb=i(cv,i(bc,cv))q=s(O[1],e(bc,j(f(ad[1],O[1]),cb)/j(bc,cb)))else
q=O[1]end
aZ=s(i(k[5],f(q,k[1])),k[2])bl=s(i(l[5],f(q,l[1])),l[2])aN=f(aZ,bl)aU=j(t[1],aN)if aU>0 then
cJ=aI(k,q,t[1])+aI(l,q,t[1])cQ=aU*1
az=cQ/cJ
ab(k,q,e(t[1],-az))ab(l,q,e(t[1],az))aZ=s(i(k[5],f(q,k[1])),k[2])bl=s(i(l[5],f(q,l[1])),l[2])aN=f(aZ,bl)aU=j(t[1],aN)bR=f(aN,e(t[1],aU))cg=bW(bR,{0,0,0})if cg>.001 then
aO=bd(bR)cR=aI(k,q,aO)+aI(l,q,aO)bH=cf(cg/cR,az*at)ab(k,q,e(aO,-bH))ab(l,q,e(aO,bH))end
cj=k[10]+l[10]k[1]=s(k[1],e(t[1],-t[2]*k[10]/cj))l[1]=s(l[1],e(t[1],t[2]*l[10]/cj))end
end
end
end
end
table.sort(E,function(_,a)return _[7]>a[7]end)bO=aa
end
aQ=aQ+1
end
function onDraw()X=screen
local cW,cS,cO,aB,cN=X.drawTriangleF,X.drawTriangle,X.drawRectF,X.setColor,X.drawText
N=X.getWidth()cI=X.getHeight()x=N/2
R=cI/2
ak=x/tan(bU/2)aB(aj,aj,aj)if aY then
for d=1,#E do
c=E[d]w=c[1]y=c[2]z=c[3]aB(c[4],c[5],c[6])cW(w[1]+x,w[2]+R,y[1]+x,y[2]+R,z[1]+x,z[2]+R)aB(c[4]*K,c[5]*K,c[6]*K)cS(w[1]+x,w[2]+R-K,y[1]+x,y[2]+R-K,z[1]+x,z[2]+R-K)end
aB(aj,aj,aj)cN(1,1,bt)if bD then
aR=30/aq[3]cO(cm[1]+x-(aR//2),cm[2]+R-(aR//2),aR,aR)end
end
end
