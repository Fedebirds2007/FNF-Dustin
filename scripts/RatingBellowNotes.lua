function onCreatePost()
	setProperty('showCombo', false)
	setProperty('showComboNum', false)
	setProperty('showRating', false)
	precacheImage('good')
	precacheImage('sick')
	precacheImage('bad')
	precacheImage('shit')
end

local miau = 0
function goodNoteHit(n, d, t, s)
	if not s then
		local rating = 'ratingSprite'..miau
		makeLuaSprite(rating, getPropertyFromGroup('notes', n, 'rating'))
		setProperty(rating..'.x', getPropertyFromGroup('playerStrums', d, 'x') + (getPropertyFromClass('objects.Note', 'swagWidth') / 2) - (getProperty(rating..'.width') / 2) + 140)
		setProperty(rating..'.y', getPropertyFromGroup('playerStrums', d, 'y') + getPropertyFromClass('objects.Note', 'swagWidth') +20)
		setProperty(rating..'.acceleration.y', 550)
		setProperty(rating..'.velocity.y', getProperty(rating..'.velocity.y') - getRandomInt(140, 175))
		setProperty(rating..'.visible', not hideHud)
		setObjectCamera(rating, 'camHUD')
		setGraphicSize(rating, getProperty(rating..'.width') * 0.35)
		addLuaSprite(rating)
		runTimer(rating, crochet * 0.001)
		miau = miau + 1
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag:find('rating') then
		doTweenAlpha(tag, tag, 0, 0.2)
	end
end

function onTweenCompleted(tag)
	if tag:find('rating') then
		removeLuaSprite(tag)
	end
end