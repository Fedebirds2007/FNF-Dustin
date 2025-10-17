perezapath = "stages/youare/"
function onCreate()
	-- background sht
	makeLuaSprite('bg_player', perezapath..'bg_player', -2700, -1100);
	setScrollFactor('bg_player', 1, 0.8);
	setProperty('bg_player.antialiasing', true)
	scaleObject('bg_player', 1.45, 1.45)
	addLuaSprite('bg_player', true);

	makeLuaSprite('tv_player', perezapath..'tv_player', -1400, -1250);
	setScrollFactor('tv_player', 1, 0.6);
	scaleObject('tv_player', 1.45, 1.45)
	setProperty('tv_player.antialiasing', true)
	addLuaSprite('tv_player', true);

	makeLuaSprite('ground_player', perezapath..'ground_player', -1060, 70);
	setScrollFactor('ground_player', 1, 1);
	scaleObject('ground_player', 1.45, 1.45)
	setProperty('ground_player.antialiasing', true)
	addLuaSprite('ground_player', true);

	makeLuaSprite('kinemorto', perezapath..'kinemorto', -2260, -1170);
	setScrollFactor('kinemorto', 1, 1);
	scaleObject('kinemorto', 2.45, 2.45)
	setProperty('kinemorto.antialiasing', true)
	setProperty('kinemorto.alpha', 0)
	addLuaSprite('kinemorto', true);

	makeLuaSprite('door', perezapath..'door', -2100, -570);
	setScrollFactor('door', 1, 1);
	setProperty('door.antialiasing', true)
	setProperty('door.alpha', 0)
	scaleObject('door', 2, 2)
	addLuaSprite('door', true);

	makeLuaSprite('flowers', perezapath..'flowers', -2100, -750);
	setScrollFactor('flowers', 1, 1);
	setProperty('flowers.antialiasing', true)
	setProperty('flowers.alpha', 0)
	scaleObject('flowers', 1.15, 1.15)
	addLuaSprite('flowers', true);

	makeLuaSprite('waterfall', perezapath..'waterfall', -2500, -600);
	setScrollFactor('waterfall', 1, 1);
	setProperty('waterfall.antialiasing', true)
	setProperty('waterfall.alpha', 0)
	scaleObject('waterfall', 1.15, 1.15)
	addLuaSprite('waterfall', true);

	makeAnimatedLuaSprite('HOTLANDFINALE', perezapath..'HOTLANDFINALE', -2500, -600)
	addAnimationByPrefix('HOTLANDFINALE', 'hotlandbg', 'hotlandbg', 24, true);
	setScrollFactor('HOTLANDFINALE', 1, 1);
	setProperty('HOTLANDFINALE.alpha', 0)
	scaleObject('HOTLANDFINALE', 1.15, 1.15)
	addLuaSprite('HOTLANDFINALE', true);

	makeLuaSprite('lab', perezapath..'lab', -2500, -600);
	setScrollFactor('lab', 1, 1);
	setProperty('lab.antialiasing', true)
	setProperty('lab.alpha', 0)
	scaleObject('lab', 1.15, 1.15)
	addLuaSprite('lab', true);

	makeLuaSprite('sans_bg', perezapath..'sans_bg', 0, -1500);
	setProperty('sans_bg.antialiasing', true)
	setProperty('sans_bg.alpha', 0)
	scaleObject('sans_bg', 1.45, 1.45)
	addLuaSprite('sans_bg', true);

	makeAnimatedLuaSprite('pixel_bg', perezapath..'pixel_bg', -1360, -570)
	addAnimationByPrefix('pixel_bg', 'anim', 'anim', 24, true);
	setProperty('pixel_bg.alpha', 0)
	scaleObject('pixel_bg', 1.05, 1.05)
	addLuaSprite('pixel_bg', true);

	makeAnimatedLuaSprite('YOUAREtitlecard', perezapath..'YOUAREtitlecard', -900, -200)
	addAnimationByPrefix('YOUAREtitlecard', 'introtitle', 'introtitle', 24, false);
	scaleObject('YOUAREtitlecard', 1, 1)
	addLuaSprite('YOUAREtitlecard', true);

	makeLuaSprite('light_player', perezapath..'light_player', -2400, -1100);
	setScrollFactor('light_player', 1, 1.2);
	scaleObject('light_player', 1.45, 1.45)
	setProperty('light_player.antialiasing', true)
	addLuaSprite('light_player', true);

	makeLuaSprite('sans_fg', perezapath..'sans_fg', 470, -600);
	setScrollFactor('sans_fg', 2, 1);
	setProperty('sans_fg.alpha', 0)
	scaleObject('sans_fg', 1.45, 2)
	addLuaSprite('sans_fg', true);

	makeLuaSprite('blackOverlay', '', 0, 0);
    makeGraphic('blackOverlay', 3000, 3000, '000000');
    setScrollFactor('blackOverlay', 1, 1);
	setObjectCamera('blackOverlay', 'other')
    screenCenter('blackOverlay');
	setProperty('blackOverlay.alpha', 1);
    addLuaSprite('blackOverlay', true);
	
end

function onCreatePost()
	setObjectOrder('dadGroup', getObjectOrder('pixel_bg'))
	setObjectOrder('boyfriendGroup', getObjectOrder('pixel_bg')+1)
end