import flixel.FlxG;
import flixel.FlxCamera;
import PlayState;
import Std;

function onEvent(name:String, v1:String, v2:String):Void {
    if (name == "Camera Flash") {
        // Split parameters
        var params:Array<String> = (v1 + "," + v2).split(",");
        // params[0]: reversed (string "true"/"false")
        // params[1]: color (string int)
        // params[2]: duration (string number)
        // params[3]: camera name ("camGame" or "camHUD")

        var reversed:Bool = (params[0] == "true");
        var color:Int = Std.parseInt(params[1]);
        var duration:Float = Std.parseFloat(params[2]);
        var cameraName:String = params[3];

        // Get the camera reference
        var camera:FlxCamera = null;
        if (cameraName == "camGame") {
            camera = FlxG.camera;
        } else if (cameraName == "camHUD") {
            camera = PlayState.instance.camHUD;
        } else {
            // fallback or unknown camera name
            camera = FlxG.camera;
        }

        var flashDuration:Float = ((Conductor.crochet / 4) / 1000) * duration;

        if (reversed) {
            camera.fade(color, flashDuration, false, () -> {
                camera._fxFadeAlpha = 0;
            }, true);
        } else {
            camera.flash(color, flashDuration, null, true);
        }
    }
}
