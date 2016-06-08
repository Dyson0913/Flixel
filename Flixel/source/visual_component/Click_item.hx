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


class Click_item extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;	
	private var _zone2:FlxSprite;	
	private var _zone3:FlxSprite;	
	private var _zone4:FlxSprite;	
	private var _zone5:FlxSprite;	
	private var _zone6:FlxSprite;	
	
	private var _click_item:FlxGroup;
	
	private var _test_btn:FlxButton;
	private var _test_btn2:FlxButton;
	private var _test_btn3:FlxButton;
	private var _test_btn4:FlxButton;	
	
	private var _control:FlxObject;
	
	public function new() 
	{
		super();
		FlxG.log.add("click item init");
		//_click_item = new FlxGroup();
		//add(_click_item);
		_zone = new FlxSprite(1150,530).loadGraphic(AssetPaths.banker_zone_1__png);
		_zone2 = new FlxSprite(330,530).loadGraphic(AssetPaths.player_zone_1__png);
		_zone3 = new FlxSprite(785,690).loadGraphic(AssetPaths.tie_1__png);
		_zone4 = new FlxSprite(1540,580).loadGraphic(AssetPaths.banker_pair_1__png);
		_zone5 = new FlxSprite(20,570).loadGraphic(AssetPaths.player_pair_1__png);
		_zone6 = new FlxSprite(800,530).loadGraphic(AssetPaths.sp__png);
		add(_zone);
		add(_zone2);
		add(_zone3);
		add(_zone4);
		add(_zone5);
		add(_zone6);
		
		_zone.kill();
		_zone2.kill();		
		_zone3.kill();		
		_zone4.kill();		
		_zone5.kill();		
		_zone6.kill();		
		
		//event
		Main._model.NewRoundState.add(appear);
		Main._model.StartBetState.add(appear);
		Main._model.EndBetState.add(disappear);
		Main._model.OpenState.add(disappear);
		Main._model.EndRoundState.add(disappear);
		
		_test_btn = new FlxButton(400, 50, "+x", x);
		add(_test_btn);
		
		_test_btn2 = new FlxButton(300, 50, "-x", ng_x);
		add(_test_btn2);
		
		_test_btn3 = new FlxButton(350, 70, "+y", y);
		add(_test_btn3);
		
		_test_btn4 = new FlxButton(350, 20, "-y", ng_y);
		add(_test_btn4);
		
	
		
		_control = _zone3;
	}
	
	private function appear(s:Dynamic):Void
	{
		FlxG.log.add("click item appear ");
		_zone.revive();
		_zone2.revive();
		_zone3.revive();
		_zone4.revive();
		_zone5.revive();
		_zone6.revive();
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
	}
	
	private function ng_x():Void
	{
		_control.x -= 10;
		FlxG.log.add("item.x ="+_control.x);
		FlxG.log.add("item.x ="+_control.y);
	}
	
	private function x():Void
	{
		_control.x += 10;
		FlxG.log.add("item.x ="+_control.x);
		FlxG.log.add("item.x ="+_control.y);
	}
	
	private function y():Void
	{
		_control.y += 10;
		FlxG.log.add("item.y ="+_control.x);
		FlxG.log.add("item.y ="+_control.y);
	}
	
	private function ng_y():Void
	{
		_control.y -= 10;
		FlxG.log.add("item.x ="+_control.x);
		FlxG.log.add("item.x ="+_control.y);
	}
	
	
	
}