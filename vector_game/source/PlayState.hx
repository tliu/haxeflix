package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
    private var player:Player;
	override public function create():Void
	{
        player = new Player(20, 20);
        FlxG.camera.bgColor = 0xFFFFFFFF;
        add(player);
        add(new Axis(50, 50));
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
