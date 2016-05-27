package ;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;

import flixel.ui.FlxButton;
import flixel.util.FlxColor;

import openfl.Assets;
import flash.display.BitmapData;

class Dk extends FlxTypedGroup<FlxSprite>
{
	private var _sprBack:FlxSprite;
	
	private var _loadpic:FlxButton;
	
	private var _player:Base_sprite;
	
	private var _change_sence:FlxButton;	
	
	private var s:String;
	
	public function new() 
	{
		super();
		
		_sprBack = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLUE);
		add(_sprBack);
		FlxG.log.add("dk init");
		s = Main._model._name;
		
		_loadpic = new FlxButton(300, 200, s, clickPlay);		
		add(_loadpic);
		
		_player = new Base_sprite(30, 30);
		add(_player);
		
		//_change_sence = new FlxButton(250, 400, "dk pic loading", clickchange);		
		//add(_change_sence);
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
		//FlxG.switchState(new MenuState());
	}
}