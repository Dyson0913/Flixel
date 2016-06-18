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
import flixel.util.FlxTimer;



class Timer extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;
	private var _ten:FlxSprite;
	private var _one:FlxSprite;
	
	private var _timer:FlxTimer;
	
	public function new() 
	{
		super();		
		_zone = new FlxSprite(843, 291).loadGraphic(AssetPaths.timer_bg__png);
		_zone.antialiasing = true;
		add(_zone);		
		
		_ten = new FlxSprite(850, 300).loadGraphic(AssetPaths.timer_0__png);
		_ten.antialiasing = true;
		_ten.scale.set(0.45, 0.45);
		add(_ten);
		
		_one = new FlxSprite(906, 300).loadGraphic(AssetPaths.timer_0__png);
		_one.antialiasing = true;
		_one.scale.set(0.45, 0.45);
		add(_one);
		
		//event
		Main._model.NewRoundState.add(disappear);
		Main._model.StartBetState.add(appear);
		Main._model.EndBetState.add(disappear);
		Main._model.OpenState.add(disappear);
		Main._model.EndRoundState.add(disappear);		
		
		_timer = new FlxTimer();
		disappear(1);
		//Main._model.adjust_item.dispatch(_zone);
	}
	
	private function appear(s:Dynamic):Void
	{		
		_zone.revive();
		
		//Std.parseInt
		_timer.start(1, timer_count, Main._model._remain_time);
	}
	
	private function timer_count(timer:FlxTimer):Void
	{		
		_ten.revive();
		_one.revive();
		var time_str:String =  Model.Format(timer.loopsLeft, 2);		
		
		var ten:String = time_str.substr(0, 1);
		var one:String = time_str.substr(1, 1);
		
		_ten.loadGraphic("assets/images/share/timer_num/timer_" + ten + ".png");
		_one.loadGraphic("assets/images/share/timer_num/timer_" + one + ".png");
		
		if ( timer.loopsLeft == 0)
		{			
			disappear(1);
		}
	}
	
	private function disappear(s:Dynamic):Void
	{		
		_zone.kill();
		_ten.kill();
		_one.kill();
		_timer.cancel();
	}
	
}