function onCreate()
    if getPropertyFromClass('PlayState', 'chartingMode') then
        makeLuaText('opponentoffsx', 'Opponent X: dadX', 200, 1000, 150)
        makeLuaText('opponentoffsy', 'Opponent Y: dadY', 200, 1000, 200)
        addLuaText('opponentoffsx')
        addLuaText('opponentoffsy')
        
        makeLuaText('p3offsx', 'Dancer X: gfX', 200, 1000, 300)
        makeLuaText('p3offsy', 'Dancer Y: gfY', 200, 1000, 350)
        addLuaText('p3offsx')
        addLuaText('p3offsy')
        
        makeLuaText('playeroffsx', 'Player X: bfX', 200, 1000, 450)
        makeLuaText('playeroffsy', 'Player Y: bfY', 200, 1000, 500)
        addLuaText('playeroffsx')
        addLuaText('playeroffsy')
    end
end

local dadBinds = {'A', 'D', 'W', 'S'}
local gfBinds = {'J', 'L', 'I', 'K'}
local bfBinds = {'LEFT', 'RIGHT', 'UP', 'DOWN'}
local moreBind = 'SPACE'
function onUpdate(elapsed)
    if getPropertyFromClass('PlayState', 'chartingMode') then
        setTextString('opponentoffsx', 'Opponent X: ' .. tostring(getCharacterX('dad')))
        setTextString('opponentoffsy', 'Opponent Y: ' .. tostring(getCharacterY('dad')))
        setTextSize('opponentoffsx', 30)
        setTextSize('opponentoffsy', 30)
        --[[setTextColor('opponentoffsx', getProperty('dad.healthColorArray'))
        setTextColor('opponentoffsy', getProperty('dad.healthColorArray'))]]

        setTextString('p3offsx', 'Dancer X: ' .. tostring(getCharacterX('gf')))
        setTextString('p3offsy', 'Dancer Y: ' .. tostring(getCharacterY('gf')))
        setTextSize('p3offsx', 30)
        setTextSize('p3offsy', 30)
        --[[setTextColor('p3offsx', 'a5004d')
        setTextColor('p3offsy', 'a5004d')]]

        setTextString('playeroffsx', 'Player X: ' .. tostring(getCharacterX('boyfriend')))
        setTextString('playeroffsy', 'Player Y: ' .. tostring(getCharacterY('boyfriend')))
        setTextSize('playeroffsx', 30)
        setTextSize('playeroffsy', 30)
        --[[setTextColor('playeroffsx', getProperty('bf.healthColorArray'))
        setTextColor('playeroffsy', getProperty('bf.healthColorArray'))]]

        if botPlay then
            if getPropertyFromClass("flixel.FlxG","keys.justPressed." .. dadBinds[1]) then
                setCharacterX('dad', getCharacterX('dad') - 1)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed." .. dadBinds[2]) then
                setCharacterX('dad', getCharacterX('dad') + 1)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed." .. dadBinds[3]) then
                setCharacterY('dad', getCharacterY('dad') - 1)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed." .. dadBinds[4]) then
                setCharacterY('dad', getCharacterY('dad') + 1)
            end

            if getPropertyFromClass("flixel.FlxG","keys.justPressed." .. gfBinds[1]) then
                setCharacterX('gf', getCharacterX('gf') - 1)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed." .. gfBinds[2]) then
                setCharacterX('gf', getCharacterX('gf') + 1)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed." .. gfBinds[3]) then
                setCharacterY('gf', getCharacterY('gf') - 1)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed." .. gfBinds[4]) then
                setCharacterY('gf', getCharacterY('gf') + 1)
            end

            if getPropertyFromClass("flixel.FlxG","keys.justPressed." .. bfBinds[1]) then
                setCharacterX('boyfriend', getCharacterX('boyfriend') - 1)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed." .. bfBinds[2]) then
                setCharacterX('boyfriend', getCharacterX('boyfriend') + 1)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed." .. bfBinds[3]) then
                setCharacterY('boyfriend', getCharacterY('boyfriend') - 1)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed." .. bfBinds[4]) then
                setCharacterY('boyfriend', getCharacterY('boyfriend') + 1)
            end
        else
            -- Leave Blank
        end
    end
end

function onUpdatePost(elapsed)
    if getPropertyFromClass('PlayState', 'chartingMode') then
        if botPlay then
            if getPropertyFromClass("flixel.FlxG","keys.justPressed.A") and getPropertyFromClass("flixel.FlxG", "keys.pressed." .. moreBind) then
                setCharacterX('dad', getCharacterX('dad') - 9)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed.D") and getPropertyFromClass("flixel.FlxG", "keys.pressed." .. moreBind) then
                setCharacterX('dad', getCharacterX('dad') + 9)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed.W") and getPropertyFromClass("flixel.FlxG", "keys.pressed." .. moreBind) then
                setCharacterY('dad', getCharacterY('dad') - 9)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed.S") and getPropertyFromClass("flixel.FlxG", "keys.pressed." .. moreBind) then
                setCharacterY('dad', getCharacterY('dad') + 9)
            end

            if getPropertyFromClass("flixel.FlxG","keys.justPressed.J") and getPropertyFromClass("flixel.FlxG", "keys.pressed." .. moreBind) then
                setCharacterX('gf', getCharacterX('gf') - 9)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed.L") and getPropertyFromClass("flixel.FlxG", "keys.pressed." .. moreBind) then
                setCharacterX('gf', getCharacterX('gf') + 9)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed.I") and getPropertyFromClass("flixel.FlxG", "keys.pressed." .. moreBind) then
                setCharacterY('gf', getCharacterY('gf') - 9)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed.K") and getPropertyFromClass("flixel.FlxG", "keys.pressed." .. moreBind) then
                setCharacterY('gf', getCharacterY('gf') + 9)
            end

            if getPropertyFromClass("flixel.FlxG","keys.justPressed.LEFT") and getPropertyFromClass("flixel.FlxG", "keys.pressed." .. moreBind) then
                setCharacterX('boyfriend', getCharacterX('boyfriend') - 9)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed.RIGHT") and getPropertyFromClass("flixel.FlxG", "keys.pressed." .. moreBind) then
                setCharacterX('boyfriend', getCharacterX('boyfriend') + 9)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed.UP") and getPropertyFromClass("flixel.FlxG", "keys.pressed." .. moreBind) then
                setCharacterY('boyfriend', getCharacterY('boyfriend') - 9)
            elseif getPropertyFromClass("flixel.FlxG", "keys.justPressed.DOWN") and getPropertyFromClass("flixel.FlxG", "keys.pressed." .. moreBind) then
                setCharacterY('boyfriend', getCharacterY('boyfriend') + 9)
            end
        else
            -- Leave Blank
        end
    end
end