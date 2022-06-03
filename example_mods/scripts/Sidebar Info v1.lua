local sick = 0;
local good = 0;
local bad = 0;
local shit = 0;
local tnh = 0;

--Made by Acap09
--Version 1: The Release
--Last Updated on: ??? ??? 2022

--custom functions xD
function getPropertyClass(class, property)
    return getPropertyFromClass(class, property)
end

function sideBarTxtTweenX(tagPr, tag, tagSu, posX, length, ease)
    doTweenX(tagPr..tag..tagSu..'-tnh', 'tnhTxt', posX, length, ease);
    doTweenX(tagPr..tag..tagSu..'-sick', 'sickTxt', posX, length, ease);
    doTweenX(tagPr..tag..tagSu..'-good', 'goodTxt', posX, length, ease);
    doTweenX(tagPr..tag..tagSu..'-bad', 'badTxt', posX, length, ease);
    doTweenX(tagPr..tag..tagSu..'-shit', 'shitTxt', posX, length, ease);
end 

function setColorProperty(obj, hex)
    setProperty(obj..'.color', getColorFromHex(hex))
end

--important functions dont delete D:
function onCreatePost()
    makeLuaText('tnhTxt', 'Total Notes Hit: 0', width, 22, 300+(23*0));
	setTextAlignment('tnhTxt', 'left');
	setTextFont('tnhTxt', 'PA font.ttf');
	addLuaText('tnhTxt');
	setTextSize('tnhTxt', 23);
	
	makeLuaText('sickTxt', 'Sicks: 0', width, 22, 300+(23*1));
	setTextAlignment('sickTxt', 'left');
	setTextFont('sickTxt', 'PA font.ttf');
	addLuaText('sickTxt');
	setTextSize('sickTxt', 23);
	
	makeLuaText('goodTxt', 'Goods: 0', width, 22, 300+(23*2));
	setTextAlignment('goodTxt', 'left');
	setTextFont('goodTxt', 'PA font.ttf');
	addLuaText('goodTxt');
	setTextSize('goodTxt', 23);
	
	makeLuaText('badTxt', 'Bads: 0', width, 22, 300+(23*3));
	setTextAlignment('badTxt', 'left');
	setTextFont('badTxt', 'PA font.ttf');
	addLuaText('badTxt');
	setTextSize('badTxt', 23);
	
	makeLuaText('shitTxt', 'Shits: 0', width, 22, 300+(23*4));
	setTextAlignment('shitTxt', 'left');
	setTextFont('shitTxt', 'PA font.ttf');
	addLuaText('shitTxt');
	setTextSize('shitTxt', 23);
	
	makeLuaText('missesTxt', 'Misses: 0', width, 22, 300+(23*5));
	setTextAlignment('missesTxt', 'left');
	setTextFont('missesTxt', 'PA font.ttf');
	addLuaText('missesTxt');
	setTextSize('missesTxt', 23);
	
	firstNoteStrumTime = getPropertyFromGroup('unspawnNotes', 0, 'strumTime');
end

function goodNoteHit(id, dir, type, sustain)
    tnh = tnh+1;
	if not sustain then
	    if getPropertyFromGroup('notes', id, 'rating') == 'sick' then
		    sick = sick+1;
			
			setColorProperty('sickTxt', '00FF00');
			doTweenColor('sickTransitionXD', 'sickTxt', 'FFFFFF', 0.35, 'linear');
			
			setColorProperty('tnhTxt', '00FF00');
			doTweenColor('tnhTransitionXD', 'tnhTxt', 'FFFFFF', 0.35, 'linear');
		elseif getPropertyFromGroup('notes', id, 'rating') == 'good' then
		    good = good+1;
			
			setColorProperty('goodTxt', '00FF00');
			doTweenColor('goodTransitionXD', 'goodTxt', 'FFFFFF', 0.35, 'linear');
			
			setColorProperty('tnhTxt', 'A4FF00');
			doTweenColor('tnhTransitionXD', 'tnhTxt', 'FFFFFF', 0.35, 'linear');
		elseif getPropertyFromGroup('notes', id, 'rating') == 'bad' then
		    bad = bad+1;
			
			setColorProperty('badTxt', '00FF00');
			doTweenColor('badTransitionXD', 'badTxt', 'FFFFFF', 0.35, 'linear');
			
			setColorProperty('tnhTxt', 'FFFF00');
			doTweenColor('tnhTransitionXD', 'tnhTxt', 'FFFFFF', 0.35, 'linear');
		elseif getPropertyFromGroup('notes', id, 'rating') == 'shit' then
		    shit = shit+1;
			
			setColorProperty('shitTxt', '00FF00');
			doTweenColor('shitTransitionXD', 'shitTxt', 'FFFFFF', 0.35, 'linear');
			
			setColorProperty('tnhTxt', 'FFA500');
			doTweenColor('tnhTransitionXD', 'tnhTxt', 'FFFFFF', 0.35, 'linear');
		end
	end
end

function noteMiss(id, dir, type, sustain)
    setColorProperty('missesTxt', 'FF0000');
	doTweenColor('missTransitionXD', 'missesTxt', 'FFFFFF', 0.35, 'linear');
	
	setColorProperty('tnhTxt', 'FF0000');
	doTweenColor('tnhTransitionXD', 'tnhTxt', 'FFFFFF', 0.35, 'linear');
end

function onUpdatePost(elapsed)
    curSongPosMil = getPropertyFromClass('Conductor', 'songPosition');
    if curSongPosMil/1000 == firstNoteStrumTime/1000 then
	    sideBarTxtTweenX('', 'startTween', '-1', getProperty('tnhTxt.x')+20, 1, 'linear');
	end
	
	setTextString('tnhTxt', 'Total Notes Hit: '..tnh);
	setTextString('sickTxt', 'Sicks: '..sick);
	setTextString('goodTxt', 'Goods: '..good);
	setTextString('badTxt', 'Bads: '..bad);
	setTextString('ShitsTxt', 'Shits: '..shit);
	setTextString('missesTxt', misses == 0 and 'FC' or 'Misses: '..misses);
	if misses == 0 then
	    setColorProperty('missesTxt', 'C4FFC4');
	end
end