package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import model.Model;

import flixel.util.FlxColor;
import flixel.input.FlxInput;

import EReg;


class Coin extends FlxTypedGroup<FlxSprite>
{
	private var _coin:Btn;
	private var _coin2:Btn;
	private var _coin3:Btn;
	private var _coin4:Btn;
	private var _coin5:Btn;
	
	private var _pre_select_idx:Int = -1;
	
	private var _bet:FlxSprite;	
	private var _bet2:FlxSprite;	
	private var _bet3:FlxSprite;	
	private var _bet4:FlxSprite;	
	private var _bet5:FlxSprite;
	private var _bet6:FlxSprite;
	
	public function new() 
	{
		super();		
		
		_coin = new Btn(514, 935,0, AssetPaths.five_1__png, onDown);
		add(_coin);
		
		_coin2 = new Btn(697, 935,1, AssetPaths.fh_1__png, onDown);
		add(_coin2);
		
		_coin3 = new Btn(880, 935,2, AssetPaths.ot_1__png, onDown);
		add(_coin3);
		
		_coin4 = new Btn(1063, 935,3, AssetPaths.ft_1__png, onDown);
		add(_coin4);
		
		_coin5 = new Btn(1246, 935,4, AssetPaths.tt_1__png, onDown);
		add(_coin5);
		
		
		
		_bet = new FlxSprite(1214,555).loadGraphic(AssetPaths.betframe_bg__png);
		_bet2 = new FlxSprite(486,559).loadGraphic(AssetPaths.betframe_bg__png);
		_bet3 = new FlxSprite(847,715).loadGraphic(AssetPaths.betframe_bg__png);
		_bet4 = new FlxSprite(1577,617).loadGraphic(AssetPaths.betframe_bg__png);
		_bet5 = new FlxSprite(131,617).loadGraphic(AssetPaths.betframe_bg__png);
		_bet6 = new FlxSprite(851,510).loadGraphic(AssetPaths.betframe_bg__png);
		
		add(_bet);
		add(_bet2);
		add(_bet3);
		add(_bet4);
		add(_bet5);
		add(_bet6);
		
		disappear(1);
		
		//event
		Main._model.NewRoundState.add(disappear);
		Main._model.StartBetState.add(appear);
		Main._model.EndBetState.add(disappear);
		Main._model.OpenState.add(disappear);
		Main._model.EndRoundState.add(disappear);
		
		//Main._model.adjust_item.dispatch(_bet6);
		
		
	}
	
	private function appear(s:Dynamic):Void
	{
		Main._model._coin_select_idx = 2;
		_pre_select_idx = -1;
		_coin.revive();
		_coin2.revive();
		_coin3.revive();
		_coin4.revive();
		_coin5.revive();
		
		_bet.revive();
		_bet2.revive();		
		_bet3.revive();		
		_bet4.revive();		
		_bet5.revive();	
		_bet6.revive();	
	}
	
	private function disappear(s:Dynamic):Void
	{		
		_coin.kill();
		_coin2.kill();
		_coin3.kill();
		_coin4.kill();
		_coin5.kill();
		
		_bet.kill();
		_bet2.kill();		
		_bet3.kill();		
		_bet4.kill();		
		_bet5.kill();	
		_bet6.kill();	
	}
	
	private function onDown(Sprite:Btn)
	{
		Main._model._coin_select_idx = Sprite._id;
		if ( _pre_select_idx == -1)
		{
			_pre_select_idx = Sprite._id;		
		}
		else 
		{
			if ( _pre_select_idx == Sprite._id) return;
			
			//recover origin btn	
			var or_st:String = "";
			var my_r = ~/-3/;
			var or_st = "";
			if ( _pre_select_idx == 0) 
			{
				or_st = _coin._name;
				or_st = my_r.replace(or_st, "-1");
				_coin.loadGraphic(or_st);
			}
			if ( _pre_select_idx == 1) 
			{
				or_st = _coin._name;
				or_st = my_r.replace(or_st, "-1");
				_coin2.loadGraphic(or_st);
			}
			if ( _pre_select_idx == 2) 
			{
				or_st = _coin._name;
				or_st = my_r.replace(or_st, "-1");
				_coin3.loadGraphic(or_st);
			}
			if ( _pre_select_idx == 3) 
			{
				or_st = _coin._name;
				or_st = my_r.replace(or_st, "-1");
				_coin4.loadGraphic(or_st);
			}
			if ( _pre_select_idx == 4) 
			{
				or_st = _coin._name;
				or_st = my_r.replace(or_st, "-1");
				_coin5.loadGraphic(or_st);
			}			
		}
		
		
		var st:String = Sprite._name;
		var r = ~/-1/;		
		st = r.replace(st, "-3");
		
		if ( Sprite._id == 0) _coin.loadGraphic(st);
		if ( Sprite._id == 1) _coin2.loadGraphic(st);
		if ( Sprite._id == 2) _coin3.loadGraphic(st);
		if ( Sprite._id == 3) _coin4.loadGraphic(st);
		if ( Sprite._id == 4) _coin5.loadGraphic(st);
		
	}	
	
}