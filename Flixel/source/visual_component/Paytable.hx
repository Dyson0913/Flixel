package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import model.Model;

import flixel.util.FlxColor;



class Paytable extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;
	private var _zone2:FlxSprite;
	
	public function new() 
	{
		super();		
		_zone = new FlxSprite(45, 112).loadGraphic(AssetPaths.paytable__png);
		_zone.antialiasing = true;
		add(_zone);
		_zone.kill();
		
		_zone2 = new FlxSprite(45, 112).loadGraphic(AssetPaths.paytable_percent__png);
		_zone2.antialiasing = true;
		add(_zone2);
		_zone2.kill();
		
		//event
		Main._model.NewRoundState.add(appear);
		Main._model.StartBetState.add(appear);
		Main._model.EndBetState.add(disappear);
		Main._model.OpenState.add(disappear);
		Main._model.EndRoundState.add(appear);		
	}
	
	private function appear(s:Dynamic):Void
	{		
		_zone.revive();
		percent_disapp();
	}
	
	private function disappear(s:Dynamic):Void
	{		
		_zone.kill();
		percent_app();
	}
	
	private function percent_app():Void
	{
		_zone2.revive();
	}
	
	private function percent_disapp():Void
	{
		_zone2.kill();
	}
	
}