selected = 'title'
loopCancel = false
inputFile = 'mods/images/gfDanceTitle.json' -- this is for the autosave process

function onCreate()
    setProperty('boyfriend.visible', false)
    setProperty('dad.visible', false)
    setProperty('gf.visible', false)
    --setProperty('camHUD.visible', false)

    makeAnimatedLuaSprite('title', 'logoBumpin', -150, -100)
    addAnimationByPrefix('title', 'bump', 'logo bumpin', 24, true)
    addLuaSprite('title', false)

    makeAnimatedLuaSprite('gfT', 'gfDanceTitle', 512, 40) -- named gfT to avoid confusion with the actual gameplay gf
    addAnimationByPrefix('gfT', 'headbang', 'gfDance', 24, true)
    addLuaSprite('gfT', false)

    makeAnimatedLuaSprite('start', 'titleEnter', 100, 576)
    addAnimationByPrefix('start', 'flasher', 'Press Enter to Begin', 24, true)
    addLuaSprite('start', false)

    setProperty("strumLineNotes.visible", false)
	setProperty("grpNoteSplashes.visible", false)
	setProperty("notes.visible", false)
	setProperty("healthBar.visible", false)
	setProperty("healthBarBG.visible", false)
	setProperty("iconP1.visible", false)
	setProperty("iconP2.visible", false)
	setProperty("scoreTxt.visible", false)
	setProperty("botplayTxt.visible", false)
	setProperty("timeBar.visible", false)
	setProperty("timeBarBG.visible", false)
	setProperty("timeTxt.visible", false)
	setProperty("doof.visible", false)

    makeLuaText('titleText', "logoBumpin: [" .. getProperty('title.x') .. ", " .. getProperty('title.y') .. "]", 512, 10, 35)
    addLuaText('titleText')
    setTextAlignment('titleText', 'left')

    makeLuaText('gfText', "gfDanceTitle: [" .. getProperty('gfT.x') .. ", " .. getProperty('gfT.y') .. "]", 512, 10, 55)
    addLuaText('gfText')
    setTextAlignment('gfText', 'left')

    makeLuaText('enterText', "titleEnter: [" .. getProperty('start.x') .. ", " .. getProperty('start.y') .. "]", 512, 10, 75)
    addLuaText('enterText')
    setTextAlignment('enterText', 'left')
end

function onEndSong()
    saveData()
end

function onUpdate()
    setTextString('titleText', "logoBumpin: [" .. getProperty('title.x') .. ", " .. getProperty('title.y') .. "]")
    setTextString('gfText', "gfDanceTitle: [" .. getProperty('gfT.x') .. ", " .. getProperty('gfT.y') .. "]")
    setTextString('enterText', "titleEnter: [" .. getProperty('start.x') .. ", " .. getProperty('start.y') .. "]")

    if selected == 'title' then
        setTextColor('titleText', '0xFF0000')
        setTextColor('enterText', '0xFFFFFF')
        setTextColor('gfText', '0xFFFFFF')
    end

    if selected == 'start' then
        setTextColor('enterText', '0xFF0000')
        setTextColor('gfText', '0xFFFFFF')
        setTextColor('titleText', '0xFFFFFF')
    end

    if selected == 'gf' then
        setTextColor('gfText', '0xFF0000')
        setTextColor('enterText', '0xFFFFFF')
        setTextColor('titleText', '0xFFFFFF')
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
        saveData() -- DONT SPAM SPACE IT CRASHES THE GAME (at least for me)
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.R') then
        setProperty('title.x', -150)
        setProperty('title.y', -100)
        setProperty('gfT.x', 512)
        setProperty('gfT.y', 40)
        setProperty('start.x', 100)
        setProperty('start.y', 576)
        debugPrint('Reverted TitleState to Normal Positions') -- DONT SPAM R EITHER IT ALSO CRASHES THE GAME
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') then
        if selected == 'title' then
            selected = 'start'
            loopCancel = false
        end
        if selected == 'gf' then
            selected = 'title'
        end
        if selected == 'start' then
            if loopCancel then
                selected = 'gf'
            end
            loopCancel = true
        end
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') then
        if selected == 'title' then
            selected = 'gf'
            loopCancel = false
        end
        if selected == 'start' then
            selected = 'title'
        end
        if selected == 'gf' then
            if loopCancel then
                selected = 'start'
            end
            loopCancel = true
        end
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.anyPressed([W, A, S, D, SHIFT])') then
        if selected == 'start' then
            moveStart()
        end
        if selected == 'gf' then
            moveGf()
        end
        if selected == 'title' then
            moveTitle()
        end
    end
end

function moveStart()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W') then
        setProperty("start.y",getProperty("start.y") - 1)
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.S') then
        setProperty("start.y",getProperty("start.y") + 1)
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.S') then
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setProperty("start.y",getProperty("start.y") + 20)
        end
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W') then
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setProperty("start.y",getProperty("start.y") - 20)
        end
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
        setProperty("start.x",getProperty("start.x") - 1)
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
        setProperty("start.x",getProperty("start.x") + 1)
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setProperty("start.x",getProperty("start.x") + 20)
        end
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setProperty("start.x",getProperty("start.x") - 20)
        end
    end
end

function moveGf()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W') then
        setProperty("gfT.y",getProperty("gfT.y") - 1)
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.S') then
        setProperty("gfT.y",getProperty("gfT.y") + 1)
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.S') then
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setProperty("gfT.y",getProperty("gfT.y") + 20)
        end
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W') then
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setProperty("gfT.y",getProperty("gfT.y") - 20)
        end
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
        setProperty("gfT.x",getProperty("gfT.x") - 1)
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
        setProperty("gfT.x",getProperty("gfT.x") + 1)
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setProperty("gfT.x",getProperty("gfT.x") + 20)
        end
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setProperty("gfT.x",getProperty("gfT.x") - 20)
        end
    end
end

function moveTitle()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W') then
        setProperty("title.y",getProperty("title.y") - 1)
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.S') then
        setProperty("title.y",getProperty("title.y") + 1)
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.S') then
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setProperty("title.y",getProperty("title.y") + 20)
        end
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W') then
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setProperty("title.y",getProperty("title.y") - 20)
        end
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
        setProperty("title.x",getProperty("title.x") - 1)
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
        setProperty("title.x",getProperty("title.x") + 1)
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setProperty("title.x",getProperty("title.x") + 20)
        end
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SHIFT') then
            setProperty("title.x",getProperty("title.x") - 20)
        end
    end
end

function saveData()
    local file = io.open(inputFile, 'r')
    local fileContent = {}
    for line in file:lines() do
        table.insert(fileContent, line)
    end
    io.close(file)

    fileContent[1] = '{'
    fileContent[2] = "	\"titlex\":" .. getProperty('title.x') .. ","
    fileContent[3] = "	\"titley\":" .. getProperty('title.y') .. ","
    fileContent[4] = "	\"startx\":" .. getProperty('start.x') .. ","
    fileContent[5] = "	\"starty\":" .. getProperty('start.y') .. ","
    fileContent[6] = "	\"gfx\":" .. getProperty('gfT.x') .. ","
    fileContent[7] = "	\"gfy\":" .. getProperty('gfT.y') .. ","
    fileContent[10] = '}' -- we skippin 8 and 9 because we don't have a bpm or bg system yet

    file = io.open(inputFile, 'w')
    for index, value in ipairs(fileContent) do
        file:write(value..'\n')
    end
    io.close(file)

    debugPrint('Saved To JSON File')
end