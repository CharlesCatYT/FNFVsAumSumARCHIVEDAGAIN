function onCreate()

        makeLuaSprite('WAVY', 'skyie', -200, -350)
        addLuaSprite('WAVY',false);
	
	makeLuaSprite('head','face',25,0)
	addLuaSprite('head',false)

	makeLuaSprite('Ground','groun',-550,605)
	addLuaSprite('Ground',false)

end

function onBeatHit()

end

function onStepHit()

end

fr = 0
function onUpdate(elapsed)
fr = fr + elapsed;

setProperty('WAVY.scale.x', 1 + math.cos(fr*3) / 6)
setProperty('WAVY.scale.y', 1 + math.cos(fr*3 + 2) / 6)
setProperty('WAVY.angle', math.sin(fr*3) * 8);

end