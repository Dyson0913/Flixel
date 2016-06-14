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
		
		//default select
		var st:String =_coin3._name;
		var r = ~/-1/;		
		st = r.replace(st, "-3");
		_coin3.loadGraphic(st);
		
		_coin.revive();
		_coin2.revive();
		_coin3.revive();
		_coin4.revive();
		_coin5.revive();
		
	}
	
	private function disappear(s:Dynamic):Void
	{		
		_coin.kill();
		_coin2.kill();
		_coin3.kill();
		_coin4.kill();
		_coin5.kill();		
	}
	
	private function onDown(Sprite:Btn)
	{
		Main._model._coin_select_idx = Sprite._id;
		
		if ( _pre_select_idx == Sprite._id)
		{			
			return;	
		}
		else 
		{		
			if ( _pre_select_idx != -1)
			{
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
					or_st = _coin2._name;
					or_st = my_r.replace(or_st, "-1");
					_coin2.loadGraphic(or_st);
				}
				if ( _pre_select_idx == 2) 
				{
					or_st = _coin3._name;
					or_st = my_r.replace(or_st, "-1");
					_coin3.loadGraphic(or_st);
				}
				if ( _pre_select_idx == 3) 
				{
					or_st = _coin4._name;
					or_st = my_r.replace(or_st, "-1");
					_coin4.loadGraphic(or_st);
				}
				if ( _pre_select_idx == 4) 
				{
					or_st = _coin5._name;
					or_st = my_r.replace(or_st, "-1");
					_coin5.loadGraphic(or_st);
				}
			}
			
			
		}
		
		_pre_select_idx = Sprite._id;
		
		
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