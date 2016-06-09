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



class History_recode extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;
	private var _zone2:FlxSprite;
	
	public function new() 
	{
		super();		
		FlxG.log.add("History_recode init");
		_zone = new FlxSprite(1285, 115).loadGraphic(AssetPaths.history__png);
		_zone.antialiasing = true;
		add(_zone);
		_zone.kill();
		
		_zone2 = new FlxSprite(1290, 120).loadGraphic(AssetPaths.r_ball__png);
		_zone2.antialiasing = true;
		add(_zone2);
		_zone2.kill();
		
		//event
		Main._model.NewRoundState.add(appear);
		Main._model.StartBetState.add(appear);
		Main._model.EndBetState.add(disappear);
		Main._model.OpenState.add(disappear);
		Main._model.EndRoundState.add(appear);
		
		//Main._model.adjust_item.dispatch(_zone2);
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