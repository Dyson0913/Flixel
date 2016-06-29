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

class Template_State extends FlxTypedGroup<FlxSprite>
{
	private var _bg:FlxSprite;
	
	private var _loadpic:FlxButton;
	
	public function new() 
	{
		super();
		
		_bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.CYAN);
		add(_bg);				
		
		_loadpic = new FlxButton(300, 200, "template", clickPlay);		
		add(_loadpic);
	
	}
	
	private function clickPlay():Void
	{
		
	}
	
	
	
}