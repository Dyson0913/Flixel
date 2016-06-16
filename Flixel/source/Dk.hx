package ;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import model.Model;


import flixel.ui.FlxButton;
import flixel.util.FlxColor;

import openfl.Assets;
import flash.display.BitmapData;

import flixel.input.mouse.FlxMouseEventManager;

class Dk extends FlxTypedGroup<FlxSprite>
{
	private var _bg:FlxSprite;	
	private var _desk:FlxSprite;
	private var _girl:FlxSprite;
	
	private var _loadpic:FlxButton;
	//private var _player:Base_sprite;
	
	public function new() 
	{
		super();
		
		FlxG.log.add("dk init");
		
		//_bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLUE);		
		_bg = new FlxSprite().loadGraphic(AssetPaths.dk_bg__png);
		add(_bg);
		
		_desk = new FlxSprite().loadGraphic(AssetPaths.dk_desk__png);		
		//_desk = new FlxSprite().loadGraphic(AssetPaths.demo02__jpg);
		add(_desk);
		
		//new Btn(10, 20, AssetPaths.dk_girl__png,null,null,drag,null);
		_girl = new FlxSprite(686,24).loadGraphic(AssetPaths.dk_girl__png);		
		_girl.antialiasing = true;
		
		add(_girl);
		
		
		
		_loadpic = new FlxButton(700, 200, "dk", clickPlay);
		add(_loadpic);
		
		
		
		//_player = new Base_sprite(30, 30);
		//add(_player);
		
	}	
	
	private function clickPlay():Void
	{
		//Assets.loadBitmapData(AssetPaths.dk_girl__png).onComplete(dysonDown);	
		//Main._model.adjust_item.dispatch(_girl);
	}
	
	private function dysonDown(s:BitmapData):Void
	{		
		
		//_player.antialiasing = true;
		//_player.set_bitmap(s);
	}
		
}