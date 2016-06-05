package parser;

import flixel.FlxObject;
import flixel.FlxG;

import model.IParser;


/**
 * ...
 * @author hhg4092
 */

class PA_Parser extends IParser
{	
	public function new() 
	{
		super();		
	}
	
	public override function parser(message:Dynamic):Void 
	{
		FlxG.log.add("PA parse");
		FlxG.log.add(message);
    }
	
	
}
