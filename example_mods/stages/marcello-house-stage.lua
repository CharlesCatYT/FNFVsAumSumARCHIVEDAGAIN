function onCreate()

	makeLuaSprite('nighSky','marcellocity_sky',-300,-200)
	setScrollFactor('bamber confused', 0.9, 0.9);
	
	makeLuaSprite('city','marcellohouse_city',-300,-200)
	setScrollFactor('bamber confused', 0.9, 0.9);

	makeLuaSprite('House','marcellohouse_house',-300,-200)
	setScrollFactor('bamber confused', 0.9, 0.9);

	makeAnimatedLuaSprite('marcello','Marcello_Confused',-125,200)addAnimationByPrefix('marcello','confuse','mark cellyo confused bop',24,true)
	objectPlayAnimation('marcello','dance',false)
	setScrollFactor('marcello', 0.9, 0.9);

	addLuaSprite('nightSky',false);
	addLuaSprite('city',false);
	addLuaSprite('House',false);
	addLuaSprite('marcello',false);

close(true);

end

function onBeatHit()

end

function onStepHit()

end

function onUpdate()

end