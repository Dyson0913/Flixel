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



class Prob_panel extends FlxTypedGroup<FlxSprite>
{
	//private var _zone:FlxSprite;
	//private var _zone2:FlxSprite;
	
	private var _prob_text:FlxGroup;
	
	public function new() 
	{
		super();
		
		_prob_text = new FlxGroup();
		creat_prob_amount(444, 179, _prob_text);
		
		//event
		Main._model.NewRoundState.add(disappear);
		Main._model.StartBetState.add(disappear);
		Main._model.EndBetState.add(appear);
		Main._model.OpenState.add(appear);
		Main._model.EndRoundState.add(disappear);
		
		//Main._model.adjust_item.dispatch(_prob_text.getFirstAlive());
	}
	
	private function appear(s:Dynamic):Void
	{			
		_prob_text.revive();
		
		//todo handle prob
		var adjust_data:Array<Float> = sin_ki_formula_by_dyson(Main._model._bigwin_prob);
		FlxG.log.add("adjust "+adjust_data);
		prob_update(_prob_text, adjust_data);
		
	}
	
	private function disappear(s:Dynamic):Void
	{
		_prob_text.kill();
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
	
	private function creat_prob_amount(x:Float,y:Float,target:FlxGroup):Void
	{
		var ColumnCnt:Int = 10;		
		for (i in 0...(6))
		{
			var x:Float = x;
			
			var y:Float = y - (i % ColumnCnt * - 52);
			
			var text = new FlxText(x, y, 170, "", 30, true);
			if ( i == 6) text.setFormat(AssetPaths.arial_0__ttf, text.size, FlxColor.YELLOW, "right");			
			else text.setFormat(AssetPaths.arial_0__ttf, text.size, FlxColor.WHITE, "right");			
			add(text);			
			target.add(text);			
		}
	}
	
	
}