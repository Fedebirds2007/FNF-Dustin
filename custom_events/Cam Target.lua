function onCreate()
	setVar('gfcamx', 0)
	setVar('gfcamy', 0)
end
function onEvent(name, value1, value2)
	if name == 'Cam Target' then
		if value1 == 'bf' then
			cameraSetTarget('boyfriend');
			setProperty('isCameraOnForcedPos', true);
		elseif value1 == 'dad' then
			cameraSetTarget('dad');
			setProperty('isCameraOnForcedPos', true);
		elseif value1 == 'gf' then
			gfconiox = getVar('gfcamx')
			gfconioy = getVar('gfcamy')
            triggerEvent('Camera Follow Pos', gfconiox, gfconioy);
			setProperty('isCameraOnForcedPos', true);
		elseif value1 == "OFF" or value1 == nil then
			setProperty('isCameraOnForcedPos', false);
			triggerEvent('Camera Follow Pos', nil, nil)
		end
	end
end