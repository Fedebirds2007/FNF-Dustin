function onCreatePost()
	setVar('gfcamx', 4850)
	setVar('gfcamy', 1800)
	setProperty('boyfriend.alpha', 0)
	setProperty('gfGroup.alpha', 0)
	setProperty('gf.visible', false)
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('healthBar.alpha', 0)
end
function onStepHit()
	if curStep == 8 then
		setProperty('blackOverlay.alpha', 0)
	end
	if curStep == 256 then
		cameraShake('game', 0.03, 0.4)
	end
	if curStep == 258 then
		playAnim('YOUAREtitlecard', 'introtitle', true)
	end
	if curStep == 768 then
		setProperty('bg_player.visible', false)
		setProperty('tv_player.visible', false)
		setProperty('ground_player.visible', false)
		setProperty('boyfriend.alpha', 1)
		setProperty('kinemorto.alpha', 1)
		setProperty('light_player.alpha', 1)
	end
	if curStep == 1024 then
		setProperty('kinemorto.alpha', 0)
		setProperty('light_player.alpha', 0.4)
	end
	if curStep == 1033 then
		setProperty('boyfriendGroup.x', -520)
		setProperty('door.alpha', 1)
		setProperty('dadGroup.alpha', 0.8)
	end
	if curStep == 1311 then
		setProperty('door.alpha', 0)
		setProperty('dadGroup.alpha', 1)
		setProperty('boyfriend.alpha', 0)
		setProperty('light_player.alpha', 1)
		setProperty('bg_player.visible', true)
		setProperty('tv_player.visible', true)
		setProperty('ground_player.visible', true)
		particlesActive = true
	end
	if curStep == 1320 then
		setProperty('boyfriendGroup.x', 1000)
	end
	-- CAMBIOS DE ESCENA --
	if curStep == 1600 then
		particlesActive = false
		setProperty('bg_player.visible', false)
		setProperty('tv_player.visible', false)
		setProperty('ground_player.visible', false)
		setProperty('flowers.alpha', 1)
		setProperty('light_player.alpha', 0)
	end
	if curStep == 1828 then
		setProperty('flowers.alpha', 0)
		setProperty('waterfall.alpha', 1)
	end
	if curStep == 1952 then
		setProperty('waterfall.alpha', 0)
		setProperty('HOTLANDFINALE.alpha', 1)
	end
	if curStep == 2016 then
		setProperty('HOTLANDFINALE.alpha', 0)
		setProperty('lab.alpha', 1)
	end
	if curStep == 2096 then
		setProperty('lab.alpha', 0)
		setProperty('pixel_bg.alpha', 1)
		setVar('theEndText.visible', true)
	end
	-- SANS :v --
	if curStep == 2764 then
		--setProperty('heart.alpha', 1)
		setProperty('boyfriend.alpha', 1)
		setProperty('pixel_bg.alpha', 0)
		setVar('theEndText.visible', false)
		setProperty('sans_bg.alpha', 1)
		setProperty('sans_fg.alpha', 1)
	end
end