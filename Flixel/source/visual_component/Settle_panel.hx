package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import model.Model;

import flixel.util.FlxColor;



class Settle_panel extends FlxTypedGroup<FlxSprite>
{
	private var _settle_title:FlxSprite;
	private var _bet_amount_title:FlxSprite;
	
	private var _win_title:FlxSprite;
	private var _timer_effect:FlxTimer;
	
	
	private var _bet_amount:FlxGroup;	
	private var _settle_amount:FlxGroup;	
	
	public function new() 
	{
		super();
		
		_settle_title = new FlxSprite(1290, 121).loadGraphic(AssetPaths.settle__png);
		_settle_title.antialiasing = true;
		add(_settle_title);
		
		
		_bet_amount_title = new FlxSprite(1770, 120).loadGraphic(AssetPaths.settle_point__png);
		_bet_amount_title.antialiasing = true;
		add(_bet_amount_title);
		
		
		_win_title = new FlxSprite(1140, 420).loadGraphic(AssetPaths.win_1__png);
		_win_title.antialiasing = true;
		_win_title.scale.set(0.7,0.7);
		add(_win_title);
		
		_bet_amount = new FlxGroup();
		creat_bet_amount(1488, 159, _bet_amount);
		
		_settle_amount = new FlxGroup();
		creat_bet_amount(1658, 159, _settle_amount);
		
		//event
		Main._model.NewRoundState.add(disappear);
		Main._model.StartBetState.add(disappear);
		Main._model.EndBetState.add(appear);
		Main._model.OpenState.add(appear);
		Main._model.EndRoundState.add(appear);
		
		
		_timer_effect =  new FlxTimer();
		disappear(1);
		
		//Main._model.adjust_item.dispatch(_win_title);
		
		
	}
	
	private function appear(s:Dynamic):Void
	{		
		_settle_title.revive();
		
		_bet_amount.revive();
		
		
		amount_update(_bet_amount, Main._model._zone_comfirm_bet);
		
		if ( Main._model._game_state == "EndRoundState")
		{
			_bet_amount_title.revive();
			_settle_amount.revive();
			
			FlxG.log.add(Main._model._zone_settle_bet);
			_win_title.revive();
			_win_title.scale.set(0.7, 0.7);
			_win_title.y = 420;
			
			if ( Main._model._zone_settle_bet[0] != 0)
			{
				_win_title.x = 1140;
				//_timer_effect.start(0.2, effect, 20);
			}
			else if ( Main._model._zone_settle_bet[1] != 0)
			{
				_win_title.x = 70;
				//_timer_effect.start(0.2, effect, 20);
			}
			else
			{
				//tie				
				_win_title.x = 797;
				_win_title.y = 457;
				//_win_title.scale.set(1, 1);				
			}
			
			
			
			amount_update(_settle_amount, Main._model._zone_settle_bet);
		}
	}
	
	private function disappear(s:Dynamic):Void
	{		
		_settle_title.kill();
		_bet_amount_title.kill();
		
		_bet_amount.kill();
		_settle_amount.kill();
		
		_win_title.kill();	
		_timer_effect.cancel();
		
		Main._model._zone_settle_bet.splice(0, Main._model._zone_settle_bet.length);
	}
	
	private function effect(timer:FlxTimer):Void
	{		
		if ( timer.loopsLeft % 2 == 0) _win_title.loadGraphic(AssetPaths.win_2__png);
		else _win_title.loadGraphic(AssetPaths.win_1__png);	
	}
	
	private function amount_update(target:FlxGroup,data:Array<Float>):Void
	{		
		var i:Int = 0;
		var total:Float = 0;		
		for ( mem in target)
		{
			var item:FlxText = cast(mem, FlxText);			
			if ( i == 6) 
			{								
				item.text = Std.string(total);
				return;
			}
			else item.text = Std.string(data[i]);
			
			total += data[i];			
			i++;
		}		
	}
	
	private function creat_bet_amount(x:Float,y:Float,target:FlxGroup):Void
	{
		var ColumnCnt:Int = 10;
		var last_dis:Int = 0;
		for (i in 0...(7))
		{
			var x:Float = x;
			if ( i == 6) last_dis = 10;
			var y:Float = y - (i % ColumnCnt * - 35) + last_dis;
			
			var text = new FlxText(x, y, 170, "", 30, false);
			if ( i == 6) Model.font_format(text, FlxColor.YELLOW, "right");
			else Model.font_format(text, FlxColor.WHITE, "right");
			add(text);			
			target.add(text);			
		}
	}
	
	
}