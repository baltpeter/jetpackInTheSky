package ;

import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.plugin.photonstorm.FlxMath;

class Platform extends FlxSprite
{
	public var runSpeed:Float = 15;
	public var counter:Float = 0;
	public var acc:Float = 5;
	public var nHeight:Int = 1;

	public function new(xPos:Int, yPos:Int)
	{
		runSpeed = 20;
		counter = 0;
		acc = 5;
		nHeight = 1;
		
		var rnd:Int = 1;
		rnd = Math.floor(Math.random() * 4);
		if(rnd == 0) {rnd = 2;}

		solid = true;

		super(xPos, yPos, "assets/gfx/platform" + rnd + ".png");
	}

	public function getRealHeight(nHeight)
	{
		if(nHeight == 0)
		{
			return FlxG.height - 90;
		}
		else if(nHeight == 1)
		{
			return FlxG.height - 165;
		}
		else if(nHeight == 2)
		{
			return FlxG.height - 224;
		}
		else if(nHeight == 3)
		{
			return FlxG.height - 288;
		}
		else if(nHeight == 4)
		{
			return FlxG.height - 333;
		}
		return FlxG.height - 88;
	}

	override public function update():Void
	{

		var oldNHeight:Int = 1;
		// run speed, move
		counter += FlxG.elapsed;
		if(counter >= 20)
		{
			runSpeed = runSpeed + acc;
			acc = acc * 0.75;
			counter = 0;
		}

		x -= 0.5 * runSpeed;
		y = getRealHeight(nHeight);

		// update score counter
		if(!Player.isDead)
		{
			Player.score += Math.floor(runSpeed / 2.3);
		}

		super.update();

		// reset if off screen
		if(x <= -frameWidth)
		{
			// get new Y
			nHeight = nHeight + Math.floor(Math.random() * 3 + 0.45);
			if(nHeight < 0) {nHeight = 1;}
			if(Math.abs(nHeight - oldNHeight) > 2) {nHeight = oldNHeight;}
			oldNHeight = nHeight;

			x = FlxG.width + Math.floor(Math.random() * 3);

			// a bit of randomness for the texture ;)
			var rnd:Int = 1;
			rnd = Math.floor(Math.random() * 4);
			if(rnd == 0) {rnd = 2;}
			loadGraphic("assets/gfx/platform" + rnd + ".png");
		}
	}
}