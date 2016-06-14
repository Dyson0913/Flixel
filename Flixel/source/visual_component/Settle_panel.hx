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



class Settle_panel extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;
	private var _zone2:FlxSprite;
	
	public function new() 
	{
		super();
		
		_zone = new FlxSprite(1285, 115).loadGraphic(AssetPaths.settle__png);
		_zone.antialiasing = true;
		add(_zone);
		_zone.kill();
		
		_zone2 = new FlxSprite(1770, 120).loadGraphic(AssetPaths.settle_point__png);
		_zone2.antialiasing = true;
		add(_zone2);
		//_zone2.kill();
		
		//event
		Main._model.NewRoundState.add(disappear);
		Main._model.StartBetState.add(disappear);
		Main._model.EndBetState.add(appear);
		Main._model.OpenState.add(appear);
		Main._model.EndRoundState.add(appear);
		
		
	}
	
	private function appear(s:Dynamic):Void
	{		
		_zone.revive();
		
		
		_zone2.revive();
	}
	
	private function disappear(s:Dynamic):Void
	{		
		_zone.kill();
		_zone2.kill();
	}
	
}