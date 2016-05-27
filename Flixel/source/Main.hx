package ;

import flixel.FlxG;
import flixel.FlxGame;
import haxe.Log;
import model.Model;
import openfl.display.Sprite;



import haxe.Json;
import openfl.net.WebSocket;


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
	}
	
	private function onOpen(s:Dynamic):Void
    {
		
    } 
	
	private function onText(s:String):Void
	{
		var ob:Dynamic = Json.parse(Json.stringify(s));
		FlxG.log.add(ob);
		Main._model._name = ob.myname;
		//FlxG.log.add(s);
		
		_ws.sendText(Json.stringify(s));
	}
	
	private function onClose(s:Dynamic):Void
	{	
		_ws.dispose();
	}
}