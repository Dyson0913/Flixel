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
		creat_bet_amount(444, 179, _prob_text);
		
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
		
		prob_update(_prob_text, Main._model._bigwin_prob);
		
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
			item.text = Std.string(data[i]+"%");		
			i++;
		}		
	}
	
	private function creat_bet_amount(x:Float,y:Float,target:FlxGroup):Void
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