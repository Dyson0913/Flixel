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



class Kiban_board extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;
	private var _zone2:FlxSprite;
	private var _zone3:FlxSprite;
	
	public function new() 
	{
		super();		
		FlxG.log.add("Kiban_board init");
		_zone = new FlxSprite(0,80).loadGraphic(AssetPaths.kiban_with_title__png);
		add(_zone);
		//_zone.kill();
		
		_zone2 = new FlxSprite(1250,80).loadGraphic(AssetPaths.kiban_no_title__png);
		add(_zone2);
		
		_zone3 = new FlxSprite(1290,410).loadGraphic(AssetPaths.powerbar__png);
		add(_zone3);
		
		//Main._model.adjust_item.dispatch(_zone3);
		//event
		//Main._model.NewRoundState.add(disappear);
		//Main._model.StartBetState.add(disappear);
		//Main._model.EndBetState.add(appear);
		//Main._model.OpenState.add(appear);
		//Main._model.EndRoundState.add(appear);
	
		
	}
	
	private function appear(s:Dynamic):Void
	{
		FlxG.log.add("Kiban_board appear ");
		//_zone.revive();
		
	}
	
	private function disappear(s:Dynamic):Void
	{
		FlxG.log.add("Kiban_board disappear ");
		//_zone.kill();
	}
	
}