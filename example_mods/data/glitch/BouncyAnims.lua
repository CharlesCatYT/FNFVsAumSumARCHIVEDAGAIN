-- configs lmao
local squash = 0.9
local speed = 0.1
-- end of configs lmao 


function opponentNoteHit(id, direction, noteType, isSustainNote)
	setProperty('dad.scale.y', squash)
	doTweenY('funnytweendad', 'dad.scale', 1, speed, 'cubeOut')
end