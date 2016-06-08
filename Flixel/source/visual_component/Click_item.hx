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
	
		Main._model.adjust_item.dispatch(_zone3);
		
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
	
}