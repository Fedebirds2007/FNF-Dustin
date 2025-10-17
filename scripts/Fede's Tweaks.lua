-- I know is messy as hell, its sht and all of that, but Im trying to make it work first >:c -Fedebirds2007
-- In cornered doesn't work properly :v.
function onCreatePost()
	setVar("Strum_and_NoteSkin", true)  --Cambiar la noteskin y strumskin en createpost y eventos, o borras es script para deshabilitarlo o lo dejas en false :)
	StrumNoteSkin = getVar("Strum_and_NoteSkin")
	setProperty('grpHoldSplashes.visible', false) -- ugh caca
end

----- This script may conflict with others that modifies Strum's alpha !!

delayStart = 1250 -- How far the notes are to appear (in ms)
delayEnd = 0 -- How close the notes are to disappear (in ms)
fadeInDur = 1 -- How long strum takes to appear (in seconds)
fadeOutDur = 1 -- How long strum takes to disappear (in seconds)
affectsOpponent = true -- Applies to Opponent's strum

-----

noteVisible = false
noteVisibleOpp = false
oppTargetAlpha = 0.9
function onCreate()
	if (getPropertyFromClass('backend.ClientPrefs','data.middleScroll') == true or getPropertyFromClass('ClientPrefs','middleScroll') == true) then
		oppTargetAlpha = 0.35
	end

end
function onUpdatePost()
	for i=0, getProperty('notes.length')-1 do
		local strumTime = getPropertyFromGroup('notes',i,'strumTime')
		local dist = strumTime - getSongPosition()
		if dist < delayStart and dist >= delayEnd and getPropertyFromGroup('notes',i,'mustPress') and not (getPropertyFromGroup('notes',i,'noteType') == 'NOTE_undyne') then
			noteVisible = true
			break
		end
	end
	if noteVisible == true then
		noteTweenAlpha('c1',4,0.9,fadeInDur,'expoOut')
		noteTweenAlpha('c2',5,0.9,fadeInDur,'expoOut')
		noteTweenAlpha('c3',6,0.9,fadeInDur,'expoOut')
		noteTweenAlpha('c4',7,0.9,fadeInDur,'expoOut')
	else	
		noteTweenAlpha('c1',4,0,fadeOutDur,'expoOut')
		noteTweenAlpha('c2',5,0,fadeOutDur,'expoOut')
		noteTweenAlpha('c3',6,0,fadeOutDur,'expoOut')
		noteTweenAlpha('c4',7,0,fadeOutDur,'expoOut')
	end
	--Opponent
	if (getPropertyFromClass('backend.ClientPrefs','data.opponentStrums') == true or getPropertyFromClass('ClientPrefs','opponentStrums') == true) and affectsOpponent == true then
		for i=0, getProperty('notes.length')-1 do
			local strumTime = getPropertyFromGroup('notes',i,'strumTime')
			local dist = strumTime - getSongPosition()
			if dist < delayStart and dist >= delayEnd and not getPropertyFromGroup('notes',i,'mustPress') and not (getPropertyFromGroup('notes',i,'noteType') == 'NOTE_undyne') then
				noteVisibleOpp = true
				break
			end
		end
		if noteVisibleOpp == true then
			noteTweenAlpha('d1',0,oppTargetAlpha,fadeInDur,'expoOut')
			noteTweenAlpha('d2',1,oppTargetAlpha,fadeInDur,'expoOut')
			noteTweenAlpha('d3',2,oppTargetAlpha,fadeInDur,'expoOut')
			noteTweenAlpha('d4',3,oppTargetAlpha,fadeInDur,'expoOut')
		else	
			noteTweenAlpha('d1',0,0,fadeOutDur,'expoOut')
			noteTweenAlpha('d2',1,0,fadeOutDur,'expoOut')
			noteTweenAlpha('d3',2,0,fadeOutDur,'expoOut')
			noteTweenAlpha('d4',3,0,fadeOutDur,'expoOut')
		end
		noteVisibleOpp = false
	end
	noteVisible = false
	--setPropertyFromClass('ClientPrefs', 'comboOffset', {600, -290, 700, -670});
end