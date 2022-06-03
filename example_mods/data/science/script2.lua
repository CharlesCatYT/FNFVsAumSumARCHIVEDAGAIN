function onBeatHit()
	if curBeat < 128 then
		triggerEvent('Add Camera Zoom', 0.04,0.05)

		if curBeat % 2 == 0 then
			angleshit = anglevar;
		else
			angleshit = -anglevar;
		end
		setProperty('camHUD.angle',angleshit*2)
		setProperty('camGame.angle',angleshit*2)
		doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.001, 'circOut')
		doTweenX('tuin', 'camHUD', -angleshit*5, crochet*0.0005, 'linear')
		doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.001, 'circOut')
		doTweenX('ttrn', 'camGame', -angleshit*5, crochet*0.0005, 'linear')
	else
		setProperty('camHUD.angle',0)
		setProperty('camHUD.x',0)
		setProperty('camHUD.x',0)
	end
		
end