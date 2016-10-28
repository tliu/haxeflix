package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class MenuState extends FlxState
{
    private var playButton:FlxButton;
	override public function create():Void
	{
		super.create();
        playButton = new FlxButton(0, 0, "Play", clickPlay);
        playButton.screenCenter();
        add(playButton);
	}

    private function clickPlay():Void {
        FlxG.switchState(new PlayState());
    }

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
