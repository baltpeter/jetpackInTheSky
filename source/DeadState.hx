package ;

import org.flixel.FlxState;
import org.flixel.FlxPoint;
import org.flixel.FlxG;
import org.flixel.FlxButton;
import org.flixel.FlxText;
import org.flixel.plugin.photonstorm.FlxDisplay;

class DeadState extends FlxState
{
	override public function create():Void
	{
		FlxG.bgColor = 0xff000000;
		FlxG.mouse.show();

		var scoreDisplay = new FlxText(FlxG.width / 2 - 250, 100, 500, "Your score: " + Player.score);
		scoreDisplay.alignment = "center";
		scoreDisplay.size = 35;


		var restartButton = new FlxButton(0, 0, "Restart", onRestartBtnClick);
		restartButton.scale = new FlxPoint(3, 3);
		restartButton.label = new FlxText(0, 2, Math.floor(restartButton.width), "Restart");
		restartButton.label.size = 15;
		FlxDisplay.screenCenter(restartButton, true, true);
		
		add(scoreDisplay);
		add(restartButton);
	}

	private function onRestartBtnClick():Void
	{
		FlxG.switchState(new PlayState());
	}

	override public function update():Void
	{
		super.update();
	}
}