function onUpdate(elapsed)
    local middleStart = screenWidth / 2 - (112 * 2) -- 4 notas, cada una 112px separada

    if leftSide then
        for i = 0, 3 do
            setPropertyFromGroup('opponentStrums', i, 'x', middleStart + (112 * i))
            setPropertyFromGroup('playerStrums', i, 'visible', false)
        end
    else
        for i = 0, 3 do
            setPropertyFromGroup('playerStrums', i, 'x', middleStart + (112 * i))
            setPropertyFromGroup('opponentStrums', i, 'visible', false)
        end
    end
end


function onUpdatePost()
    for i = 0, getProperty('notes.length') - 1 do
        local mustPress = getPropertyFromGroup('notes', i, 'mustPress')
        if leftSide then
            -- Estamos usando las notas del oponente (que ahora están centradas)
            if mustPress then
                -- Ocultar notas del jugador
                setPropertyFromGroup('notes', i, 'visible', false)
            end
        else
            -- Estamos usando las notas del jugador (centradas)
            if not mustPress then
                -- Ocultar notas del oponente
                setPropertyFromGroup('notes', i, 'visible', false)
            end
        end
    end
end