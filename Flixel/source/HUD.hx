package ;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

import flixel.ui.FlxButton;
import flixel.util.FlxColor;

class HUD extends FlxTypedGroup<FlxSprite>
{
	private var _sprBack:FlxSprite;
	
	private var _loadpic:FlxButton;
	
	private var _player:Base_sprite;
	
	private var _change_sence:FlxButton;
	
	public function new() 
	{
		super();
		
		_sprBack = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BROWN);
		add(_sprBack);
		
		_loadpic = new FlxButton(50, 0, "loading", clickPlay);		
		add(_loadpic);
		
		_player = new Base_sprite(30, 30);
		add(_player);
		
		_change_sence = new FlxButton(250, 400, "change", clickchange);		
		add(_change_sence);
	}
	
	private function clickPlay():Void
	{
		//Assets.loadBitmapData("assets/images/dk/dk.png").onComplete(dysonDown);		
	}
	
	private function clickchange():Void
	{		
		//FlxG.switchState(new MenuState());
	}
}