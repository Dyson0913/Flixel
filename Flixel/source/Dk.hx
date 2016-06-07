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
	private var _hide:FlxButton;
	private var _show:FlxButton;
	
	private var _player:Base_sprite;
	
	private var _change_sence:FlxButton;	
	
	
	
	public function new() 
	{
		super();
		
		FlxG.log.add("dk init");
		
		//_bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLUE);		
		_bg = new FlxSprite().loadGraphic(AssetPaths.dk_bg__png);
		add(_bg);
		
		_desk = new FlxSprite().loadGraphic(AssetPaths.dk_desk__png);
		add(_desk);
		
		//new Btn(10, 20, AssetPaths.dk_girl__png,null,null,drag,null);
		_girl = new FlxSprite(650).loadGraphic(AssetPaths.dk_girl__png);
		_girl.antialiasing = true;
		
		add(_girl);
		
		
		
		_loadpic = new FlxButton(300, 200, "dk", clickPlay);
		add(_loadpic);
		
		_hide = new FlxButton(400, 200, "hide", hide);
		add(_hide);
		
		_show = new FlxButton(500, 200, "show", show);
		add(_show);
		
		_player = new Base_sprite(30, 30);
		add(_player);
		
	}	
	
	private function show():Void
	{
		_player.show();
	}
	
	private function hide():Void
	{
		_player.hide();
	}
	
	private function clickPlay():Void
	{
		Assets.loadBitmapData(AssetPaths.dk_girl__png).onComplete(dysonDown);		
	}
	
	private function dysonDown(s:BitmapData):Void
	{		
		
		_player.antialiasing = true;
		_player.set_bitmap(s);
	}
		
}