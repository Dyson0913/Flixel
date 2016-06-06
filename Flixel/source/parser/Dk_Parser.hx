package parser;

import flixel.FlxObject;
import flixel.FlxG;

import model.IParser;


/**
 * ...
 * @author hhg4092
 */

class Dk_Parser extends IParser
{	
	public function new() 
	{
		super();		
	}
	
	public override function parser(message:Dynamic):Void 
	{
		FlxG.log.add("dk parse");
		FlxG.log.add(message);
		
		//Main._model.StateUpdate.dispatch(message);
    }
	
	
}
