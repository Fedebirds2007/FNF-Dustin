// Odio cada linea de este codigo - Fedebirds2007
import flixel.addons.effects.FlxTrail;
import openfl.Lib;
import flixel.text.FlxText;
import flixel.FlxSprite;

var bgCam;
var water;
var tape_noise:CustomShader;
var warp:CustomShader;
var warp2:CustomShader;

var heartParticles:Array<FlxSprite> = [];
var heartParticleTimer:Float = 0;

var dadFloatTime:Float = 0;
var currentFloatSpeed:Float = 3; 
var currentFloatRadius:Float = 200; 

var dadBaseX:Float = 0;
var dadBaseY:Float = 0;
var dadFloatPhase:Float = 0;
var dadFloating:Bool = false;

var particlesActive:Bool = false;

var theEndText:FlxText;
var customUI:Array<FlxSprite>;

var dadClone:Character = null;
var bfClone:Character = null;

var dadPos:Float = 670;
var heart:FlxSprite;


/*function onStartCountdown(countdown){ 
    countdown.cancel();
    startSong();
}*/
function onCreate(){
    heart = new FlxSprite();
    heart.loadGraphic(Paths.image("stages/youare/heart"));
    heart.x = 750;
    heart.y = 2170;
    heart.alpha = 0;
    heart.scale.set(0.08, 0.08);
    insert(members.indexOf(getLuaObject('pixel_bg')), heart);
    add(heart);
}
function onCreatePost() {

    theEndText = new FlxText(0, 0, FlxG.width, "THE END");
    theEndText.setFormat(null, 200, 0xFFFF0000, "center");
    theEndText.screenCenter();
    theEndText.x = -1100;
    theEndText.y = 750;
    theEndText.cameras = [camGame]; 
    add(theEndText);
    theEndText.visible = false;
    //door.camera = bgCam;
}
var iTime:Float = 0;
var tottalTimer:Float = FlxG.random.float(100, 1000);
var heartBaseY:Float = 2170;
var heartFloatTime:Float = 0;
function onStepHit() {
        if (curStep == 1033) {
            clearTrails();
            spawnPapsTrail(dad);

            dadBaseX = dad.x;
            dadBaseY = dad.y;
            dadFloating = true;
            dadFloatTime = 0; 
            currentFloatSpeed = 2; 
            currentFloatRadius = 300;
        } 

        if (curStep == 1311) {
            clearTrails();
            dadFloating = false;
            dad.x = dadBaseX;
            dad.y = dadBaseY;
            particlesActive = true;
        }
        // STYLE CHANGES
        
        if (curStep == 1600){
            particlesActive = false;
        }
        if (curStep == 2096){
            theEndText.visible = true;
        }
        // SANS PART

        if (curStep == 2764){
            heart.alpha = 1;
            heartBaseY = heart.y;
            spawnPapsTrail(heart);
            theEndText.visible = false;
        }
}
function onUpdate(elapsed:Float) {
    
    if (heart != null && heart.alpha != 0) {
        heartFloatTime += elapsed * 1.3; 
        heart.y = heartBaseY + Math.sin(heartFloatTime) * 150;
    }
    if (dadFloating) {
        dadFloatPhase += elapsed * currentFloatSpeed;

        var dadFloatX = Math.sin(dadFloatPhase) * currentFloatRadius;
        var dadFloatY = Math.sin(dadFloatPhase * 2) * (currentFloatRadius / 2);

        dad.x = dadBaseX + dadFloatX;
        dad.y = dadBaseY + dadFloatY;
    }

    if (particlesActive == true) {
        heartParticleTimer += elapsed;
        if (heartParticleTimer > 0.3) { // rate
            heartParticleTimer = 0;

            var particle = new FlxSprite();
            particle.loadGraphic(Paths.image("game/monster_heart"));

            // POS
            var spawnRangeX = 3500;
            particle.x = -1060 + 2140.2 / 2 + FlxG.random.float(-spawnRangeX, spawnRangeX);
            particle.y = (70 + 1800) + FlxG.random.float(-5, 5);

            // SIZE
            var scale = FlxG.random.float(0.085, 0.125);
            particle.setGraphicSize(Std.int(particle.width * scale));
            particle.updateHitbox();

            particle.alpha = 0;
            particle.velocity.y = -FlxG.random.float(100, 120);

            particle.camera = camGame;
            insert(members.indexOf(getLuaObject('tv_player')), particle);

            heartParticles.push(particle);
        }

        for (particle in heartParticles) {
            particle.y += particle.velocity.y * elapsed;

            if (particle.alpha < 0.5 && particle.y > 70 - 1000) {
                particle.alpha += elapsed * 5;
            } else {
                particle.alpha -= elapsed * 0.5;
            }

            if (particle.alpha <= 0) {
                remove(particle);
                heartParticles.remove(particle);
                particle.destroy();
                particle = null;
            }
        }
    }
}

var papsTrails:Array<FlxTrail> = [];

function spawnPapsTrail(sprite:FlxSprite) {
    var trail = new FlxTrail(sprite, null, 32, 11, 0.3, 0.045);
    trail.color = 0xFFC49F9F;
    insert(members.indexOf(sprite), trail);
    papsTrails.push(trail);
    return trail;
}

function clearTrails() {
    for (trail in papsTrails) {
        remove(trail);
        trail.destroy();
    }
    papsTrails = [];
}

function clearHeartParticles() {
    for (p in heartParticles) {
        remove(p);
        p.destroy();
    }
    heartParticles = [];
}
