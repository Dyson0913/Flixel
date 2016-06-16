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
	
	private var _bet_amount:FlxGroup;	
	
	public function new() 
	{
		super();
		
		_zone = new FlxSprite(1290, 121).loadGraphic(AssetPaths.settle__png);
		_zone.antialiasing = true;
		add(_zone);
		_zone.kill();
		
		_zone2 = new FlxSprite(1770, 120).loadGraphic(AssetPaths.settle_point__png);
		_zone2.antialiasing = true;
		add(_zone2);
		_zone2.kill();
		
		_bet_amount = new FlxGroup();
		creat_bet_amount(1488, 159, _bet_amount);
		
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
		
		coin_update(_bet_amount, Main._model._zone_comfirm_bet);
	}
	
	private function disappear(s:Dynamic):Void
	{		
		_zone.kill();
		_zone2.kill();
	}
	
	private function coin_update(target:FlxGroup,data:Array<Float>):Void
	{		
		var i:Int = 0;
		var total:Float = 0;		
		for ( mem in target)
		{
			var item:FlxText = cast(mem, FlxText);		
			total += data[i];
			if ( i == 6) 
			{				
				item.text = Std.string(total);
			}
			else item.text = Std.string(data[i]);
			FlxG.log.add("coin_update " + data[i]);
			FlxG.log.add("total " + total);
			
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
			
			var text = new FlxText(x, y, 170, "", 30, true);
			if ( i == 6) text.setFormat(AssetPaths.arial_0__ttf, text.size, FlxColor.YELLOW, "right");			
			else text.setFormat(AssetPaths.arial_0__ttf, text.size, FlxColor.WHITE, "right");			
			add(text);			
			target.add(text);			
		}
	}
	
	
}