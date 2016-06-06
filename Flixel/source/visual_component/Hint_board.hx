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



class Hint_board extends FlxTypedGroup<FlxSprite>
{
	private var _hint:FlxSprite;
	private var _hintext:FlxText;
	
	
	//[Embed(source = "fonts/mandarin.ttf", fontFamily = "system")];
	//protected var junk:String;
	
	public function new() 
	{
		super();
		
		_hint = new FlxSprite(1920 / 2, 1080 / 2, AssetPaths.lobby_hint_bg__png);
		_hint.x -= _hint.width / 2;
		_hint.y -= _hint.height / 2;
		
		    _hintext = new FlxText(_hint.x - 10, _hint.y, 350, "", 40, true);
			//_hintext.font = "_sans";
		    _hintext.setFormat(AssetPaths.Times_Bold__ttf, _hintext.size, FlxColor.WHITE, "center");
		
		add(_hint);
		add(_hintext);
		//_hint.kill();
		
		//event
		Main._model.socket_error.add(socket_error);
	}
	
	private function socket_error(data:Dynamic):Void
	{
		//_hint.revive();
		_hintext.text = "error";
	}
	
}