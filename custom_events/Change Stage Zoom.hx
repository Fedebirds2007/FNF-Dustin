// I Hate how tf they made this values - Fedebirds2007
var defaultZoomTween:FlxTween;

function valuesplit(input:String, sep:String):Array<String> {
    if (sep == null) sep = " ";
    return input.split(sep);
}

function onEvent(name, v1, v2) {
    var params:Array<String> = valuesplit(v1 + "," + v2, ",");
    if (name == "Change Stage Zoom") { 
        if (params[4] == "true") {
            var flxease:String = params[7] + (params[7] == "linear" ? "" : params[8]);

            if (params[0] == "true") {
                if (defaultZoomTween != null) defaultZoomTween.cancel();
                defaultZoomTween = FlxTween.num(game.defaultCamZoom, Std.parseFloat(params[5]), ((Conductor.crochet / 4) / 1000) * Std.parseFloat(params[6]), 
                {ease: Reflect.field(FlxEase, flxease)}, (val:Float) -> {game.defaultCamZoom = val;});
            }
            // NULL OBJECT REFERENCE, ok ya no lo da, pero no hace ni verga :v, tendré que pasarlo a camTarget
            function onMoveCamera(focus) {
                if (params[1] == "true") {
                    if (focus == 'boyfriend'){
                        if (defaultZoomTween != null) defaultZoomTween.cancel();
                        defaultZoomTween = FlxTween.num(game.defaultCamZoom, Std.parseFloat(params[5]), ((Conductor.crochet / 4) / 1000) * Std.parseFloat(params[6]), 
                        {ease: Reflect.field(FlxEase, flxease)}, (val:Float) -> {game.defaultCamZoom = val;});
                    }
                }
                if (params[2] == "true") {
                    if (focus == 'dad'){
                        if (defaultZoomTween != null) defaultZoomTween.cancel();
                        defaultZoomTween = FlxTween.num(game.defaultCamZoom, Std.parseFloat(params[5]), ((Conductor.crochet / 4) / 1000) * Std.parseFloat(params[6]), 
                        {ease: Reflect.field(FlxEase, flxease)}, (val:Float) -> {game.defaultCamZoom = val;});
                    }
                }
                if (params[3] == "true") {
                    if (focus == 'gf'){
                        if (defaultZoomTween != null) defaultZoomTween.cancel();
                        defaultZoomTween = FlxTween.num(game.defaultCamZoom, Std.parseFloat(params[5]), ((Conductor.crochet / 4) / 1000) * Std.parseFloat(params[6]), 
                        {ease: Reflect.field(FlxEase, flxease)}, (val:Float) -> {game.defaultCamZoom = val;});
                    }
                }
            }
            
        } else {
            if (params[0] == "true") game.defaultCamZoom = Std.parseFloat(params[5]);
            if (params[1] == "true") game.defaultCamZoom = Std.parseFloat(params[5]);
            if (params[2] == "true") game.defaultCamZoom = Std.parseFloat(params[5]);
            if (params[3] == "true") game.defaultCamZoom = Std.parseFloat(params[5]);
        }
    }
}

