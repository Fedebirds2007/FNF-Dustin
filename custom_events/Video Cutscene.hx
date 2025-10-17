/*By Galactic Please give me creds if you use this pookies
My YT: https://www.youtube.com/channel/UCt8JaabVQeOTLA2iY8Z3bMA
My Twitter: https://x.com/ApocalypseFNF
Thanks for downloading I really appreciate it!
(Made specificly for psych 7.3)*/

import hxcodec.flixel.FlxVideo;
import flixel.FlxG;



//Setings 
var pauseBGImage:String = ""; //set to nothing for it to use a solid color
var pauseBGImgScale:Float = 1; //Scales up and down the pause bg image ONLY matters if your using an image the color fill auto sizes it
var pauseBGColor = FlxColor.BLACK; //color of the pause background IF you aren't using a image background



//boring code

var video:FlxVideo;
var pauseBG:FlxSprite;
var vidPlaying:Bool = false;

function onEventPushed(event:String) //pre cache so no lag 
{
    if(event == "Video Cutscene"){
        pauseBG = new FlxSprite().loadGraphic(Paths.image(pauseBGImage));
        if(pauseBGImage == "") pauseBG.makeGraphic(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), pauseBGColor);
        pauseBG.visible = false;
        pauseBG.scrollFactor.set();
        pauseBG.setGraphicSize(Std.int(pauseBG.width * 1.25));
        pauseBG.screenCenter();
        add(pauseBG);

        video = new FlxVideo();
        //video.volume = volume; it did NOT work brah
        video.onEndReached.add(function(){
            vidPlaying = false;
            video.dispose();
            video = null;
        }, true);
    }
}

function onEvent(event:String, value1:String, value2:String, strumTime:Float) //play vid
{
    if(event == "Video Cutscene"){
        vidPlaying = true;
        startVideo(value1, value2);
    }
}

function startVideo(name:String, volume:Float = 0)
{
    var filepath:String = Paths.video(name);
    if(!FileSystem.exists(filepath)) PlayState.instance.addTextToDebug('Couldnt find video file: ' + name, FlxColor.RED);

    video.play(filepath);
}

function onPause()
{
    if(video != null && vidPlaying){
        pauseBG.visible = true;
        video.visible = false;
        video.pause();
    }
}

function onResume()
{
    if(video != null){
        video.resume();
        pauseBG.visible = false;
        video.visible = true;
    }
}

//these for so the vid stops when you die or finish the song

function onGameOver()
{
    deleteVid();
}

function onEndSong()
{
    deleteVid();
}

function onGameOver()
{
    deleteVid();
}

function onEndSong()
{
    deleteVid();
}

function deleteVid()
{
    if(video != null){
    video.stop();
    vidPlaying = false;
    video.dispose();
    video = null;
    }
}