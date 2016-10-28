package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.FlxObject;

class Axis extends FlxSprite
{

    public var speed:Float = 200;
    var v_x:Float = 30;
    var v_y:Float = 40;
    var v_sum: Float;

    var up:Bool = false;
    var down:Bool = false;
    var left:Bool = false;
    var right:Bool = false;
    
    public function new(?X:Float=0, ?Y:Float=0)
    {
        super(X, Y);
        width = FlxG.width;
        height = FlxG.height;
        makeGraphic(FlxG.width, FlxG.height, 0x00000000);
        v_sum = v_x + v_y;
    }


    private function input(elapsed:Float):Void {
        up = FlxG.keys.anyPressed([UP]);
        down = FlxG.keys.anyPressed([DOWN]);
        left = FlxG.keys.anyPressed([LEFT]);
        right = FlxG.keys.anyPressed([RIGHT]);
        if (up || down || left || right) {
            var amt:Float = elapsed * 20;
            if (up) {
                v_y -= amt;
            } else if (down) {
                v_y += amt;
            } else if (left) {
                v_x -= amt;
            } else if (right) {
                v_x += amt;
            }
        }
    }

    override public function update(elapsed:Float):Void
    {

        input(elapsed);
        FlxSpriteUtil.fill(this, 0);
        FlxSpriteUtil.drawLine(this, x, y, x + v_x, y, { thickness:2, color:0xffff0000 });
        FlxSpriteUtil.drawLine(this, x, y, x, y + v_y, { thickness:2, color:0xff0000ff });
        FlxSpriteUtil.drawLine(this, x, y, x + v_x, y + v_y, { thickness:2, color:0xffff00ff });
        super.update(elapsed);
    }


}
