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
	private var _zone:FlxSprite;	
	private var _zone2:FlxSprite;	
	private var _zone3:FlxSprite;	
	private var _zone4:FlxSprite;	
	private var _zone5:FlxSprite;
	
	private var _coin:Btn;
	
	private var _bet:FlxSprite;	
	private var _bet2:FlxSprite;	
	private var _bet3:FlxSprite;	
	private var _bet4:FlxSprite;	
	private var _bet5:FlxSprite;
	private var _bet6:FlxSprite;
	
	public function new() 
	{
		super();		
		
		_coin = new Btn(514, 935, AssetPaths.five_1__png, onDown, null, onOver, onOut);
		add(_coin);
		
		//_zone = new FlxSprite(514,935).loadGraphic(AssetPaths.five_1__png);
		_zone2 = new FlxSprite(697,935).loadGraphic(AssetPaths.fh_1__png);
		_zone3 = new FlxSprite(880,935).loadGraphic(AssetPaths.ot_1__png);
		_zone4 = new FlxSprite(1063,935).loadGraphic(AssetPaths.ft_1__png);
		_zone5 = new FlxSprite(1246,935).loadGraphic(AssetPaths.tt_1__png);
	
		_bet = new FlxSprite(1214,555).loadGraphic(AssetPaths.betframe_bg__png);
		_bet2 = new FlxSprite(486,559).loadGraphic(AssetPaths.betframe_bg__png);
		_bet3 = new FlxSprite(847,715).loadGraphic(AssetPaths.betframe_bg__png);
		_bet4 = new FlxSprite(1577,617).loadGraphic(AssetPaths.betframe_bg__png);
		_bet5 = new FlxSprite(131,617).loadGraphic(AssetPaths.betframe_bg__png);
		_bet6 = new FlxSprite(851,510).loadGraphic(AssetPaths.betframe_bg__png);
		
		//add(_zone);
		add(_zone2);
		add(_zone3);
		add(_zone4);
		add(_zone5);
		
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
		_coin.revive();
		//_zone.revive();
		_zone2.revive();
		_zone3.revive();
		_zone4.revive();
		_zone5.revive();
		
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
		
		_zone2.kill();
		_zone3.kill();
		_zone4.kill();
		_zone5.kill();
		
		_bet.kill();
		_bet2.kill();		
		_bet3.kill();		
		_bet4.kill();		
		_bet5.kill();	
		_bet6.kill();	
	}
	
	private function onDown(Sprite:Btn)
	{
		FlxG.log.add("Sprite " + Sprite._name);
		var st:String = Sprite._name;
		var r = ~/-1/;
		
		st = r.replace(st, "-2");
		FlxG.log.add("match =" +st);
		
	}
	
	private function onUp(Sprite:FlxSprite)
	{
		
	}
	
	private function onOver(Sprite:FlxSprite) 
	{
		
	}
	
	private function onOut(Sprite:FlxSprite)
	{
		
	}
	
}