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
import flixel.util.FlxSpriteUtil;

import openfl.Assets;
import flash.display.BitmapData;

import flixel.addons.display.FlxPieDial;
import flixel.addons.display.FlxPieDial.FlxPieDialShape;
import flixel.tweens.FlxTween;

import flixel.input.mouse.FlxMouseEventManager;

class Dk extends FlxTypedGroup<FlxSprite>
{
	private var _bg:FlxSprite;	
	private var _desk:FlxSprite;
	private var _girl:FlxSprite;
	
	private var _loadpic:FlxButton;
	//private var _player:Base_sprite;
	private var _timerbg:FlxSprite;
	private var _dial:FlxPieDial;
	private var _targ:FlxSprite;
	
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
		_girl = new FlxSprite(686,24).loadGraphic(AssetPaths.dk_girl_1__png);		
		_girl.antialiasing = true;		
		add(_girl);
		
		_loadpic = new FlxButton(700, 200, "dk", clickPlay);
		add(_loadpic);
		
		Main._model.NewRoundState.add(Round_start);
		Main._model.EndRoundState.add(Round_end);
		//_player = new Base_sprite(30, 30);
		//add(_player);
		
		//_targ = new FlxSprite(500, 500);
		//add(_targ);
		
		//_timerbg = new FlxSprite(500, 500, AssetPaths.timer_bg__png);
		//add(_timerbg);
		
		//_dial = new FlxPieDial(_timerbg.x + 24, _timerbg.y + 30, 90, FlxColor.LIME, 36, FlxPieDialShape.CIRCLE, true, 0);
		//_dial.loadGraphic(AssetPaths.timer_countDown__png);
		//_dial.amount = 0.0;
		//add(_dial);
		//FlxSpriteUtil.alphaMaskFlxSprite(_timerbg,_dial,_targ);
		
		//FlxTween.tween(_dial, { amount: 1.0 }, 2.0);
	}	
	
	private function Round_start(s:Dynamic):Void
	{
		//_girl.loadGraphic(AssetPaths.dk_girl_1__png);
	}
	
	
	private function Round_end(s:Dynamic):Void
	{
		//_girl.loadGraphic(AssetPaths.dk_girl_2__png);
	}
	
	private function clickPlay():Void
	{
		//Assets.loadBitmapData(AssetPaths.dk_girl__png).onComplete(dysonDown);	
		//Main._model.adjust_item.dispatch(_girl);
		Main._model.adjust_item.dispatch(_dial);
	}
	
	private function dysonDown(s:BitmapData):Void
	{		
		
		//_player.antialiasing = true;
		//_player.set_bitmap(s);
	}
		
}