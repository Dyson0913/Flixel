package model;

import flixel.FlxObject;
import parser.*;
import flixel.FlxG;

import haxe.Json;
/**
 * ...
 * @author hhg4092
 */

@:allow(Slot)
class Model extends FlxObject
{
    //interface
	public var _parser:IParser;	
	
	//model
	public var _credit:String;
	public var _gamelist:Array<String> = new Array();
	
	public var _game_round:String;
	public var _game_state:String;
	public var _remain_time:String;
	
	
	//base event
	public var send_pack = new Signal<Dynamic>();
	
	//sys event
	public var socket_error = new Signal<Dynamic>();
	public var creditUpdate = new Signal<Dynamic>();
	public var join_game_success = new Signal<Dynamic>();
	
	
	
	public var NewRoundState = new Signal<Dynamic>();
	public var StartBetState = new Signal<Dynamic>();
	public var EndBetState = new Signal<Dynamic>();
	public var OpenState = new Signal<Dynamic>();
	public var EndRoundState = new Signal<Dynamic>();
	
	
	
	//for test
	public var _packlist:Array<String> = new Array();
	public var _packlist_idx:Int = 0;
	
	public var adjust_item = new Signal<Dynamic>();
	
	
	public function new() 
	{
		super();
		
		//customer
		_parser = new Dk_Parser();		
	}
	
	public function pack_parse(pack:Dynamic):Void
	{
		//check which game ,lobby or game
		//FlxG.log.add("lobby pack parse "+pack);
		
		if ( pack.message_type == "echo_join")
		{
			Main._model.creditUpdate.dispatch("100");
			return;
		}
		
		if ( pack.message_type == "MsgLogin")
		{			
			_credit = pack.player_info.player_credit;
			
			//dynamic field
			for (n in Reflect.fields(pack.game_list))
			{
				var item:Dynamic = Reflect.field(pack.game_list, n);
				//FlxG.log.add("gamelist " + Reflect.field(pack.game_list, n));
				//FlxG.log.add("gamelist " + item.game_id);
				_gamelist.push(item.game_id);
			}				
			
			Main._model.creditUpdate.dispatch(_credit);
			return;
		}
		
		if ( pack.message_type == "MsgKeepLive")
		{
			//FlxG.log.add("lobby pack MsgKeepLive not handle");
			return;
		}
		
		_parser.parser(pack);
	}
	
}

class Signal<T> {
    private var callbacks = new Array<T -> Void>();

    public function new() {
    }

    public function dispatch(?value:T) {
        for (cb in callbacks) {
            cb(value);
        }
    }

    public function add(callback:T -> Void):T -> Void {
        callbacks.push(callback);
        return callback;
    }

    public function remove(callback:T -> Void):Void {
        callbacks.remove(callback);
    }
}