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
	
	
	override public function create():Void
	{
		super.create();
		add(new FlxText(0, 0, 0, "playerState"));	
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	
	
	//private function dysonDown(s:BitmapData):Void
	//{		
		//_player.set_bitmap(s);
	//}
	
	
	
}