function onEvent(name:String, v1:String, v2:String):Void {
    if (name == "Camera Speed") {
        var speed:Float = Std.parseFloat(v1);
        if (speed != null) {
            camGame.followLerp = speed*10;
        }
    }
}
