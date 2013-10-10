package ;

import org.flixel.FlxSprite;
import org.flixel.FlxObject;
import org.flixel.FlxG;
import org.flixel.FlxU;

class Player extends FlxSprite
{
	public static var score:Float = 0.0;
	public static var isDead:Bool = false;
	public var isFlying:Bool = false;
	private var _jump:Float;
	public var userTouching:Bool = false;

	public function new()
	{
		score = 0;
		isDead = false;
		
		super(16, FlxG.height - 192, "assets/gfx/player.png");
		acceleration.y = 1200;
		maxVelocity.y = 300;

		loadGraphic("assets/gfx/player.png", true, true, 63, 93);
		addAnimation("normal", [1], 10, true);
		addAnimation("flying", [0], 10, true);
	}

	override public function update():Void
	{
		if((_jump >= 0) && (FlxG.keys.SPACE) && (FlxG.keys.CONTROL)){ //Cheat: infite fuel on CTRL+SPACE
			isFlying = true;
		}
		else if((_jump >= 0) && (FlxG.keys.SPACE))
		{
			_jump += FlxG.elapsed;
			if(_jump > 1) {_jump = -1;}
			isFlying = true;
		}
		else {_jump = -1;}

		if(_jump > 0)
		{
			if(_jump < 0.065)
			{
				velocity.y = -180;
				isFlying = true;
			}
			else
			{
				acceleration.y = 0;
				isFlying = true;
			}
		}
		else
		{
			velocity.y = 1200;
			isFlying = false;
		}

		if(isTouching(FlxObject.FLOOR)) {_jump = 0; isFlying = false;}

		if(isFlying)
		{
			play("flying");
		}
		else
		{
			play("normal");
		}

		x = 16;
		super.update();
	}

}
