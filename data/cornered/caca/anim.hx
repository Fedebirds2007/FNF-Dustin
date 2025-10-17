// Script by JOSE JUAN

var startPos:Array<Float> = [];
var waveApplied:Bool = false;
var waveTime:Float = 0;
var waveStrength:Float = 0;
var waveSpeed:Float = 2.0;

function onCreatePost() {
    for (strum in [playerStrums, opponentStrums]) startPos.push(strum.members[0].y);
}

function onStepHit(curStep:Int) {
    if (curStep == 761) {
        waveApplied = true;
        waveSpeed = 2.0;
    } else if (curStep == 889) {
        waveSpeed = 6.0;
    } else if (curStep == 1107) {
        waveApplied = false;
    }
}

function onUpdate(elapsed:Float) {
    waveTime += elapsed;

    var fadeSpeed = 2.5;
    if (waveApplied) {
        waveStrength = Math.min(1, waveStrength + elapsed * fadeSpeed);
    } else {
        waveStrength = Math.max(0, waveStrength - elapsed * fadeSpeed);
    }

    for (a in 0...strums.length) {
        for (b in 0...strums.members[a].length) {
            var note = strums.members[a].members[b];
            var baseY = startPos[a];
            var offset = Math.sin(waveTime * waveSpeed + b) * 20 * waveStrength;
            note.y = baseY + offset;
        }
    }
}

