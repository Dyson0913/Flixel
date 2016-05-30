package ;

import flixel.FlxG;
import flixel.FlxGame;
import haxe.Log;
import model.Model;
import openfl.display.Sprite;



import haxe.Json;
import openfl.net.WebSocket;
import openfl.Assets;

class Main extends Sprite
{
	private var _ws:WebSocket = null;
	
	public static var _model:Model;
	
	public function new()
	{
		super();
		
		_model = new Model();
		
		addChild(new FlxGame(640, 480, MenuState));
		
		if ( _ws == null)
		{
			_ws = new WebSocket("ws://106.186.116.216:8888/gamesocket/111");
			_ws.onOpen.add(onOpen);		
			_ws.onTextPacket.add(onText);
			_ws.onClose.add(onClose);
		}
		FlxG.debugger.visible = true;		
		
		Assets.loadText("assets/data/pack_DK_normal.txt").onComplete(dysonDown);	
	}
	
	private function dysonDown(s:Dynamic):Void
	{		
		FlxG.log.add(s);
	}
	
	private function onOpen(s:Dynamic):Void
    {
		
    } 
	
	private function onText(s:String):Void
	{
		parse_pack(s);
		
		//_ws.sendText(Json.stringify(s));
	}
	
	private function parse_pack(un_parse_pack:String)
	{
		var ob:Dynamic = Json.parse(un_parse_pack);
		FlxG.log.add(ob);
		
		//parse 
		
		Main._model._name = ob.myname;
	}
	
	private function onClose(s:Dynamic):Void
	{	
		_ws.dispose();
	}
}