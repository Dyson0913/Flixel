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
		
		//_click_item = new FlxGroup();
		//add(_click_item);
		_zone = new FlxSprite(100, 200).loadGraphic(AssetPaths.banker_zone_1__png);
		add(_zone);
		_zone.kill();
		
		//event
		Main._model.NewRoundState.add(appear);
		Main._model.StartBetState.add(appear);
	}
	
	private function appear(s:Dynamic):Void
	{
		//FlxG.log.add("dk onget " + s);
		_zone.revive();
		
	}
	
	
	
}