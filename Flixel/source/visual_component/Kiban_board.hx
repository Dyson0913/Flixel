package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import model.Model;

import flixel.util.FlxColor;



class Kiban_board extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;
	private var _zone2:FlxSprite;
	private var _zone3:FlxSprite;
	
	public function new() 
	{
		super();		
		FlxG.log.add("Kiban_board init");
		_zone = new FlxSprite(5,87).loadGraphic(AssetPaths.kiban_with_title__png);
		add(_zone);		
		
		_zone2 = new FlxSprite(1257,84).loadGraphic(AssetPaths.kiban_no_title__png);
		add(_zone2);
		
		_zone3 = new FlxSprite(1290,419).loadGraphic(AssetPaths.powerbar__png);
		add(_zone3);		
	}
	
}