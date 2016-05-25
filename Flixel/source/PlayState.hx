package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

import flash.display.BitmapData;

import openfl.Assets;

class PlayState extends FlxState
{
	private var _loadpic:FlxButton;
	
	private var _player:Base_sprite;
	
	private var _change_sence:FlxButton;
	
	override public function create():Void
	{
		super.create();
		add(new FlxText(0, 0, 0, "playerState"));
		
		_loadpic = new FlxButton(200, 300, "loading", clickPlay);		
		add(_loadpic);
		
		_player = new Base_sprite(30, 30);
		add(_player);
		
		_change_sence = new FlxButton(250, 400, "change", clickchange);		
		add(_change_sence);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function clickPlay():Void
	{
		Assets.loadBitmapData("assets/images/dk/dk.png").onComplete(dysonDown);		
	}
	
	private function dysonDown(s:BitmapData):Void
	{		
		_player.set_bitmap(s);
	}
	
	private function clickchange():Void
	{		
		FlxG.switchState(new MenuState());
	}
	
}