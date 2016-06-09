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



class Card extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;		
	
	public function new() 
	{
		super();
		FlxG.log.add("Card init");
		_zone = new FlxSprite(330,530).loadGraphic(AssetPaths.open_card_bg__png);
		add(_zone);
		_zone.kill();
		
		//event
		Main._model.NewRoundState.add(disappear);
		Main._model.StartBetState.add(disappear);
		Main._model.EndBetState.add(appear);
		Main._model.OpenState.add(appear);
		Main._model.EndRoundState.add(appear);
	
		
	}
	
	private function appear(s:Dynamic):Void
	{
		FlxG.log.add("Card appear ");
		_zone.revive();
		
	}
	
	private function disappear(s:Dynamic):Void
	{
		FlxG.log.add("Card disappear ");
		_zone.kill();
	}
	
}