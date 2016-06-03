package ;

import flixel.FlxG;
import flixel.FlxGame;
import haxe.Log;
import js.html.ButtonElement;
import model.Model;
import openfl.display.Sprite;

import haxe.Json;
import openfl.net.WebSocket;
import openfl.Assets;

import js.Browser;

class Main extends Sprite
{
	private var _ws:WebSocket = null;
	
	public static var _model:Model;		
	
	public function new()
	{
		super();
		
		_model = new Model();
		
		addChild(new FlxGame(1920, 1080, MenuState,1,60,60,false,true));
		
		if ( _ws == null)
		{
			_ws = new WebSocket("ws://52.68.210.98:7777/gamesocket/111");
			//_ws = new WebSocket("ws://www.mm9900.net:8001/gamesocket/token/6f4922f45568161a8cdf4ad2299f6d23");
			_ws.onOpen.add(onOpen);		
			_ws.onError.add(onError);
			_ws.onTextPacket.add(onText);
			_ws.onClose.add(onClose);
		}
		//FlxG.debugger.visible = true;		
		
		//TODO test class
		Assets.loadText("assets/data/pack_DK_normal.txt").onComplete(pack_loading_Ok);
		
		#if html5
		var button:ButtonElement = Browser.document.createButtonElement();
		button.textContent = "click me!";
		button.onclick = function(event)
		{
			Browser.alert("haxe is great");			
		}
		Browser.document.body.appendChild(button);
		#end
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
	}
	
	private function onOpen(s:Dynamic):Void
    {
		
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
		
		//_ws.sendText(Json.stringify(s));
	}
	
	public static function parse_pack(un_parse_pack:String)
	{				
		var ob:Dynamic = Json.parse(un_parse_pack);
		//FlxG.log.add(ob);
		
		//parse
		
		
	}
	
	private function onClose(s:Dynamic):Void
	{	
		FlxG.log.add("close==");		
		
	}
}