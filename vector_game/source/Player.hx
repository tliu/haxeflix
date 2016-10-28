package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxObject;

class Player extends FlxSprite
{

    public var speed:Float = 200;
    var up:Bool = false;
    var down:Bool = false;
    var left:Bool = false;
    var right:Bool = false;
    
    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        loadGraphic(AssetPaths.player__png, true, 16, 16);
        setFacingFlip(FlxObject.LEFT, false, false);
        setFacingFlip(FlxObject.RIGHT, true, false);
        animation.add("lr", [3, 4, 3, 5], 6, false);
        animation.add("u", [6, 7, 6, 8], 6, false);
        animation.add("d", [0, 1, 0, 2], 6, false);

    }


    override public function update(elapsed:Float):Void
    {
        velocity.x = 0;
        velocity.y = 0;
        movement();
        super.update(elapsed);
    }

    private function movement():Void {
        up = FlxG.keys.anyPressed([W]);
        down = FlxG.keys.anyPressed([S]);
        left = FlxG.keys.anyPressed([A]);
        right = FlxG.keys.anyPressed([D]);
        if (up || down || left || right) {
            var mA:Float = 0;
            if (up)
            {
                mA = -90;
                if (left)
                    mA -= 45;
                else if (right)
                    mA += 45;
                facing = FlxObject.UP;
            }
            else if (down)
            {
                mA = 90;
                if (left)
                    mA += 45;
                else if (right)
                    mA -= 45;
                facing = FlxObject.DOWN;
            }
            else if (left) {
                mA = 180;
                facing = FlxObject.LEFT;
            }
            else if (right) {
                mA = 0;
                facing = FlxObject.RIGHT;
            }
            velocity.set(speed, 0);
            velocity.rotate(FlxPoint.weak(0, 0), mA);

            if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE)
            {
                switch (facing)
                {
                    case FlxObject.LEFT,
                    FlxObject.RIGHT:
                        animation.play("lr");
                    case FlxObject.UP:
                        animation.play("u");
                    case FlxObject.DOWN:
                        animation.play("d");
                }
            }
        }
    }


}
