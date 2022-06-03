local sprite_border = "healthbar_border"
local sprite_p1 = "healthbar_p1"
local sprite_p2 = "healthbar_p2"

function lerp(a, b, ratio)
	return a + ratio * (b - a)
end

function onUpdatePost(elapsed)
	local percent_p1 = (getProperty("healthBar.percent")/100)
	local percent_p2 = 1 - percent_p1
	
	local healthBarPercent = getProperty("healthBar.percent")
	local healthBarWidth = getProperty('healthBar.width')
	
	local scale_p1 = (percent_p1 * 2) + (percent_p1 < 1 and 0.01 or 0)
	local scale_p2 = percent_p2 * 2 - (percent_p1 < 1 and 0.01 or 0)
	setProperty(sprite_p1 .. ".scale.x", scale_p1)
	
	local real_width_p1 = getProperty(sprite_p1 .. ".width") * scale_p1
	local real_width_p2 = getProperty(sprite_p2 .. ".width") * scale_p2
	
	local center_p1 = -getProperty("iconP1.frameWidth") / 2
	local center_p2 = -getProperty("iconP2.frameWidth") / 2

	setProperty("iconP2.y", getProperty('healthbar_border.y') + (getProperty("iconP2.height") / 2)-147)
	setProperty("iconP1.y", getProperty('healthbar_border.y') + (getProperty("iconP1.height") / 2)-147)
end

function onBeatHit()
	scaleObject('iconP1', 1.3, 1.3)
	doTweenX('iconauohsdohjas', 'iconP1.scale', 1, crochet/1000, 'circOut')
	doTweenY('iconauohsdohjas2', 'iconP1.scale', 1, crochet/1000, 'circOut')
	
	scaleObject('iconP2', 1.3, 1.3)
	doTweenX('iconauohsdohjas3', 'iconP2.scale', 1, crochet/1000, 'circOut')
	doTweenY('iconauohsdohjas4', 'iconP2.scale', 1, crochet/1000, 'circOut')
end