package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import haxe.Json;
import visual_component.Adjust_tool;
import visual_component.Bet_zone;
import visual_component.Coin;
import visual_component.Hint_msg;
import visual_component.History_recode;
import visual_component.Kiban_board;
import visual_component.Page_slider;
import visual_component.Paytable;
import visual_component.Prob_panel;
import visual_component.Settle_panel;
import visual_component.Timer;


import flash.display.BitmapData;

import Std;
import openfl.Assets;
//import flixel.util.FlxSpriteUtil;

import openfl.utils.ByteArray;

import visual_component.Card;
import visual_component.Hint_board;

class MenuState extends FlxState
{
	private var _hud:HUD;
	
	//game
	private var _dkcanvs:Dk;
	private var _slot_canvs:Slot;
	private var _templat:Template_State;
	
	public var _hint_board:Hint_board;
	
	//share item
	private var _bet_zone:Bet_zone;
	private var _card:Card;
	private var _adjust:Adjust_tool;
	private var _kiban:Kiban_board;
	private var _paytable:Paytable;
	private var _history:History_recode;
	private var _settle:Settle_panel;
	private var _coin:Coin;
	private var _hintmsg:Hint_msg;
	private var _timer:Timer;
	private var _Prob_panel:Prob_panel;
	private var _page_slider:Page_slider;
	
	override public function create():Void
	{
		super.create();
		_hud = new HUD();
		
		_hint_board = new Hint_board();
		add(_hint_board);
		
		//event
		Main._model.creditUpdate.add(credit_update);
		Main._model.join_game_success.add(join_game_success);
	}
	
	private function credit_update(data:Dynamic):Void
	{
		FlxG.log.add("main enter");
		
		//send join pack
		join_game();
		
	}
	
	private function join_game():Void
	{
		var join_info = { "id":1111,							
		                  "message_type":"MsgPlayerEnterGame", 
						  "game_type":"BigWin",
						  "game_id": "BigWin-1"
		};
		
		Main._model.send_pack.dispatch(join_info);
	}
	
	private function join_game_success(data:Dynamic):Void
	{
		dk();		
		//slot();
		//template();
	}
	
	
	private function dk():Void
	{		
		remove(_hud);		
		
		_dkcanvs = new Dk();
		add(_dkcanvs);
		
		//_adjust = new Adjust_tool();
		//add(_adjust);
		
		_bet_zone = new Bet_zone();
		add(_bet_zone);
		
		_card = new Card();
		add(_card);
		
		_kiban =  new Kiban_board();
		add(_kiban);
		
		_paytable = new Paytable();
		add(_paytable);
		
		_history =  new History_recode();
		add(_history);
		
		_settle = new Settle_panel();
		add(_settle);
		
		_coin = new Coin();
		add(_coin);
		
		_hintmsg = new Hint_msg();
		add(_hintmsg);
		
		_timer = new Timer();
		add(_timer);
		
		_Prob_panel =  new Prob_panel();
		add(_Prob_panel);
		
		_page_slider = new Page_slider();
		add(_page_slider);
		
		add(_hud);		
	}
	
	private function slot():Void
	{		
		remove(_hud);
		
		_slot_canvs = new Slot();
		add(_slot_canvs);
		add(_hud);
	}
	
	private function template():Void
	{
		remove(_hud);
		_templat = new Template_State();
		add(_templat);
		add(_hud);
	}
	
	override public function destroy():Void
	{
		//_ws.dispose();
	}
}