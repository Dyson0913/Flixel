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



class HUD extends FlxTypedGroup<FlxSprite>
{
	private var _sprBack:FlxSprite;
	
	private var _loadpic:FlxButton;
	
	private var _player:Base_sprite;
	
	private var _change_sence:FlxButton;
	
	public function new() 
	{
		super();
		
		_sprBack = new FlxSprite().makeGraphic(FlxG.width, 30, FlxColor.BROWN);
		add(_sprBack);
		
		
		add(new FlxText(0, 0, 0, ""));	
		
		_loadpic = new FlxButton(100, 0, "back", back_to_lobby);		
		_loadpic = new FlxButton(100, 0, "test", pack_test);		
		add(_loadpic);
		//
		//_player = new Base_sprite(30, 30);
		//add(_player);
		//
		//_change_sence = new FlxButton(250, 400, "change", clickchange);		
		//add(_change_sence);
	}
	
	private function back_to_lobby():Void
	{
		FlxG.switchState(new MenuState());		
	}
	
	private function pack_test():Void
	{		
		
	}
}