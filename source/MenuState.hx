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

class MenuState extends FlxState
{
	override public function create():Void
	{
		FlxG.bgColor = 0xff131c1b;
		FlxG.mouse.show();

		var logo = new FlxSprite(0, 0);
		logo.loadGraphic("assets/gfx/logo.png");
		var intro = new FlxText(0, 0, 300,"You're up in the air. Luckily you've got a jetpack with you, so you don't need to worry about falling down. But be careful: your jetpack has a limited amount of charge and only lasts for about 1 second. Therefore, you'll need to land on the clouds in order to survive...");
		intro.size = 25;
		var startButton = new FlxButton(190, FlxG.height - 60, "Start", onStartBtnClick);
		var tutButton = new FlxButton(360, FlxG.height - 60, "Tutorial", onTutBtnClick);
		startButton.scale.x = 2;
		startButton.scale.y = 2;
		tutButton.scale.x = 2;
		tutButton.scale.y = 2;
		add(logo);
		add(startButton);
		add(tutButton);
		FlxDisplay.screenCenter(logo, true, true);
	}

	private function onStartBtnClick():Void
	{
		FlxG.switchState(new PlayState());
	}
	private function onTutBtnClick():Void
	{
		FlxG.switchState(new TutState());
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