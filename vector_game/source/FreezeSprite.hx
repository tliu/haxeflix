package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxObject;

class FreezeSprite extends FlxSprite
{

    public var speed:Float = 200;
    var up:Bool = false;
    var down:Bool = false;
    var left:Bool = false;
    var right:Bool = false;

    public var frozen:Boolean = false;
    
    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        loadGraphic(AssetPaths.player__png, true, 16, 16);
    }


    override public function update(elapsed:Float):Void
    {
        if (!frozen) {
            
        }
        super.update(elapsed);
    }


}
