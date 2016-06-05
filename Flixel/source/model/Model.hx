package model;

import flixel.FlxObject;
import parser.*;
import flixel.FlxG;

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
	public var _name:String;
	
	
	
	public var StateUpdate = new Signal<Dynamic>();		
	
	//for test
	public var _packlist:Array<String> = new Array();
	
	public function new() 
	{
		super();
		
		//customer
		_parser = new Dk_Parser();		
	}
	
	public function pack_parse(unparse_pack:Dynamic):Void
	{
		//check which game ,lobby or game
		//FlxG.log.add("lobby pack parse "+unparse_pack);
		if ( unparse_pack.message_type == "MsgLogin")
		{
			FlxG.log.add("lobby pack MsgLogin not handle ");
			return;
		}
		
		if ( unparse_pack.message_type == "MsgKeepLive")
		{
			FlxG.log.add("lobby pack MsgKeepLive not handle");
			return;
		}
		
		//_parser.parser(unparse_pack);
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