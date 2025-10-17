
songtexture = "game/notes/default"
function onCreatePost()
    NoteSkins()
end
------------------------------------------------------ TODA LA MIERDA DE LAS NOTESKINS (EVENTO SOLO SON LAS STRUMS, EL CAMBIO DE NOTESKIN POR PERSONAJE ESTA EN UN LUA EN DATA, POR TEMA DE OPTIMIZACIÓN) ---------------------------------------------------------------------

function NoteSkins()
    if getVar("Strum_and_NoteSkin") == true then
        for i = 0, getProperty('unspawnNotes.length')-1 do
            if getPropertyFromGroup('unspawnNotes', i, 'strumTime') > 0 and getPropertyFromGroup('unspawnNotes', i, 'strumTime') < 999999 then --- Se que se puede optimizar, de momento estoy haciendo que funcione nomas :p
                setPropertyFromGroup('unspawnNotes', i, 'texture', songtexture)
   		        setPropertyFromGroup('unspawnNotes', i, 'rgbShader.enabled', false)
                setPropertyFromGroup('unspawnNotes', i, 'noteSplashData.a', 0)
            end
        end
		for i = 0,3 do
	        setPropertyFromGroup('opponentStrums', i, 'texture', songtexture)
	        setPropertyFromGroup('opponentStrums', i, 'rgbShader.enabled', false)
            setPropertyFromGroup('playerStrums', i, 'texture', songtexture)
	        setPropertyFromGroup('playerStrums', i, 'rgbShader.enabled', false)
 	    end
    end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------