perezapath = "stages/waterfall/"
function onCreate()
	-- background sht
	makeLuaSprite('bg', perezapath..'rest_of_the_bg_2', -756, -157);
	setScrollFactor('bg', 0.7, 0.9);
	addLuaSprite('bg', true);

	makeLuaSprite('bg_front', perezapath..'rest_of_the_bg_1', -790, -304);
	setScrollFactor('bg_front', 0.8, 0.95);
	addLuaSprite('bg_front', true);

	makeLuaSprite('wall_left', perezapath..'walls_part_1', -950, -16);
	setScrollFactor('wall_left', 0.9, 0.98);
	addLuaSprite('wall_left', true);

	makeLuaSprite('wall_right', perezapath..'walls_part_2', 1252, -16);
	setScrollFactor('wall_right', 0.9, 0.98);
	addLuaSprite('wall_right', true);

	makeLuaSprite('bridge', perezapath..'Bridge_part', -995.423824386614, 702.066823925886); -- Era necesario ser tan especifico? ._.
	addLuaSprite('bridge', true);

	makeLuaSprite('cracks', perezapath..'cracks', 250, 910);
	setScrollFactor('cracks', 1, 1);
	addLuaSprite('cracks', true);

	makeLuaSprite('bones', perezapath..'BlueBones', 210, 440);
	setScrollFactor('bones', 1, 1);
	addLuaSprite('bones', true);

	makeLuaSprite('shards', perezapath..'glow_shards_purple', -1050, -52);
	setScrollFactor('shards', 1, 1);
	addLuaSprite('shards', true);

	-- Effects sht
	makeLuaSprite('blackOverlay', '', 0, 0);
    makeGraphic('blackOverlay', 3000, 3000, '000000');
    setScrollFactor('blackOverlay', 1, 1);
	setObjectCamera('blackOverlay', 'other')
    screenCenter('blackOverlay');
	setProperty('blackOverlay.alpha', 0);
    addLuaSprite('blackOverlay', true);
	-- Undyne Impact Frames --

	makeLuaSprite('BLASTER_IMPACT1', perezapath..'undyneimpact1', 230, 250);
	setScrollFactor('BLASTER_IMPACT1', 1, 1.2);
	scaleObject('BLASTER_IMPACT1', 1.7, 2);
	setProperty('BLASTER_IMPACT1.alpha', 0)
	setProperty('BLASTER_IMPACT1.antialiasing', true)
	setObjectCamera('BLASTER_IMPACT1', 'other')
	screenCenter('BLASTER_IMPACT1')
	addLuaSprite('BLASTER_IMPACT1', true);

	makeLuaSprite('BLASTER_IMPACT2', perezapath..'undyneimpact2', 200, 230);
	setScrollFactor('BLASTER_IMPACT2', 1, 1.2);
	scaleObject('BLASTER_IMPACT2', 1.7, 2);
	setProperty('BLASTER_IMPACT2.alpha', 0)
	setProperty('BLASTER_IMPACT2.antialiasing', true)
	setObjectCamera('BLASTER_IMPACT2', 'other')
	screenCenter('BLASTER_IMPACT2')
	addLuaSprite('BLASTER_IMPACT2', true);

	makeLuaSprite('BLASTER_IMPACT3', perezapath..'undyneimpact3', 200, 230);
	setScrollFactor('BLASTER_IMPACT3', 1, 1.2);
	scaleObject('BLASTER_IMPACT3', 1.7, 2);
	setProperty('BLASTER_IMPACT3.alpha', 0)
	setProperty('BLASTER_IMPACT3.antialiasing', true)
	setObjectCamera('BLASTER_IMPACT3', 'other')
	screenCenter('BLASTER_IMPACT3')
	addLuaSprite('BLASTER_IMPACT3', true);

	-- Blaster Impact Frames --

	makeLuaSprite('BLASTER_IMPACT4', perezapath..'impact1', 220, 250);
	setScrollFactor('BLASTER_IMPACT4', 1, 1.2);
	scaleObject('BLASTER_IMPACT4', 1.4, 1.9);
	setProperty('BLASTER_IMPACT4.alpha', 0)
	setProperty('BLASTER_IMPACT4.antialiasing', true)
	setObjectCamera('BLASTER_IMPACT4', 'other')
	screenCenter('BLASTER_IMPACT4')
	addLuaSprite('BLASTER_IMPACT4', true);

	makeLuaSprite('BLASTER_IMPACT5', perezapath..'impact2', 220, 250);
	setScrollFactor('BLASTER_IMPACT5', 1, 1.2);
	scaleObject('BLASTER_IMPACT5', 1.4, 1.9);
	setProperty('BLASTER_IMPACT5.alpha', 0)
	setProperty('BLASTER_IMPACT5.antialiasing', true)
	setObjectCamera('BLASTER_IMPACT5', 'other')
	screenCenter('BLASTER_IMPACT5')
	addLuaSprite('BLASTER_IMPACT5', true);

	makeLuaSprite('BLASTER_IMPACT6', perezapath..'impact3', 220, 250);
	setScrollFactor('BLASTER_IMPACT6', 1, 1.2);
	scaleObject('BLASTER_IMPACT6', 1.4, 1.9);
	setProperty('BLASTER_IMPACT6.alpha', 0)
	setProperty('BLASTER_IMPACT6.antialiasing', true)
	setObjectCamera('BLASTER_IMPACT6', 'other')
	screenCenter('BLASTER_IMPACT6')
	addLuaSprite('BLASTER_IMPACT6', true);
	
end

function onCreatePost()

	setObjectOrder('gfGroup', getObjectOrder('bones')-1)
	setObjectOrder('dadGroup', getObjectOrder('bones')+1)
	setObjectOrder('boyfriendGroup', getObjectOrder('bones')+2)
	setObjectOrder('shards', getObjectOrder('boyfriendGroup')+1)

	setObjectOrder('blackOverlay', getObjectOrder('uiGroup')+1)
	setObjectOrder('BLASTER_IMPACT1', getObjectOrder('uiGroup')+2)
	setObjectOrder('BLASTER_IMPACT2', getObjectOrder('uiGroup')+3)
	setObjectOrder('BLASTER_IMPACT3', getObjectOrder('uiGroup')+4)
	setObjectOrder('BLASTER_IMPACT4', getObjectOrder('uiGroup')+5)
	setObjectOrder('BLASTER_IMPACT5', getObjectOrder('uiGroup')+6)
	setObjectOrder('BLASTER_IMPACT6', getObjectOrder('uiGroup')+7)

end