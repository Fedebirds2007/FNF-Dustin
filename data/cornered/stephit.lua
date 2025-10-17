function onCreatePost()
	setVar('gfcamx', 650)
	setVar('gfcamy', 520)
end

function onStepHit()

	if curStep == 740 then
		doTweenAlpha('bg', 'bg', 0, 2, 'quadOut')
		doTweenAlpha('bg_front', 'bg_front', 0, 2, 'quadOut')
		doTweenAlpha('wall_left', 'wall_left', 0, 2, 'quadOut')
		doTweenAlpha('wall_right', 'wall_right', 0, 2, 'quadOut')
		doTweenAlpha('bridge', 'bridge', 0, 3, 'quadOut')
		doTweenAlpha('shards', 'shards', 0, 3, 'quadOut')
		doTweenAlpha('gf', 'gf', 0, 3, 'quadOut')
		doTweenAlpha('dad', 'dad', 0, 3, 'quadOut')
		doTweenAlpha('cracks', 'cracks', 0, 3, 'quadOut')
		doTweenAlpha('bones', 'bones', 0, 3, 'quadOut')
	end
	if curStep == 761 then
		doTweenAlpha('bg', 'bg', 1, 4.5, 'quadOut')
		doTweenAlpha('bg_front', 'bg_front', 1, 4.5, 'quadOut')
		doTweenAlpha('wall_left', 'wall_left', 1, 4.5, 'quadOut')
		doTweenAlpha('wall_right', 'wall_right', 1, 4.5, 'quadOut')
		doTweenAlpha('bridge', 'bridge', 1, 3.5, 'quadOut')
		doTweenAlpha('shards', 'shards', 1, 3.5, 'quadOut')
		doTweenAlpha('cracks', 'cracks', 1, 3.5, 'quadOut')
		doTweenAlpha('bones', 'bones', 1, 3.5, 'quadOut')
		setProperty('gf.alpha', 0)
		setProperty('dad.alpha', 0)
	end
	if curStep == 761 then
		setProperty('dad.alpha', 0)
		doTweenAlpha('dad', 'dad', 1, 3, 'quadOut')
	end
	if curStep == 1095 then
		doTweenAlpha('dad', 'dad', 0, 1.5, 'quadOut')
	end
	if curStep == 1107 then
		setProperty('dad.alpha', 1)
		setProperty('gf.alpha', 1)
	end
	if curStep == 1295 then
		cameraShake('other', 0.015, 0.4)
		setProperty('blackOverlay.alpha', 1)
		setProperty('BLASTER_IMPACT1.alpha', 1)
		runTimer('undynehit', 0.2)
	end
	if curStep == 1526 then
		doTweenAlpha('blackOverlay', 'blackOverlay', 1, 1.5, 'quadOut')
		setVar('gfcamy', 490)
		cameraShake('game', 0.002, 0.3)
	end
	if curStep == 1530 then
		cameraShake('game', 0.004, 0.3)
	end
	if curStep == 1533 then
		cameraShake('game', 0.006, 0.4)
	end
	if curStep == 1536 then
		cameraShake('game', 0.008, 0.4)
	end
	if curStep == 1539 then
		cameraShake('game', 0.01, 0.3)
	end
	if curStep == 1541 then
		cameraShake('game', 0.015, 0.3)
	end
	if curStep == 1543 then
		cameraShake('game', 0.02, 0.5)
		setProperty('cracks.alpha', 0)
		setProperty('bones.alpha', 0)
		setProperty('blackOverlay.alpha', 0)
	end
	if curStep == 2157 then
		cameraShake('other', 0.02, 0.6)
		setProperty('BLASTER_IMPACT4.alpha', 1)
		setProperty('blackOverlay.alpha', 1)
		runTimer('blasterboom', 0.2)
		setVar('gfcamx', 610)
		setVar('gfcamy', 570)
	end
end
function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'undynehit' then
		setProperty('BLASTER_IMPACT1.alpha', 0)
		setProperty('BLASTER_IMPACT2.alpha', 1)
		runTimer('U2', 0.1)
	end
	if tag == 'U2' then
		setProperty('BLASTER_IMPACT2.alpha', 0)
		setProperty('BLASTER_IMPACT3.alpha', 1)
		runTimer('U3', 0.1)
	end
	if tag == 'U3' then
		setProperty('BLASTER_IMPACT3.alpha', 0)
		runTimer('overlay', 0.4)
	end
	if tag == 'blasterboom' then
		setProperty('BLASTER_IMPACT4.alpha', 0)
		setProperty('BLASTER_IMPACT5.alpha', 1)
		runTimer('B2', 0.1)
	end
	if tag == 'B2' then
		setProperty('BLASTER_IMPACT5.alpha', 0)
		setProperty('BLASTER_IMPACT6.alpha', 1)
		runTimer('B3', 0.1)
	end
	if tag == 'B3' then
		setProperty('BLASTER_IMPACT6.alpha', 0)
		runTimer('overlay', 0.4)
	end
	if tag == 'overlay' then
		setProperty('blackOverlay.alpha', 0)
	end

end