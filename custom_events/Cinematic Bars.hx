var cinematicBarTween1:FlxTween = null;
var cinematicBarTween2:FlxTween = null;

var cinematicBar1:FlxSprite = null;
var cinematicBar2:FlxSprite = null;

function valuesplit(input:String, sep:String):Array<String> {
    if (sep == null) sep = " ";
    return input.split(sep);
}

function onCreate() {
    // Create top bar - starts with full height, positioned at top
    cinematicBar1 = new FlxSprite(0, 0).makeGraphic(FlxG.width, Math.floor(FlxG.height / 2), 0xFF000000);
    cinematicBar1.scrollFactor.set(0, 0);
    cinematicBar1.cameras = [camHUD];
    cinematicBar1.scale.y = 0;
    cinematicBar1.origin.y = 0; // Scale from top
    cinematicBar1.updateHitbox();
    // Removed add(cinematicBar1);

    // Create bottom bar - starts with full height, positioned at bottom
    cinematicBar2 = new FlxSprite(0, FlxG.height).makeGraphic(FlxG.width, Math.floor(FlxG.height / 2), 0xFF000000);
    cinematicBar2.scrollFactor.set(0, 0);
    cinematicBar2.cameras = [camHUD];
    cinematicBar2.scale.y = 0;
    cinematicBar2.origin.y = cinematicBar2.height; // Scale from bottom
    cinematicBar2.y = FlxG.height - cinematicBar2.height;
    cinematicBar2.updateHitbox();
    // Removed add(cinematicBar2);
}

function onEvent(name, v1, v2) {
    if (name == "Cinematic Bars") {
        var params:Array<String> = valuesplit(v1 + "," + v2, ",");
        // params[0]: tween? (true/false)
        // params[1]: bar height (0.0-1.0, percentage of screen)
        // params[2]: tween time (steps)
        // params[3]: ease type
        // params[4]: ease direction
        // params[5]: camera

        var shouldTween:Bool = (params[0] == "true");
        var barHeight:Float = Std.parseFloat(params[1]);
        var tweenTime:Float = Std.parseFloat(params[2]);
        var easeType:String = params[3];
        var easeDirection:String = params[4];
        var cameraName:String = params[5];

        // Always use camHUD but control layering
        var targetCamera = camHUD;
        
        for (bar in [cinematicBar1, cinematicBar2]) {
            bar.cameras = [targetCamera];
            
            // Control layering based on camera parameter
            if (cameraName == "camGame") {
                // Insert at beginning (behind UI)
                insert(0, bar);
            } else {
                // Add at end (in front of UI)
                add(bar);
            }
        }

        // Calculate target scale (barHeight is percentage of screen height for each bar)
        var targetScale:Float = barHeight;

        if (!shouldTween) {
            // Instant change
            cinematicBar1.scale.y = targetScale;
            cinematicBar1.updateHitbox();
            
            cinematicBar2.scale.y = targetScale;
            cinematicBar2.y = FlxG.height - cinematicBar2.height;
            cinematicBar2.updateHitbox();
        } else {
            // Cancel existing tweens
            if (cinematicBarTween1 != null) cinematicBarTween1.cancel();
            if (cinematicBarTween2 != null) cinematicBarTween2.cancel();

            // Create ease string
            var flxease:String = easeType + (easeType == "linear" ? "" : easeDirection);
            var tweenDuration:Float = ((Conductor.crochet / 4) / 1000) * tweenTime;

            // Tween top bar
            cinematicBarTween1 = FlxTween.tween(cinematicBar1.scale, {y: targetScale}, tweenDuration, {
                ease: Reflect.field(FlxEase, flxease),
                onUpdate: function(tween:FlxTween) {
                    cinematicBar1.updateHitbox();
                }
            });

            // Tween bottom bar
            cinematicBarTween2 = FlxTween.tween(cinematicBar2.scale, {y: targetScale}, tweenDuration, {
                ease: Reflect.field(FlxEase, flxease),
                onUpdate: function(tween:FlxTween) {
                    cinematicBar2.updateHitbox();
                    cinematicBar2.y = FlxG.height - cinematicBar2.height;
                }
            });
        }
    }
}
