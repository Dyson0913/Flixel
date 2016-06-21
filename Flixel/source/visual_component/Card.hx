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
import flixel.tweens.FlxTween;
import openfl.geom.Point;


class Card extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;		
	private var _poker_light:FlxSprite;
	private var _poker_po_data:Array<Point>;
	
	private var _player_sp:FlxSprite;
	private var _banker_sp:FlxSprite;
	private var _player_point:FlxText;
	private var _banker_point:FlxText;
	
	private var _poker_mi_back:FlxSprite;
	private var _poker_mi_Target:FlxSprite;
	private var _mi_poker_or_not:Int;
	
	private var _poker:Array<FlxSprite>;
	
	private var _Cards:FlxGroup;
	private var _flip_card:FlxSprite;
	private var _flip_idx:Int;
	
	public function new() 
	{
		super();
		
		_zone = new FlxSprite(320,546).loadGraphic(AssetPaths.open_card_bg__png);
		add(_zone);
		
		_poker_light = new FlxSprite(207,621).loadGraphic(AssetPaths.dk_poker_light__png);
		add(_poker_light);
		_poker_po_data = new Array<Point>();
		_poker_po_data.push(new Point(207, 621));
		_poker_po_data.push(new Point(414, 621));
		_poker_po_data.push(new Point(750, 621));
		_poker_po_data.push(new Point(957, 621));
		_poker_po_data.push(new Point(1293, 621));
		_poker_po_data.push(new Point(1500, 621));
		
		_player_point = new FlxText(316,558 , 170, "", 40, true);		
		_player_point.setFormat(AssetPaths.arial_0__ttf, _player_point.size, 0xffdb94, "center");			
		add(_player_point);
		
		_player_sp = new FlxSprite(414, 562, AssetPaths.point_text__png);
		add(_player_sp);		
		
		_banker_point = new FlxText(1400,558 , 170, "", 40, true);		
		_banker_point.setFormat(AssetPaths.arial_0__ttf, _banker_point.size, 0xffdb94, "center");			
		add(_banker_point);
		
		_banker_sp = new FlxSprite(1500, 562, AssetPaths.point_text__png);
		add(_banker_sp);
		
		//event
		Main._model.NewRoundState.add(disappear);
		Main._model.StartBetState.add(disappear);
		Main._model.EndBetState.add(appear);
		Main._model.OpenState.add(appear);
		Main._model.EndRoundState.add(appear);
		
		_Cards = new FlxGroup();
		_poker = new Array<FlxSprite>();
		
		var RowCnt:Int = 10;
		var gap:Int = 0;
		for (i in 0...(6))
		{
			if (i % 2 == 0 && i != 0) 
			{
				gap += 130;			
			}
			var x:Float = 80 + (i % RowCnt * 207) + gap;			
			var y:Float = 435 + Math.floor(i / RowCnt) * 466;
			
			var card:FlxSprite = new FlxSprite(x, y).loadGraphic(AssetPaths.poker_back__png);
			//var card:FlxSprite = new FlxSprite(x, y).loadGraphic("assets/images/share/poker/" + (i+1) + ".png");
			card.scale.set(0.39, 0.39);
			card.antialiasing = true;
			add(card);
			_poker.push(card);
			_Cards.add(card);
		}
		
		//to 808,214
		_poker_mi_Target = new FlxSprite(648, 214,AssetPaths.ball_none__png);
		add(_poker_mi_Target);
		
		_poker_mi_back = new FlxSprite(648, 214, AssetPaths.poker_back__png);
		add(_poker_mi_back);
		
		
		
		disappear(1);
		
		Main._model.adjust_item.dispatch(_poker_mi_Target);
	}
	
	private function appear(s:Dynamic):Void
	{		
		_zone.revive();
		_Cards.revive();
		
		if ( Main._model._game_state == "EndRoundState") _poker_light.kill();
		
		FlxG.log.add("dk poker b" + Main._model._bigwin_banker_card);
		FlxG.log.add("dk poker p" + Main._model._bigwin_player_card);
		FlxG.log.add("dk poker r" + Main._model._bigwin_river_card);
		
		var banker_poker:Array<String> = Main._model._bigwin_banker_card;
		var _player_card:Array<String> = Main._model._bigwin_player_card;
		var _river_card:Array<String> = Main._model._bigwin_river_card;
		
		//static
		if ( banker_poker.length != 0 )
		{	
			var len:Int = 0;
			if ( Main._model._bigwin_opencard_type == "Banker")  len = 1;
			
			for (i in 0...(banker_poker.length -len))
			{
				var idx:Int = poker_trans( banker_poker[i]);
				poker_change(_poker[i + 4], idx);
			}			
		}
		
		if ( _player_card.length != 0 )
		{
			var len:Int = 0;
			if ( Main._model._bigwin_opencard_type == "Player")  len = 1;
			
			for (i in 0...(_player_card.length -len ))
			{
				var idx:Int = poker_trans( _player_card[i]);
				poker_change(_poker[i], idx);
			}			
		}
		
		if ( _river_card.length != 0)
		{
			for (i in 0...(_river_card.length))
			{
				var idx:Int = poker_trans( _river_card[i]);
				poker_change(_poker[i+2], idx);
			}			
		}
		
		//flip type
		if ( Main._model._bigwin_opencard_type == "Banker")
		{
			var idx:Int = poker_trans( banker_poker[banker_poker.length - 1]);
			_flip_idx = idx;
			if (banker_poker.length == 1)
			{
				poker_turn(_poker[4]);
				light_poker(4);
			}
			if (banker_poker.length == 2)
			{				
				light_poker(5);
				_mi_poker_or_not = 2;
				mi_poker();
			}
		}
		if (  Main._model._bigwin_opencard_type  == "Player")
		{
			var idx:Int = poker_trans(_player_card[_player_card.length - 1]);
			_flip_idx = idx;
			if (_player_card.length == 1)
			{
				poker_turn(_poker[0]);
				light_poker(0);
			}
			if (_player_card.length == 2)
			{				
				light_poker(1);
				_mi_poker_or_not = 1;
				mi_poker();
				
			}
		}
		if (  Main._model._bigwin_opencard_type  == "River")
		{
			var idx:Int = poker_trans(_river_card[_river_card.length - 1]);
			_flip_idx = idx;
			if (_river_card.length == 1)
			{
				poker_turn(_poker[2]);
				light_poker(2);
			}
			if (_river_card.length == 2)
			{
				poker_turn(_poker[3]);
				light_poker(3);
			}
		}
	}
	
	private function disappear(s:Dynamic):Void
	{		
		_zone.kill();
		_Cards.kill();
		_poker_light.kill();
		
		_player_sp.kill();
		_banker_sp.kill();
		_player_point.kill();
		_banker_point.kill();
		
		_poker_mi_back.kill();
		_poker_mi_Target.kill();
		
		_mi_poker_or_not = -1;
		
		Main._model._bigwin_banker_card.splice(0, Main._model._bigwin_banker_card.length);
		Main._model._bigwin_player_card.splice(0, Main._model._bigwin_player_card.length);
		Main._model._bigwin_river_card.splice(0, Main._model._bigwin_river_card.length);
		
		FlxG.log.add("poker reload");
		//for (i in 0...(6))
		//{
			//_poker[i].loadGraphic(AssetPaths.poker_back__png);
		//}
		
	}
	
	private function light_poker(num:Int):Void
	{
		_poker_light.revive();
		var p:Point = _poker_po_data[num];
		_poker_light.x = p.x;
		_poker_light.y = p.y;
	}
	
	private function mi_poker():Void
	{
		_poker_mi_back.revive();		
		_poker_mi_Target.revive();
		
		_poker_mi_Target.loadGraphic("assets/images/share/poker/" + (_flip_idx) + ".png");
		FlxTween.tween(_poker_mi_Target, { x: _poker_mi_back.x +160 }, 1, { onComplete: mi_poker_ok });
	}
	
	private function mi_poker_ok(Tween:FlxTween):Void
	{
		FlxTween.tween(_poker_mi_Target, { x: _poker_mi_Target.x }, 1, { onComplete: mi_poker_hide });
	}
	
	private function mi_poker_hide(Tween:FlxTween):Void
	{
		_poker_mi_back.kill();
		_poker_mi_Target.kill();
		_poker_mi_Target.x = _poker_mi_back.x;
		_poker_mi_Target.y = _poker_mi_back.y;
		
		
		//show point
		if ( _mi_poker_or_not == 1) 
		{
			poker_turn(_poker[1]);
			player_point();			
		}
		if ( _mi_poker_or_not == 2)
		{
			banker_point();
			poker_turn(_poker[5]);
		}
		
		_mi_poker_or_not = -1;
	}
	
	private function player_point():Void
	{
		_player_sp.revive();
		_player_point.revive();		
		_player_point.text = get_Point(Main._model._bigwin_player_card);		
	}
	
	private function banker_point():Void
	{		
		_banker_sp.revive();
		_banker_point.revive();
		_banker_point.text = get_Point(Main._model._bigwin_banker_card);
	}
	
	public function get_Point(poke:Array<String>):String
	{		
		var total_point:Int = 0;
		for (i in 0...(poke.length))
		{
			total_point += get_Baccarat_Point(poke[i]);			
		}
		total_point %= 10;
		 
		return Std.string(total_point);
	}
	
	public function get_Baccarat_Point(poke:String):Int
	{
		var point:String = poke.substr(0, 1);
		
		if ( point == "i" ||  point == "j" || point == "q" || point == "k") return 10;			
		return Std.parseInt(point);
	}
	
	private function poker_change(card:FlxSprite,idx:Int):Void
	{
		card.loadGraphic("assets/images/share/poker/" + (idx) + ".png");
	}
	
	private function poker_turn(card:FlxSprite):Void
	{
		_flip_card = card;
        FlxTween.tween(card.scale, { x: 0 }, 0.2 / 2, { onComplete: pickCard });
	}
	
	private function pickCard(Tween:FlxTween):Void
	{		
		_flip_card.loadGraphic("assets/images/share/poker/" + (_flip_idx) + ".png");
		FlxTween.tween(_flip_card.scale, { x: 0.39 }, 0.2 / 2);
	}
	
	private function poker_trans(poker:String):Int
	{
		var point:String = poker.substr(0, 1);
		var color:String = poker.substr(1, 1);
		
		var point_idx:Int = 0;		
		if ( color == "h") point_idx = 13;
		if ( color == "d") point_idx = 26;
		if ( color == "c") point_idx = 39;
		
		if ( point == "i") point_idx += 10;
		else if ( point == "j") point_idx += 11;
		else if ( point == "q") point_idx += 12;
		else if ( point == "k") point_idx += 13;
		else point_idx += Std.parseInt(point);
		
		return point_idx;
	}
}