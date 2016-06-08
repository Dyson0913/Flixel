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



class Click_item extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;	
	
	private var _click_item:FlxGroup;
	
	public function new() 
	{
		super();
		FlxG.log.add("click item init");
		//_click_item = new FlxGroup();
		//add(_click_item);
		_zone = new FlxSprite().loadGraphic(AssetPaths.banker_zone_1__png);
		add(_zone);
		_zone.kill();
		
		//event
		Main._model.NewRoundState.add(appear);
		Main._model.StartBetState.add(appear);
		Main._model.EndBetState.add(disappear);
		Main._model.OpenState.add(disappear);
		Main._model.EndRoundState.add(disappear);
		
	}
	
	private function appear(s:Dynamic):Void
	{
		FlxG.log.add("click item appear ");
		_zone.revive();
		
	}
	
	private function disappear(s:Dynamic):Void
	{
		FlxG.log.add("click item disappear ");
		_zone.kill();
	}
	
}