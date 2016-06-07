package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import haxe.Json;
import visual_component.Hint_board;

import flash.display.BitmapData;

import Std;
import openfl.Assets;
//import flixel.util.FlxSpriteUtil;

import openfl.utils.ByteArray;

import visual_component.Click_item;

class MenuState extends FlxState
{
	private var _hud:HUD;
	
	private var _dkcanvs:Dk;
	private var _PAcanvs:PA;
	private var _7pkcanvs:Super7pk;
	
	private var _dk:FlxButton;
	private var _pa:FlxButton;
	private var _7pk:FlxButton;
	
	public var _hint_board:Hint_board;
	
	private var _bet_zone:Click_item;
	
	
	
	override public function create():Void
	{
		super.create();
		_hud = new HUD();
		
		//add(new FlxText(0, 0, 0, "Hello World!"));		
		
		_hint_board = new Hint_board();
		add(_hint_board);
		
		//event
		Main._model.creditUpdate.add(credit_update);
		Main._model.join_game_success.add(join_game_success);
		
		return;
		
		_dk = new FlxButton(250, 400, "dk", dk);		
		add(_dk);
		
		_pa = new FlxButton(400, 400, "pa", pa);		
		add(_pa);		
		
		_7pk = new FlxButton(500, 400, "7pk", click7pk);		
		add(_7pk);		
		
		add(_hud);
		
		
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
	}
	
	private function dk():Void
	{		
		remove(_hud);
		_dkcanvs = new Dk();
		add(_dkcanvs);
		
		_bet_zone = new Click_item();
		add(_bet_zone);
		
		add(_hud);		
	}
	
	private function pa():Void
	{		
		remove(_hud);
		_PAcanvs = new PA();
		add(_PAcanvs);
		add(_hud);
		
	}
	
	private function click7pk():Void
	{		
		remove(_hud);
		_7pkcanvs = new Super7pk();
		add(_7pkcanvs);
		add(_hud);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	override public function destroy():Void
	{
		//_ws.dispose();
	}
}