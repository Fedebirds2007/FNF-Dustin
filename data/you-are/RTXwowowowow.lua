
function onCreatePost()
    showBF = false
    showDAD = false
    BFAlpha = 0.35
    DADAlpha = 0.35
end


function onUpdatePost()
    if showBF == true then
    bfframe = getProperty('boyfriend.animation.frameName')
    addAnimationByPrefix('bfPhantom','b',bfframe,1,true)
    playAnim("bfPhantom","b",true)
    bfoffsetX = getProperty('boyfriend.offset.x')
    bfoffsetY = getProperty('boyfriend.offset.y')
    setProperty('bfPhantom.offset.x',bfoffsetX)
    setProperty('bfPhantom.offset.y',getProperty('boyfriend.frameHeight')*getProperty('boyfriend.scale.y')-bfoffsetY)
    else 
        return
    end

-----------------------------boyfriend playanim---------------
    if showDAD == true then
    dadframe = getProperty('dad.animation.frameName')
    addAnimationByPrefix('dadPhantom','d',dadframe,1,true)
    playAnim("dadPhantom","d",true)
    dadoffsetX = getProperty('dad.offset.x')
    dadoffsetY = getProperty('dad.offset.y')
    setProperty('dadPhantom.offset.x',dadoffsetX)
    setProperty('dadPhantom.offset.y',getProperty('dad.frameHeight')*getProperty('dad.scale.y')-dadoffsetY)
    else
        return
    end
end

function createcharBF()
        bfimage = getProperty('boyfriend.imageFile')
        bfframe = getProperty('boyfriend.animation.frameName')
        bfx = getProperty('boyfriend.x')

        bfscaleX = getProperty('boyfriend.scale.x')
        bfscaleY = getProperty('boyfriend.scale.y')
        bfoffsetX = getProperty('boyfriend.offset.x')
        bfoffsetY = getProperty('boyfriend.offset.y')
        bfflipX = getProperty('boyfriend.flipX')
        
        
        makeAnimatedLuaSprite('bfPhantom',bfimage,bfx,0)
        setObjectOrder('bfPhantom',getObjectOrder('boyfriendGroup')-1)
        addLuaSprite('bfPhantom',false)
        setProperty('bfPhantom.offset.x',bfoffsetX)
        setProperty('bfPhantom.offset.y',bfoffsetY)
        setProperty('bfPhantom.scale.x',bfscaleX)
        setProperty('bfPhantom.scale.y',bfscaleY)
        setProperty('bfPhantom.alpha',BFAlpha)
        setProperty('bfPhantom.flipX', bfflipX)
        setProperty('bfPhantom.flipY', true)
        setProperty('bfPhantom.y',getProperty('boyfriend.y') + getProperty('boyfriend.frameHeight')*getProperty('boyfriend.scale.y') * 2)
end
function createcharDAD()
        dadimage = getProperty('dad.imageFile')
        dadframe = getProperty('dad.animation.frameName')
        dadx = getProperty('dad.x')

        dadscaleX = getProperty('dad.scale.x')
        dadscaleY = getProperty('dad.scale.y')
        dadoffsetX = getProperty('dad.offset.x')
        dadoffsetY = getProperty('dad.offset.y')
        dadflipX = getProperty('dad.flipX')

        makeAnimatedLuaSprite('dadPhantom',dadimage,dadx,0)
        setObjectOrder('dadPhantom',getObjectOrder('dadGroup')-1)
        addLuaSprite('dadPhantom',false)
        setProperty('dadPhantom.offset.x',dadoffsetX)
        setProperty('dadPhantom.offset.y',dadoffsetY)
        setProperty('dadPhantom.scale.x',dadscaleX)
        setProperty('dadPhantom.scale.y',dadscaleY)
        setProperty('dadPhantom.alpha',DADAlpha)
        setProperty('dadPhantom.flipY', true);
        setProperty('dadPhantom.flipX', dadflipX)
        setProperty('dadPhantom.y',getProperty('dad.y') + getProperty('dad.frameHeight') * getProperty('dad.scale.y') * 2)
end

function onStepHit()
    if curStep == 2740 then
        showBF = true
        showDAD = true
        createcharBF()
        createcharDAD()
    end
end

