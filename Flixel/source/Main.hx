package ;

import flixel.FlxG;
import flixel.FlxGame;
import haxe.Log;
import model.Model;
import openfl.display.Sprite;


import haxe.Json;
import openfl.net.WebSocket;
import openfl.Assets;

import visual_component.Hint_board;

class Main extends Sprite
{
	private var _ws:WebSocket = null;
	
	public static var _model:Model;		
	
	public var _game:FlxGame;
	
	
	
	public function new()
	{
		super();
		
		_model = new Model();
		addChild(new FlxGame(1920, 1080, MenuState,1,60,60,false,true));		
		
		//event
		Main._model.send_pack.add(send_pack);
		
		if ( _ws == null)
		{
			_ws = new WebSocket("ws://52.68.210.98:7777/gamesocket/111");
			//_ws = new WebSocket("ws://52.197.7.184:8001/gamesocket/token/6f4922f45568161a8cdf4ad2299f6d23");
			//_ws = new WebSocket("ws://www.mm9900.net:8001/gamesocket/token/6f4922f45568161a8cdf4ad2299f6d23");
			_ws.onOpen.add(onOpen);		
			_ws.onError.add(onError);
			_ws.onTextPacket.add(onText);
			_ws.onClose.add(onClose);
		}
		FlxG.debugger.visible = true;
		
		//TODO test class
		Assets.loadText("assets/data/pack_DK_normal.txt").onComplete(pack_loading_Ok);
		FlxG.camera.antialiasing = true;
		
		
	}
	
	private function send_pack(data:Dynamic):Void
	{
		FlxG.log.add("send_pack " + data);
		_ws.sendText(Json.stringify(data));
	}
	
	private function pack_loading_Ok(un_parse_pack:Dynamic):Void
	{		
		var ob:Dynamic = Json.parse(un_parse_pack);		
		var _packlist:Array<String> = ob.packlist;
		
		for (i in 0...(_packlist.length))
		{
			var str:String = Json.stringify(ob.packlist[i]);			
			//FlxG.log.add(str);
			Main._model._packlist.push(str);
		}
		
		FlxG.log.add("sim pack ok");
	}
	
	private function onOpen(s:Dynamic):Void
    {
		FlxG.log.add("sim pack onOpen");
    } 
	
	private function onError(s:String):Void
    {
		FlxG.log.add(s);
		//TODO hint first error ->close
		_ws.dispose();		
    } 
	
	private function onText(s:String):Void
	{
		parse_pack(s);
	}
	
	public static function parse_pack(un_parse_pack:String)
	{						
		var ob:Dynamic = Json.parse(un_parse_pack);
		//FlxG.log.add(ob);
		
		//parse
		_model.pack_parse(ob);
	}
	
	private function onClose(s:Dynamic):Void
	{	
		FlxG.log.add("close==");
		var s:String = "socket close";
		Main._model.socket_error.dispatch(s);
	}
}