package ;

/**
 * ...
 * @author hhg4092
 */
import flash.filters.BitmapFilter;
import flash.filters.BlurFilter;
import flixel.graphics.FlxGraphic;
import flixel.graphics.frames.FlxFilterFrames;
import flixel.tweens.FlxTween;

import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;

import flixel.ui.FlxButton;
import flixel.util.FlxColor;

import openfl.Assets;

class Slot extends FlxTypedGroup<FlxSprite>
{
	private var _bg:FlxSprite;
	
	private var _loadpic:FlxButton;
	private var _loadpic2:FlxButton;
	private var _loadpic3:FlxButton;
	
	
	private var _sym:FlxSprite;
	private var tween3:FlxTween;
	private var SIZE_INCREASE:Int = 5;
	
	public function new() 
	{
		super();
		
		_bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.CYAN);
		add(_bg);				
		
		_loadpic = new FlxButton(300, 200, "Slot", clickPlay);		
		add(_loadpic);
		
		_loadpic2 = new FlxButton(400, 200, "stop", back);		
		add(_loadpic2);
		
		_sym = new FlxSprite(500, 500, AssetPaths.slot_symbol_2__png);		
		add(_sym);
	}	
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
	}
	
	private function clickPlay():Void
	{
		var blurFilter = new BlurFilter();		
		blurFilter.blurX = blurFilter.blurY = SIZE_INCREASE;
		createFilterFrames(_sym, blurFilter);
		
		//effect
		spin_effect();
	}
	
	private function spin_effect():Void
	{
		FlxTween.tween(_sym, { y: _sym.y +_sym.height }, 0.5, { onUpdate: On_spin , type: FlxTween.PERSIST});
	}
	
	private function On_spin(Tween:FlxTween):Void
	{
		//_sym.y -= 3;
		//if( _sym.y
	}
	
	private function back():Void
	{
		_sym.loadGraphic(AssetPaths.slot_symbol_2__png);		
	}
	
	private function createFilterFrames(sprite:FlxSprite, filter:BitmapFilter):FlxFilterFrames
	{
		var filterFrames = FlxFilterFrames.fromFrames(
			sprite.frames,0, 0, [filter]);
		updateFilter(sprite, filterFrames);
		return filterFrames;
	}
	
	private function updateFilter(spr:FlxSprite, sprFilter:FlxFilterFrames)
	{
		sprFilter.applyToSprite(spr, false, false);
		
	}
	
}