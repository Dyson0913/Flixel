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
	public var _remain_time:Int;
	public var _recode_hisotry:Dynamic;
	public var _coin_select_idx:Int;
	public var _zone_un_comfirm_bet:Array<Float> = new Array();
	public var _zone_comfirm_bet:Array<Float> = new Array();
	
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
		
		_zone_un_comfirm_bet.push(0);
		_zone_un_comfirm_bet.push(0);
		_zone_un_comfirm_bet.push(0);
		_zone_un_comfirm_bet.push(0);
		_zone_un_comfirm_bet.push(0);
		_zone_un_comfirm_bet.push(0);
		
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
	
	public function bet_in(zone:Int):Void
	{
		var total:Float = _zone_un_comfirm_bet[zone];
		total += Std.parseFloat(bet_amount());
		
		_zone_un_comfirm_bet[zone] = total;
		
		FlxG.log.add(_zone_un_comfirm_bet);
	}
	
	public function coin_res():String
	{
		var res_list:Array<String> = new Array<String>();
		
		res_list.push("assets/images/share/coin/five-1.png");
		res_list.push("assets/images/share/coin/fh-1.png");
		res_list.push("assets/images/share/coin/ot-1.png");
		res_list.push("assets/images/share/coin/ft-1.png");
		res_list.push("assets/images/share/coin/tt-1.png");
		
		return Std.string(res_list[Main._model._coin_select_idx]);
	}
	
	public function bet_amount():String
	{
		var coin_list:Array<Int> = new Array<Int>();
		 
		coin_list.push(5);
		coin_list.push(500);
		coin_list.push(1000);
		coin_list.push(5000);
		coin_list.push(10000);
		
		return Std.string(coin_list[Main._model._coin_select_idx]);
	}
	
	public static function Format(digit:Int,lenth:Int):String
	{
		var str:String = "";
		var digLenth:Int = Std.string(digit).length;
		
		var len:Int = lenth - digLenth;
		for (i in 0...(len))
		{
			str += "0";
		}
		return str + Std.string(digit);
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