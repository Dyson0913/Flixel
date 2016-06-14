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
import flixel.util.FlxTimer;
import model.Model;

import flixel.util.FlxColor;
import flixel.input.FlxInput;


class Click_item extends FlxTypedGroup<FlxSprite>
{		
	private var _zone:Btn;	
	private var _zone2:Btn;	
	private var _zone3:Btn;	
	private var _zone4:Btn;	
	private var _zone5:Btn;	
	private var _zone6:Btn;	
	
	private var _bet:FlxSprite;	
	private var _bet2:FlxSprite;	
	private var _bet3:FlxSprite;	
	private var _bet4:FlxSprite;	
	private var _bet5:FlxSprite;
	private var _bet6:FlxSprite;
	
	
	
	private var _msgbg:FlxSprite;	
	private var _msgtie:FlxSprite;	
	
	private var _click_item:FlxGroup;
	
	private var _timer:FlxTimer;
	
	public function new() 
	{
		super();		
		
		_zone = new Btn(1116, 530,0, AssetPaths.banker_zone_1__png, onDown,onUp);		
		_zone2 = new Btn(334, 527,1, AssetPaths.player_zone_1__png, onDown,onUp);		
		_zone3 = new Btn(765, 687,2, AssetPaths.tie_1__png, onDown,onUp);		
		_zone4 = new Btn(1519, 583,3, AssetPaths.banker_pair_1__png, onDown,onUp);		
		_zone5 = new Btn(13, 587,4, AssetPaths.player_pair_1__png, onDown,onUp);		
		_zone6 = new Btn(779, 526,5, AssetPaths.sp__png, onDown,onUp);		
		
		add(_zone);
		add(_zone2);
		add(_zone3);
		add(_zone4);
		add(_zone5);
		add(_zone6);
		
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
		Main._model.NewRoundState.add(appear);
		Main._model.StartBetState.add(appear);
		Main._model.EndBetState.add(disappear);
		Main._model.OpenState.add(disappear);
		Main._model.EndRoundState.add(disappear);
		
		_timer = new FlxTimer();
	}
	
	private function appear(s:Dynamic):Void
	{		
		_zone.revive();
		_zone2.revive();
		_zone3.revive();
		_zone4.revive();
		_zone5.revive();
		_zone6.revive();
		
		//_bet.revive();
		//_bet2.revive();
		//_bet3.revive();
		//_bet4.revive();
		//_bet5.revive();
		//_bet6.revive();
		
		if ( Main._model._game_state == "StartBetState")
		{
			_timer.start(0.2, effect, 4);
		}
			
	}
	
	private function disappear(s:Dynamic):Void
	{
		FlxG.log.add("click item disappear ");
		_zone.kill();
		_zone2.kill();
		_zone3.kill();
		_zone4.kill();
		_zone5.kill();
		_zone6.kill();
		
		_bet.kill();
		_bet2.kill();
		_bet3.kill();
		_bet4.kill();
		_bet5.kill();
		_bet6.kill();
	}
	
	private function effect(timer:FlxTimer):Void
	{		
		if ( timer.loopsLeft % 2 == 0) flash_2();
		else flash();		
	}
	
	private function flash():Void
	{
		_zone.loadGraphic(AssetPaths.banker_zone_2__png);
		_zone2.loadGraphic(AssetPaths.player_zone_2__png);
		_zone3.loadGraphic(AssetPaths.tie_2__png);
		_zone4.loadGraphic(AssetPaths.banker_pair_2__png);
		_zone5.loadGraphic(AssetPaths.player_pair_2__png);
		_zone6.loadGraphic(AssetPaths.sp2__png);
	}
	
	private function flash_2():Void
	{
		_zone.loadGraphic(AssetPaths.banker_zone_1__png);
		_zone2.loadGraphic(AssetPaths.player_zone_1__png);
		_zone3.loadGraphic(AssetPaths.tie_1__png);
		_zone4.loadGraphic(AssetPaths.banker_pair_1__png);
		_zone5.loadGraphic(AssetPaths.player_pair_1__png);
		_zone6.loadGraphic(AssetPaths.sp__png);
	}
	
	
	private function onDown(Sprite:Btn)
	{
		if ( Main._model._game_state == "NewRoundState") return;
		
		var st:String = Sprite._name;
		var r = ~/_1/;		
		st = r.replace(st, "_2");
		
		if ( Sprite._id == 0) _zone.loadGraphic(st);
		if ( Sprite._id == 1) _zone2.loadGraphic(st);
		if ( Sprite._id == 2) _zone3.loadGraphic(st);
		if ( Sprite._id == 3) _zone4.loadGraphic(st);
		if ( Sprite._id == 4) _zone5.loadGraphic(st);
	}
	
	private function onUp(Sprite:Btn)
	{
		if ( Main._model._game_state == "NewRoundState") return;
		
		var st:String = Sprite._name;
		var r = ~/_2/;		
		st = r.replace(st, "_1");
		
		if ( Sprite._id == 0) _zone.loadGraphic(st);
		if ( Sprite._id == 1) _zone2.loadGraphic(st);
		if ( Sprite._id == 2) _zone3.loadGraphic(st);
		if ( Sprite._id == 3) _zone4.loadGraphic(st);
		if ( Sprite._id == 4) _zone5.loadGraphic(st);
	}
	
}