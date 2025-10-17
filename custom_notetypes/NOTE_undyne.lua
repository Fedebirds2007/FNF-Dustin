function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'NOTE_undyne' then
            setPropertyFromGroup('unspawnNotes',i,'ignoreNote',true)
            setPropertyFromGroup('unspawnNotes', i, 'multAlpha', 0)
            setProperty('unspawnNotes['..i..'].blockHit', true)
        end
    end
end

function onUpdatePost()
    for notes = 0,getProperty('notes.length')-1 do
        if getPropertyFromGroup('notes',notes,'noteType') == 'NOTE_undyne' then
            noteDir = getPropertyFromGroup('notes',notes,'noteData')
            noteDistance = getPropertyFromGroup('notes',notes,'distance')
            noteType = getPropertyFromGroup('notes',notes,'noteType')
            noteSus = getPropertyFromGroup('notes',notes,'isSustainNote')
            if not noteSus and noteDistance > -30 and noteDistance < 10 or noteSus and noteDistance > -30 and noteDistance < 20 then
                anim = getProperty('singAnimations['..noteDir..']')
                playAnim('gf',anim,true)
            end
        end
    end
end