package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flash.display.Sprite;
import flixel.FlxBasic;
import flixel.FlxBasic.IFlxBasic;
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


class Bet_zone extends FlxTypedGroup<FlxSprite>
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
	
	private var _bet_amount:FlxText;
	private var _bet_amount2:FlxText;
	private var _bet_amount3:FlxText;
	private var _bet_amount4:FlxText;
	private var _bet_amount5:FlxText;
	private var _bet_amount6:FlxText;
	

	private var _statck:FlxGroup;
	private var _statck2:FlxGroup;
	private var _statck3:FlxGroup;
	private var _statck4:FlxGroup;
	private var _statck5:FlxGroup;
	private var _statck6:FlxGroup;
	
	private var _statck_res:Array<String>;
	private var _statck_res2:Array<String>;
	private var _statck_res3:Array<String>;
	private var _statck_res4:Array<String>;
	private var _statck_res5:Array<String>;
	private var _statck_res6:Array<String>;
	
	private var _high_pay:FlxSprite;
	
	private var _cancel:FlxSprite;
	private var _continue_bet:FlxSprite;
	private var _bet_cancel_timer:FlxTimer;
	private var _click_zone:Int;
	
	private var _timer_effect:FlxTimer;
	
	public function new() 
	{
		super();		
		
		_zone = new Btn(1116, 537,0, AssetPaths.banker_zone_1__png, onDown,onUp);		
		_zone2 = new Btn(334, 534,1, AssetPaths.player_zone_1__png, onDown,onUp);		
		_zone3 = new Btn(765, 692,2, AssetPaths.tie_1__png, onDown,onUp);		
		_zone4 = new Btn(1519, 588,3, AssetPaths.banker_pair_1__png, onDown,onUp);		
		_zone5 = new Btn(13, 592,4, AssetPaths.player_pair_1__png, onDown,onUp);		
		_zone6 = new Btn(779, 531,5, AssetPaths.sp_1__png, onDown,onUp);		
		
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
		
		_bet_amount = new FlxText(_bet.x + 29, _bet.y + 3, 170, "", 35, false);
		Model.font_format(_bet_amount, FlxColor.WHITE, "right");
		add(_bet_amount);
		
		_bet_amount2 = new FlxText(_bet2.x + 29, _bet2.y + 3, 170, "", 35, false);
		Model.font_format(_bet_amount2, FlxColor.WHITE, "right");
		add(_bet_amount2);
		
		_bet_amount3 = new FlxText(_bet3.x + 29, _bet3.y + 3, 170, "", 35, false);
		Model.font_format(_bet_amount3, FlxColor.WHITE, "right");
		add(_bet_amount3);
		
		_bet_amount4 = new FlxText(_bet4.x + 29, _bet4.y + 3, 170, "", 35, false);
		Model.font_format(_bet_amount4, FlxColor.WHITE, "right");
		add(_bet_amount4);
		
		_bet_amount5 = new FlxText(_bet5.x + 29, _bet5.y + 3, 170, "", 35, false);
		Model.font_format(_bet_amount5, FlxColor.WHITE, "right");
		add(_bet_amount5);
		
		_bet_amount6 = new FlxText(_bet6.x + 29, _bet6.y + 3, 170, "", 35, false);
		Model.font_format(_bet_amount6, FlxColor.WHITE, "right");
		add(_bet_amount6);
		
		_statck = new FlxGroup();
		_statck_res = new Array<String>();
		creat_stack(1266, 806,_statck,_statck_res);
		
		_statck2 = new FlxGroup();
		_statck_res2 = new Array<String>();
		creat_stack(492, 806, _statck2,_statck_res2);
		
		_statck3 = new FlxGroup();
		_statck_res3 = new Array<String>();
		creat_stack(981, 824, _statck3,_statck_res3);
		
		_statck4 =  new FlxGroup();
		_statck_res4 = new Array<String>();
		creat_stack(1633, 768, _statck4,_statck_res4);
		
		_statck5 =  new FlxGroup();
		_statck_res5 = new Array<String>();
		creat_stack(120, 768, _statck5,_statck_res5); 		
		
		_statck6 =  new FlxGroup();
		_statck_res6 = new Array<String>();
		creat_stack(881, 584, _statck6,_statck_res6); 		
		
		_high_pay = new FlxSprite(1010, 615, AssetPaths.dk_high_pay__png);
		add(_high_pay);
		
		_cancel = new Btn(1740, 962,0, AssetPaths.cancel_1__png, onCancelDown,onCancelUp);	
		add(_cancel);
		
		_continue_bet = new Btn(1570, 962, 0, AssetPaths.continue_bet_1__png, onContinueDown, onContinueUp);
		add(_continue_bet);
		
		_click_zone = -1;
		
		disappear(1);		
		
		//event
		Main._model.NewRoundState.add(appear);
		Main._model.StartBetState.add(appear);
		Main._model.EndBetState.add(disappear);
		Main._model.OpenState.add(disappear);
		Main._model.EndRoundState.add(disappear);
		
		_timer_effect = new FlxTimer();
		_bet_cancel_timer =  new FlxTimer();
		//Main._model.adjust_item.dispatch(_high_pay);
	}
	
	private function appear(s:Dynamic):Void
	{		
		_zone.revive();
		_zone2.revive();
		_zone3.revive();
		_zone4.revive();
		_zone5.revive();
		_zone6.revive();
		
		
		_statck.revive();
		_statck2.revive();
		_statck3.revive();
		_statck4.revive();
		_statck5.revive();
		_statck6.revive();
		
		_click_zone = -1;
		
		if ( Main._model._game_state == "NewRoundState")
		{			
			//Main._model.reset_model();
			coin_clean(_statck);
			coin_clean(_statck2);
			coin_clean(_statck3);
			coin_clean(_statck4);
			coin_clean(_statck5);
			coin_clean(_statck6);			
		}
		
		if ( Main._model._game_state == "StartBetState")
		{
			_timer_effect.start(0.2, effect, 4);
		}
		
	}
	
	private function disappear(s:Dynamic):Void
	{
		
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
		
		//_bet_amount.text = "";
		//_bet_amount2.text = "";
		//_bet_amount3.text = "";
		//_bet_amount4.text = "";
		//_bet_amount5.text = "";
		//_bet_amount6.text = "";
		
		_statck.kill();
		_statck2.kill();
		_statck3.kill();
		_statck4.kill();
		_statck5.kill();
		_statck6.kill();
		
		_cancel.kill();
		_continue_bet.kill();
		
		_high_pay.kill();		
		
	}
	
	private function effect(timer:FlxTimer):Void
	{		
		if ( timer.loopsLeft % 2 == 0) 
		{
			flash_2();
			if ( timer.loopsLeft == 0)
			{
				_high_pay.revive();
			}
		}
		else flash();		
	}
	
	private function flash():Void
	{
		_zone.loadGraphic(AssetPaths.banker_zone_2__png);
		_zone2.loadGraphic(AssetPaths.player_zone_2__png);
		_zone3.loadGraphic(AssetPaths.tie_2__png);
		_zone4.loadGraphic(AssetPaths.banker_pair_2__png);
		_zone5.loadGraphic(AssetPaths.player_pair_2__png);
		_zone6.loadGraphic(AssetPaths.sp_2__png);
	}
	
	private function flash_2():Void
	{
		_zone.loadGraphic(AssetPaths.banker_zone_1__png);
		_zone2.loadGraphic(AssetPaths.player_zone_1__png);
		_zone3.loadGraphic(AssetPaths.tie_1__png);
		_zone4.loadGraphic(AssetPaths.banker_pair_1__png);
		_zone5.loadGraphic(AssetPaths.player_pair_1__png);
		_zone6.loadGraphic(AssetPaths.sp_1__png);
	}
	
	private function onCancelDown(Sprite:Btn)
	{
		FlxG.log.add("onCancelDown ");
		_cancel.loadGraphic(AssetPaths.cancel_2__png);
	}
	
	private function onCancelUp(Sprite:Btn)
	{
		FlxG.log.add("onCancelUp ");
		_cancel.loadGraphic(AssetPaths.cancel_1__png);
	}
	
	
	private function onContinueDown(Sprite:Btn)
	{
		FlxG.log.add("onContinueDown ");
		_cancel.loadGraphic(AssetPaths.cancel_2__png);
	}
	
	private function onContinueUp(Sprite:Btn)
	{
		
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
		if ( Sprite._id == 5) _zone6.loadGraphic(st);
	}
	
	private function onUp(Sprite:Btn)
	{
		if ( Main._model._game_state == "NewRoundState") return;
		
		//click diff zone
		if (_click_zone !=-1 && _click_zone != Sprite._id ) 
		{
			send_bet();			
		}
		
		var st:String = Sprite._name;
		var r = ~/_2/;		
		st = r.replace(st, "_1");		
		
		if ( Sprite._id == 0) 
		{
			_zone.loadGraphic(st);
			_bet.revive();
			
			//un_confirm add
			Main._model.bet_in(Sprite._id);
			_bet_amount.text = Main._model.bet_total(Sprite._id);
			
			//cancel show up,count down timer start
			cancel_timer_start();
			
			//create mapping res name
			Main._model.creat_mapping_resname(Sprite._id, _statck_res);
			coin_update(_statck, _statck_res);			
		}
		if ( Sprite._id == 1)
		{
			_zone2.loadGraphic(st);
			_bet2.revive();
			
			Main._model.bet_in(Sprite._id);
			_bet_amount2.text = Main._model.bet_total(Sprite._id);
			
			cancel_timer_start();
			
			Main._model.creat_mapping_resname(Sprite._id, _statck_res2);
			coin_update(_statck2,_statck_res2);
		}
		if ( Sprite._id == 2) 
		{
			_zone3.loadGraphic(st);
			_bet3.revive();
			
			Main._model.bet_in(Sprite._id);
			_bet_amount3.text = Main._model.bet_total(Sprite._id);
			
			cancel_timer_start();
			
			Main._model.creat_mapping_resname(Sprite._id, _statck_res3);			
			coin_update(_statck3,_statck_res3);
		}
		if ( Sprite._id == 3) 
		{
			_zone4.loadGraphic(st);
			_bet4.revive();
			
			Main._model.bet_in(Sprite._id);
			_bet_amount4.text = Main._model.bet_total(Sprite._id);
			
			cancel_timer_start();
			
			Main._model.creat_mapping_resname(Sprite._id, _statck_res4);			
			coin_update(_statck4,_statck_res4);
		}
		if ( Sprite._id == 4) 
		{
			_zone5.loadGraphic(st);
			_bet5.revive();
			
			Main._model.bet_in(Sprite._id);
			_bet_amount5.text = Main._model.bet_total(Sprite._id);
			
			cancel_timer_start();
			
			Main._model.creat_mapping_resname(Sprite._id, _statck_res5);			
			coin_update(_statck5,_statck_res5);
		}
		if ( Sprite._id == 5) 
		{
			_zone6.loadGraphic(st);
			_bet6.revive();
			
			Main._model.bet_in(Sprite._id);
			_bet_amount6.text = Main._model.bet_total(Sprite._id);
			
			cancel_timer_start();
			
			//update coin
			Main._model.creat_mapping_resname(Sprite._id, _statck_res6);
			coin_update(_statck6,_statck_res6);
		}
		
		_click_zone = Sprite._id;
		//FlxG.log.add("_click_zone "+_click_zone);
	}
	
	private function cancel_count(timer:FlxTimer):Void
	{		
		//FlxG.log.add("timer "+timer.loopsLeft);
		if ( timer.loopsLeft == 0)
		{
			_cancel.kill();
			
			send_bet();			
		}
	}
	
	private function send_bet():Void
	{
		Main._model.send_un_comfirm_bet();
		
		//sim put comifm
		
		//success
		Main._model.un_comfirm_bet_to_comfirm();
		
		//sim faile		
		//Main._model.un_comfirm_bet_drop();
		//
		//update coin
		//if ( _click_zone != -1)
		//{
			//if( _click_zone == 0) 
			//{
				//_bet_amount.text = Main._model.bet_total(_click_zone);
				//Main._model.creat_mapping_resname(_click_zone, _statck_res);
				//coin_update(_statck, _statck_res);
			//}
			//if( _click_zone == 1) 
			//{
				//_bet_amount2.text = Main._model.bet_total(_click_zone);
				//Main._model.creat_mapping_resname(_click_zone, _statck_res2);
				//coin_update(_statck2,_statck_res2);
			//}
			//if( _click_zone == 2) 
			//{
				//_bet_amount3.text = Main._model.bet_total(_click_zone);
				//Main._model.creat_mapping_resname(_click_zone, _statck_res3);			
				//coin_update(_statck3,_statck_res3);
			//}
			//if( _click_zone == 3) 
			//{
				//_bet_amount4.text = Main._model.bet_total(_click_zone);
				//Main._model.creat_mapping_resname(_click_zone, _statck_res4);
				//coin_update(_statck4,_statck_res4);
			//}
			//if( _click_zone == 4) 
			//{
				//_bet_amount5.text = Main._model.bet_total(_click_zone);
				//Main._model.creat_mapping_resname(_click_zone, _statck_res5);			
				//coin_update(_statck5,_statck_res5);
			//}
			//if( _click_zone == 5) 
			//{
				//_bet_amount6.text = Main._model.bet_total(_click_zone);
				//Main._model.creat_mapping_resname(_click_zone, _statck_res6);
				//coin_update(_statck6,_statck_res6);
			//}			
		//}
		//
		
		
	}
	
	
	private function cancel_timer_start():Void
	{
		_cancel.revive();
		_bet_cancel_timer.cancel();
		_bet_cancel_timer.start(1, cancel_count, 3);			
		
	}
	
	
	private function coin_update(target:FlxGroup,res:Array<String>):Void
	{		
		var i:Int = 0;
		for ( mem in target)
		{
			var item:FlxSprite = cast(mem, FlxSprite);			
			item.loadGraphic(res[i]);
//			FlxG.log.add("coin_update "+res[i]);
			i++;
		}
		
	}
	
	private function coin_clean(target:FlxGroup):Void
	{
		for ( mem in target)
		{
			var item:FlxSprite = cast(mem, FlxSprite);
			item.loadGraphic(AssetPaths.ball_none__png);
		}
	}
	
	private function creat_stack(x:Float,y:Float,target:FlxGroup,res:Array<String>):Void
	{
		var ColumnCnt:Int = 10;
		for (i in 0...(10))
		{
			var x:Float = x;
			var y:Float = y - (i % ColumnCnt * 10);
			
			var coin:FlxSprite = new FlxSprite(x, y).loadGraphic(AssetPaths.ball_none__png);
			coin.scale.set(0.65, 0.65);
			coin.antialiasing = true;
			add(coin);			
			target.add(coin);
			res.push(AssetPaths.ball_none__png);
		}
	}
	
}