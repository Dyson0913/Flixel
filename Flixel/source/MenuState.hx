package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import haxe.Json;

//import flixel.util.FlxSpriteUtil;

import openfl.utils.ByteArray;

import openfl.net.WebSocket;

class MenuState extends FlxState
{
	private var _btn_sence:FlxButton;
	
	private var _pack:FlxText;
	
	private var _ws:WebSocket;
	
	override public function create():Void
	{
		
		add(new FlxText(0, 0, 0, "Hello World!"));
		
		_btn_sence = new FlxButton(0, 0, "playe", clickPlay);
		centerSprite(_btn_sence);
		add(_btn_sence);
		
		_pack = new FlxText(100, 30, 200, "pack", 14);
		add(_pack);
		
		
		
		
		_ws = new WebSocket("ws://106.186.116.216:8888/gamesocket/111");
		_ws.onOpen.add(onOpen);		
		_ws.onTextPacket.add(onText);
		_ws.onClose.add(onClose);
		
		super.create();
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
		FlxG.switchState(new PlayState());
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}