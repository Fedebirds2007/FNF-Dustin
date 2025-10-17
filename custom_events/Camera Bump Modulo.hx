import flixel.FlxG;

var bumpInterval:Int = 4;
var bumpStrength:Float = 0.05;
var beatCounter:Int = 0;

function valuesplit(input:String, sep:String):Array<String> {
    if (sep == null) sep = " ";
    return input.split(sep);
}

function onEvent(name:String, v1:String, v2:String):Void {
    if (name == "Camera Bump Modulo") {
        var params:Array<String> = valuesplit(v1 + "," + v2, ",");
        if (params.length >= 2) {
            var interval:Int = Std.parseInt(params[0]);
            var strength:Float = Std.parseFloat(params[1]);
            if (!Math.isNaN(interval) && !Math.isNaN(strength) && interval > 0) {
                bumpInterval = interval;
                bumpStrength = strength;
                beatCounter = 0;
            }
        }
    }
}

function onBeatHit():Void {
    beatCounter++;
    if (bumpInterval > 0 && (beatCounter % bumpInterval) == 0) {
        // Apply camera zoom bump
        FlxG.camera.zoom += (bumpStrength / 70 );
        if (game != null && game.camHUD != null) {
            game.camHUD.zoom += (bumpStrength / 70 );
        }
    }
}
