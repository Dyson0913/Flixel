package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import haxe.Json;

import flash.display.BitmapData;

import Std;
import openfl.Assets;
//import flixel.util.FlxSpriteUtil;

import openfl.utils.ByteArray;

import openfl.net.WebSocket;

class MenuState extends FlxState
{
	private var _btn_sence:FlxButton;
	
	private var _pack:FlxText;
	private var _dyson:FlxText;
	
	private var _program:FlxText;
	
	private var _bit:BitmapData;
	private var _player:Base_sprite;
	
	private var _ws:WebSocket;
	
	override public function create():Void
	{
		
		add(new FlxText(0, 0, 0, "Hello World!"));
		
		_btn_sence = new FlxButton(0, 0, "playe", clickPlay);
		centerSprite(_btn_sence);
		add(_btn_sence);
		
		_pack = new FlxText(100, 30, 200, "pack", 14);
		add(_pack);
		
		_dyson = new FlxText(300, 300, 200, "dyson", 14);
		add(_dyson);
		
		_program = new FlxText(400, 300, 200, "pro", 14);
		add(_program);
		
		
		
		
		_player = new Base_sprite(30, 30);
		add(_player);
		
		_ws = new WebSocket("ws://106.186.116.216:8888/gamesocket/111");
		_ws.onOpen.add(onOpen);		
		_ws.onTextPacket.add(onText);
		_ws.onClose.add(onClose);
		
		super.create();
	}

	private function dysonpro(percent:Float):Void
	{
		_program.text = Std.string(percent);
	}
	
	private function dysonDown(s:BitmapData):Void
	{
		if( s == null) _dyson.text = "not  ok";
		else
		{
			_dyson.text = "ok";
			_bit = s;
			_player.set_bitmap(_bit);
		}
		
		
	}
	
	private function onOpen(s:Dynamic):Void
    {
		if ( s == null) _pack.text = " onopen";
		else _pack.text = s;
    } 

	
	private function onText(s:String):Void
	{
		_pack.text = s;		
		_ws.sendText(Json.stringify(s));
	}
	
	private function onClose(s:Dynamic):Void
	{
		_pack.text = "close";
		_ws.dispose();
	}
	
	function centerSprite(sprite:FlxButton)
	{
		sprite.x = (FlxG.width / 2) - (sprite.width / 2);
		sprite.y = (FlxG.height / 2) - (sprite.height / 2);
	}
	
	
	private function clickPlay():Void
	{
		Assets.loadBitmapData("assets/images/dyson.png").onProgress(dysonpro).onComplete(dysonDown);
		
		//FlxG.switchState(new PlayState());
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}