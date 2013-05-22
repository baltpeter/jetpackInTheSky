package ;

import org.flixel.FlxSprite;
import org.flixel.FlxG;
import org.flixel.FlxText;
import org.flixel.FlxState;
import org.flixel.FlxRect;


class PlayState extends FlxState
{
	//private var debug:FlxText;
	private var controls:FlxText;
	private var scoreDisp:FlxText;
	public var player:Player;
	public var platform1:Platform;
	public var platform2:Platform;

	override public function create():Void
	{
		FlxG.bgColor = 0xffffffff;
		var background = new Background();
		FlxG.mouse.show();

		scoreDisp = new FlxText(FlxG.width - 360, 0, 720, Std.string(Player.score), 16);
		//scoreDisp.alignment = "right";
		scoreDisp.color = 0xff131c1b;

		player = new Player();
		platform1 = new Platform(0, FlxG.height - 64);
		platform2 = new Platform(480, FlxG.height - 64);

		add(background);
		add(player);
		add(platform1);
		add(platform2);
		add(scoreDisp);
	}

	override public function update():Void
	{
		FlxG.collide(player, platform1);
		FlxG.collide(player, platform2);

		if(!player.onScreen())
		{
			Player.isDead = true;
			FlxG.switchState(new DeadState());
		}

		scoreDisp.text = Std.string(Player.score);

		super.update();
	}
}