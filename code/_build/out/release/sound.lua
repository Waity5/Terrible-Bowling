-- Author: <Authorname> (Please change this in user settings, Ctrl+Comma)
-- GitHub: <GithubLink>
-- Workshop: <WorkshopLink>
--
-- Developed & Minimized using LifeBoatAPI - Stormworks Lua plugin for VSCode
-- https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--      By Nameous Changey
-- Minimized Size: 728 (1093 with comment) chars

c=255
g=input.getNumber
a=0
d=0
function onTick()if g(1)==-1 then
i=true
end
if i then
d=d-1
if g(1)>-1 and d<0 then
a=a+1
d=10
if g(1)==0 then
_=math.floor(a)a=0
if a==1 then
f=360
else
f=180
end
end
end
if _ then
f=f-1
if f<0 then
_=nil
end
end
end
end
function e(string)b((j-5*#string)//2,40,string)end
function onDraw()b,h=screen.drawText,screen.setColor
j=screen.getWidth()k=screen.getHeight()if i then
h(c,c,c)b(1,1,"WASD moves force point (applies spin to ball)")b(1,7,"Left/Right arrow keys to aim initial direction")b(1,13,"Space to fire")b(1,19,"Try to get a strike")if _ then
if _==1 then
h(0,c,0)e("STRIKE!!!")elseif _==2 then
e("SPARE!")elseif _<=5 then
e(_.." balls")else
h(c,0,0)e(_.." balls :(")end
end
end
end
