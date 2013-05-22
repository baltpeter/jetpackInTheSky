package;

import org.flixel.plugin.photonstorm.FlxDisplay;
import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;

class TutState extends FlxState
{
	override public function create():Void
	{
		FlxG.bgColor = 0xff131c1b;
		FlxG.mouse.show();

		var intro = new FlxText(0, 50, 450,"You're up in the air. Luckily you've got a jetpack with you, so you don't need to worry too much about falling down. But be careful: your jetpack has a limited amount of charge and only lasts for about a second. Therefore, you'll need to land on the clouds in order to survive... \n \nUse the SPACE bar to activate your jetpack.");
		intro.size = 20;
		var startButton = new FlxButton(0, 400, "Start", onStartBtnClick);
		startButton.scale.x = 4;
		startButton.scale.y = 4;
		add(startButton);
		add(intro);
		FlxDisplay.screenCenter(startButton, true, false);
		FlxDisplay.screenCenter(intro, true, false);
	}

	private function onStartBtnClick():Void
	{
		FlxG.switchState(new PlayState());
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}	
}