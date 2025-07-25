
gN = input.getNumber
ballsShot = 0
scoreTimingDelay = 0

function onTick()
	if gN(1)==-1 then
	   running = true
	end
	
	if running then
		scoreTimingDelay = scoreTimingDelay-1
		if gN(1)>-1 and scoreTimingDelay<0 then
			ballsShot = ballsShot+1
			scoreTimingDelay = 10
			if gN(1)==0 then
				scoreReadout=math.floor(ballsShot)
				ballsShot=0
				if ballsShot==1 then
					scoreTimer=360
				else
					scoreTimer=180
				end
			end
		end
		if scoreReadout then
			scoreTimer=scoreTimer-1
			if scoreTimer<0 then
				scoreReadout=nil
			end
		end
		
	end
end

function centreText(string)
	text((w-5*#string)//2,40,string)
end

function onDraw ()
	text,stCl = screen.drawText,screen.setColor
	w = screen.getWidth()
	h = screen.getHeight()
	
	if running then
		stCl(255,255,255)
		text(1,1,"WASD moves force point (applies spin to ball)")
		text(1,7,"Left/Right arrow keys to aim initial direction")
		text(1,13,"Space to fire")
		text(1,19,"Try to get a strike")
		
		if scoreReadout then
			if scoreReadout==1 then
				stCl(0,255,0)
				centreText("STRIKE!!!")
			elseif scoreReadout==2 then
				centreText("SPARE!")
			elseif scoreReadout<=5 then
				centreText(scoreReadout.." balls")
			else
				stCl(255,0,0)
				centreText(scoreReadout.." balls :(")
			end
		end
	end
end