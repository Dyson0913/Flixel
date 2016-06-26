package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import model.Model;

import flixel.util.FlxColor;



class Prob_panel extends FlxTypedGroup<FlxSprite>
{
	private var _prob_bar:FlxGroup;
	private var _prob_text:FlxGroup;
	
	
	public function new() 
	{
		super();
		
		_prob_bar = new FlxGroup();
		creat_prob_bar(215, 187, _prob_bar);
		
		_prob_text = new FlxGroup();
		creat_prob_amount(444, 179, _prob_text);
		
		//event
		Main._model.NewRoundState.add(disappear);
		Main._model.StartBetState.add(disappear);
		Main._model.EndBetState.add(appear);
		Main._model.OpenState.add(appear);
		Main._model.EndRoundState.add(disappear);
		
		//Main._model.adjust_item.dispatch(_prob_bar);
	}
	
	private function appear(s:Dynamic):Void
	{
		_prob_bar.revive();
		_prob_text.revive();
		
		var adjust_data:Array<Float> = sin_ki_formula_by_dyson(Main._model._bigwin_prob);
		
		prob_update(_prob_text, adjust_data);
		prob_bar_update(_prob_bar, adjust_data);		
	}
	
	private function disappear(s:Dynamic):Void
	{
		_prob_bar.kill();
		_prob_text.kill();
	}
	
	private function creat_prob_bar(x:Float,y:Float,target:FlxGroup):Void
	{
		var ColumnCnt:Int = 10;
		for (i in 0...(6))
		{
			var x:Float = x;			
			var y:Float = y - (i % ColumnCnt * - 51.5);
			
			var _bar:FlxBar = new FlxBar(x, y, LEFT_TO_RIGHT, 267, 24);
			_bar.createImageBar(null,AssetPaths.prob_yellow_bar__png);
			_bar.value = 0;
			add(_bar);
			target.add(_bar);
		}
	}
	
	private function prob_bar_update(target:FlxGroup,data:Array<Float>):Void
	{		
		var i:Int = 0;
		for ( mem in target)
		{
			var item:FlxBar = cast(mem, FlxBar);
			data[i] *= Math.pow(10,2);
			var k:Float = Math.round(data[i]) / Math.pow(10, 2);			
			item.value = k;
			//item.updateFilledBar();
			i++;
		}
	}	
	
	private function prob_update(target:FlxGroup,data:Array<Float>):Void
	{		
		var i:Int = 0;
		for ( mem in target)
		{
			var item:FlxText = cast(mem, FlxText);
			data[i] *= Math.pow(10,2);
			var k:Float = Math.round(data[i]) / Math.pow(10, 2);			
			k *= 100;
			item.text = Std.string(k+"%");	
			i++;
		}
	}	
		
	private function creat_prob_amount(x:Float,y:Float,target:FlxGroup):Void
	{
		var ColumnCnt:Int = 10;		
		for (i in 0...(6))
		{
			var x:Float = x;			
			var y:Float = y - (i % ColumnCnt * - 52);
			
			var text = new FlxText(x, y, 170, "", 30, true);
			if ( i == 6) Model.font_format(text, FlxColor.YELLOW, "right");
			else Model.font_format(text, FlxColor.WHITE, "right");
			add(text);			
			target.add(text);			
		}
	}
	
	private function sin_ki_formula_by_dyson(data:Array<Float>):Array<Float>
	{
		var copy_data_of_prob:Array<Float> = data.copy();
		for (i in 0...(copy_data_of_prob.length))
		{
			copy_data_of_prob[i] *= 10000;
		}
		
		for (i in 0...(copy_data_of_prob.length))
		{
			copy_data_of_prob[i] = Math.sqrt(copy_data_of_prob[i]) *10;
		}
		
		var total:Float = 0;
		for (i in 0...(copy_data_of_prob.length))
		{
			copy_data_of_prob[i] = Math.sqrt(copy_data_of_prob[i]) * 10;
			total += copy_data_of_prob[i];
		}
		
		if ( total == 0) return copy_data_of_prob;
		
		for (i in 0...(copy_data_of_prob.length))
		{
			copy_data_of_prob[i] = copy_data_of_prob[i] / total;
		}
		
		//one kin match
		for (i in 0...(copy_data_of_prob.length))
		{
			if ( copy_data_of_prob[i] == 1 && total == 1000) return copy_data_of_prob;
		}
		
		for (i in 0...(copy_data_of_prob.length))
		{
			if ( copy_data_of_prob[i] != 0)
			{
				copy_data_of_prob[i] = Math.min(0.9,copy_data_of_prob[i]+0.3);
			}
		}		
		
		return copy_data_of_prob;		
	}
	
}