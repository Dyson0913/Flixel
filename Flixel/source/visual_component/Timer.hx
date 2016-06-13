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



class Timer extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;
	private var _zone2:FlxSprite;
	private var _zone3:FlxSprite;
	
	public function new() 
	{
		super();		
		FlxG.log.add("Paytable init");
		_zone = new FlxSprite(843, 286).loadGraphic(AssetPaths.timer_bg__png);
		_zone.antialiasing = true;
		add(_zone);		
		
		_zone2 = new FlxSprite(850, 300).loadGraphic(AssetPaths.timer_9__png);
		_zone2.antialiasing = true;
		_zone2.scale.set(0.45, 0.45);
		add(_zone2);
		
		_zone3 = new FlxSprite(906, 300).loadGraphic(AssetPaths.timer_9__png);
		_zone3.antialiasing = true;
		_zone3.scale.set(0.45, 0.45);
		add(_zone3);
		
		//event
		Main._model.NewRoundState.add(disappear);
		Main._model.StartBetState.add(appear);
		Main._model.EndBetState.add(disappear);
		Main._model.OpenState.add(disappear);
		Main._model.EndRoundState.add(disappear);		
		
		disappear(1);
		//Main._model.adjust_item.dispatch(_zone3);
	}
	
	private function appear(s:Dynamic):Void
	{		
		_zone.revive();
		_zone2.revive();
		_zone3.revive();
	}
	
	private function disappear(s:Dynamic):Void
	{		
		_zone.kill();
		_zone2.kill();
		_zone3.kill();
	}
	
}