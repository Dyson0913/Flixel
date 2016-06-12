package ;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import model.Model;
import openfl.utils.Object;

import flixel.ui.FlxButton;
import flixel.util.FlxColor;

import haxe.Json;



class HUD extends FlxTypedGroup<FlxSprite>
{
	private var _loadpic:FlxButton;
	
	private var _credit_bg:FlxSprite;
	
	private var _credit:FlxText;
	
	public function new() 
	{
		super();
		
		//_sprBack = new FlxSprite().makeGraphic(FlxG.width, 30, FlxColor.BROWN);
		//add(_sprBack);
		//add(new FlxText(0, 0, 0, ""));
		
		//_loadpic = new FlxButton(100, 0, "back", back_to_lobby);		
		_loadpic = new FlxButton(100, 50, "test", pack_test);		
		add(_loadpic);
		
		
		_credit_bg = new FlxSprite(1451,13).loadGraphic(AssetPaths.money__png);
		add(_credit_bg);		
		//_credit.antialiasing = true;
		
		_credit = new FlxText(_credit_bg.x+70, _credit_bg.y+15, 350, "", 40,true);
		_credit.setFormat(AssetPaths.Times_Bold__ttf, _credit.size, FlxColor.WHITE, "right");
		add(_credit);
		
		//event
		Main._model.creditUpdate.add(credit_update);
		
		
	}
	
	private function credit_update(data:Dynamic):Void
	{
		FlxG.log.add("credit_update "+data);
		_credit.text = data;
	}
	
	
	private function back_to_lobby():Void
	{
		FlxG.switchState(new MenuState());		
	}
	
	private function pack_test():Void
	{
		//FlxG.fullscreen = !FlxG.fullscreen;
		
		//Main._model.adjust_item.dispatch(_credit_bg);
		//return;
		
		Main.parse_pack(Main._model._packlist[Main._model._packlist_idx]);
		Main._model._packlist_idx = Main._model._packlist_idx +1;
		Main._model._packlist_idx %= Main._model._packlist.length;
		
	}
}