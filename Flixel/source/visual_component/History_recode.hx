package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxBasic;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import model.Model;

import flixel.util.FlxColor;



class History_recode extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;
		
	private var _history_ball:Array<FlxSprite>;
	private var _ball_group:FlxGroup;	
	
	private var _history_t:Array<FlxText>;
	private var _history_text:FlxGroup;
	
	
	public function new() 
	{
		super();		
		
		_zone = new FlxSprite(1291, 128).loadGraphic(AssetPaths.history__png);
		_zone.antialiasing = true;
		add(_zone);		
		
		_history_ball = new Array<FlxSprite>();
		_ball_group =  new FlxGroup();
		
		_history_t = new Array<FlxText>();
		_history_text = new FlxGroup();
		
		var RowCnt:Int = 10;		
		var ColumnCnt:Int = 6;		
		for (i in 0...(60))
		{
			//colu
			var x:Float = 1299 + ( Math.floor(i / ColumnCnt) * 57);	
			var y:Float = 137 + (i % ColumnCnt * 48);
			
			//row
			//var x:Float = 1294 + (i % RowCnt * 57) ;			
			//var y:Float = 124 + Math.floor(i / RowCnt) * 48;
			
			var card:FlxSprite = new FlxSprite(x, y).loadGraphic(AssetPaths.ball_none__png);			
			card.antialiasing = true;
			add(card);
			_history_ball.push(card);			
			_ball_group.add(card);
			
			var _credit:FlxText = new FlxText(x-1,y-4, 50, "", 40,false);			
			Model.font_format(_credit, FlxColor.WHITE, "center");
			add(_credit);			
			_history_t.push(_credit);
			_history_text.add(_credit);
		}
		
		
		
		
		//event
		Main._model.NewRoundState.add(appear);
		Main._model.StartBetState.add(appear);
		Main._model.EndBetState.add(disappear);
		Main._model.OpenState.add(disappear);
		Main._model.EndRoundState.add(disappear);
		
		disappear(1);
			
	}
	
	private function appear(s:Dynamic):Void
	{		
		_zone.revive();
		_ball_group.revive();
		_history_text.revive();
		
		var history:Array<String> = Main._model._recode_hisotry;				
		var RowCnt:Int = 10;
		var ColumnCnt:Int = 6;
		for (i in 0...(history.length))
		{
			var str:Dynamic = Main._model._recode_hisotry[i];
			//FlxG.log.add(str);
			var sp:FlxSprite =  _history_ball[i];
			var point:FlxText = _history_t[i];
			
			//row
			//var x:Float = 1294 + (i % RowCnt * 57) ;			
			//var y:Float = 124 + Math.floor(i / RowCnt) * 48;
			
			//colu
			var x:Float = 1299 + ( Math.floor(i / ColumnCnt) * 57);	
			var y:Float = 137+ (i % ColumnCnt * 48);
			
			point.reset(x-1, y-4);
			//point.setFormat(AssetPaths.arial_0__ttf, 40, FlxColor.WHITE, "center");
			if ( str.winner == "BetBWPlayer") 
			{
				sp.loadGraphic(AssetPaths.b_ball__png);
				point.text = str.point;
			}
			else if ( str.winner == "BetBWBanker") 
			{
				sp.loadGraphic(AssetPaths.r_ball__png);	
				point.text = str.point;
			}
			else if ( str.winner == "None") 
			{
				sp.loadGraphic(AssetPaths.g_ball__png);
				point.text = str.point;
			}
			else
			{
				//sp
				sp.loadGraphic(AssetPaths.y_ball__png);
				point.reset(x, y +12);
				//point.setFormat(AssetPaths.arial_0__ttf, 15, FlxColor.BLACK, "center");
				
				var s:String = "";
				if ( str.winner == "WSBWRoyalFlush") s = "RTF";
				else if ( str.winner == "WSBWStraightFlush") s = "STF";
				else if ( str.winner == "WSBWFourOfAKind") s = "4K";
				else if ( str.winner == "WSBWFullHouse") s = "FUH";
				else if ( str.winner == "WSBWFlush") s = "FLU";
				else if ( str.winner == "WSBWStraight") s = "STR";
				
				point.text = s;
			}
		}
		
		
		
		
	}	
	
	private function disappear(s:Dynamic):Void
	{		
		_zone.kill();
		_ball_group.kill();
		_history_text.kill();
	}
	
}