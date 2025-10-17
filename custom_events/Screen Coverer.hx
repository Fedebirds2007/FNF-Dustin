import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxColor;

var screenCoverer:FlxSprite;

function onCreate() {
    screenCoverer = new FlxSprite();
    screenCoverer.makeGraphic(FlxG.width, FlxG.height, 0xFF000000);
    screenCoverer.scrollFactor.set(0, 0);
    screenCoverer.alpha = 0;
    screenCoverer.color = 0xFFFFFF; // default white, will be changed on event
}

var alphaTween:FlxTween = null;

function onEvent(name:String, v1:String, v2:String) {
    if (name != "Screen Coverer") return;

    // Combine parameters and split by comma
    var params:Array<String> = (v1 + "," + v2).split(",");

    // Validate minimum expected parameters count (at least 8)
    if (params.length < 8) {
        trace("Screen Coverer event: insufficient parameters");
        return;
    }

    // Remove the sprite first to re-insert it in correct layer
    remove(screenCoverer);

    // Determine layer insertion index
    var layer:String = params[7];
    var insertIndex:Int = (layer == "front") ? members.length - 1 : 0;
    insert(insertIndex, screenCoverer);

    // Determine camera
    var camName:String = params[6];
    if (camName == "camGame")
        screenCoverer.cameras = [camGame];
    else if (camName == "camHUD")
        screenCoverer.cameras = [camHUD];
    else
        screenCoverer.cameras = [camGame]; // default fallback

    // Parse parameters
    // params[0]: tween flag ("true" or "false")
    // params[1]: color (int as string)
    // params[2]: alpha (float as string)
    // params[3]: time (float as string, in beats)
    // params[4]: ease type (string)
    // params[5]: ease direction (string)
    // params[6]: camera (handled above)
    // params[7]: layer (handled above)

    var tweenFlag:Bool = params[0].toLowerCase() == "true";
    var colorInt:Int = Std.parseInt(params[1]);
    var alphaTarget:Float = Std.parseFloat(params[2]);
    var timeBeats:Float = Std.parseFloat(params[3]);
    var easeType:String = params[4];
    var easeDirection:String = params[5];

    // Set color and alpha immediately if no tween
    screenCoverer.color = colorInt;
    if (!tweenFlag) {
        if (alphaTween != null) {
            alphaTween.cancel();
            alphaTween = null;
        }
        screenCoverer.alpha = alphaTarget;
    } else {
        // Tween alpha
        if (alphaTween != null) {
            alphaTween.cancel();
            alphaTween = null;
        }

        // Compose ease function name
        var easeName:String = easeType;
        if (easeType != "linear") {
            easeName += easeDirection;
        }

        // Get ease function from FlxEase, fallback to linear if not found
        var easeFunc = Reflect.field(FlxEase, easeName);
        if (easeFunc == null) {
            easeFunc = FlxEase.linear;
        }

        // Calculate time in seconds (crochet is in ms per beat)
        var timeSeconds:Float = ((Conductor.crochet / 4) / 1000) * timeBeats;

        alphaTween = FlxTween.tween(screenCoverer, {alpha: alphaTarget}, timeSeconds, {ease: easeFunc});
    }
}
