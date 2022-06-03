local one_star_score = 0
local two_star_score = 0
local three_star_score = 0
local four_star_score = 0
local five_star_score = 0
local max_score = 0
local stars_given = {false, false, false, false, false}
local stars_given_count = 0
function onCreatePost()
    makeLuaSprite("AccMeter", "AccMeter", 1022.25, 468.45)
    addLuaSprite("AccMeter")
    setObjectCamera("AccMeter", "hud")

    makeLuaSprite("AccMeter_Bar", "Bar", 1041.3, 702)
    setObjectCamera("AccMeter_Bar", "hud")
    addLuaSprite("AccMeter_Bar")

    setProperty("AccMeter_Bar.x", 1041.3 + getProperty("AccMeter_Bar.height"))

    setProperty("AccMeter_Bar.origin.x", getProperty("AccMeter_Bar.width") - getProperty("AccMeter_Bar.height"))
    setProperty("AccMeter_Bar.origin.y", getProperty("AccMeter_Bar.height") - getProperty("AccMeter_Bar.height"))

    makeLuaSprite("Score_Bar", nil, 10, 710 - 18)
    makeGraphic("Score_Bar", 505, 18, "000000")
    setObjectCamera("Score_Bar", "hud")
    addLuaSprite("Score_Bar")

    makeLuaSprite("Score_Bar_Fill", nil, 15, 715 - 18)
    makeGraphic("Score_Bar_Fill", 505 - 10, 18 - 10, "FFFFFF")
    setObjectCamera("Score_Bar_Fill", "hud")
    addLuaSprite("Score_Bar_Fill")

    --calculating starring system
    local num_notes = getProperty("unspawnNotes.length")
    for i = 0, num_notes do
        if not getPropertyFromGroup("unspawnNotes", i, "mustPress") then
            num_notes = num_notes - 1
        end
        if getPropertyFromGroup("unspawnNotes", i, "isSustainNote") and getPropertyFromGroup("unspawnNotes", i, "mustPress") then
            num_notes = num_notes - 1
        end
    end
    max_score = num_notes * 350
    one_star_score = max_score * 0.1
    two_star_score = max_score * 0.3
    three_star_score = max_score * 0.5
    four_star_score = max_score * 0.7
    five_star_score = max_score * 0.9

    debugPrint("Num notes: " .. num_notes)
    debugPrint("Max score: " .. max_score)
    debugPrint("1 star: " .. one_star_score)
    debugPrint("2 star: " .. two_star_score)
    debugPrint("3 star: " .. three_star_score)
    debugPrint("4 star: " .. four_star_score)
    debugPrint("5 star: " .. five_star_score)
end

function onUpdate()
    --local score = getProperty("songScore")
    if score > one_star_score and stars_given[1] == false then
        stars_given[1] = true
        stars_given_count = stars_given_count + 1
        playSound("BOOM")
    end
    if score > two_star_score and stars_given[2] == false then
        stars_given[2] = true
        stars_given_count = stars_given_count + 1
        playSound("BOOM")
    end
    if score > three_star_score and stars_given[3] == false then
        stars_given[3] = true
        stars_given_count = stars_given_count + 1
        playSound("BOOM")
    end
    if score > four_star_score and stars_given[4] == false then
        stars_given[4] = true
        stars_given_count = stars_given_count + 1
        playSound("BOOM")
    end
    if score > five_star_score and stars_given[5] == false then
        stars_given[5] = true
        stars_given_count = stars_given_count + 1
        playSound("BOOM")
    end

    -- set the score bar fill width to a percentage of the score
    local score_percent = score / max_score
    setGraphicSize("Score_Bar_Fill", math.floor(score_percent * (getProperty("Score_Bar.width") - 10)), 18 - 10)


    setProperty("AccMeter_Bar.x", 1041.3 + getProperty("AccMeter_Bar.height") * rating)
    setProperty("AccMeter_Bar.angle", calculateAngle(rating))
end

function goodNoteHit(a, b, c, d)
    if not d then
        setProperty("songScore", getProperty("songScore") + 350)
        score = getProperty("songScore")
    end
end

-- calculate the angle for the meter bar based on a percentage, meter occupies 1 forth of a circle
function calculateAngle(percentage)
    return percentage * 360 / 4
end