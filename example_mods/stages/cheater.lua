function onCreate()
makeLuaSprite('WAVY', 'anticheat', -600, -200)
addLuaSprite('WAVY',false);
end
fr = 0
function onUpdate(elapsed)
fr = fr + elapsed;

setProperty('WAVY.scale.x', 1 + math.cos(fr*3) / 6)
setProperty('WAVY.scale.y', 1 + math.cos(fr*3 + 2) / 6)
setProperty('WAVY.angle', math.sin(fr*3) * 8);
end