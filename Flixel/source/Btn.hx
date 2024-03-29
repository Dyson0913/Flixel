package;

import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

import flixel.input.mouse.FlxMouseEventManager;
import flixel.tweens.FlxTween;
import flixel.FlxG;

/**
 * ...
 * @author Dyson0913
 */
class Btn extends FlxSprite
{
	private var _turned:Bool = false;
	
	
	private var _onDown:Btn->Void = null;
	private var _onUp:Btn->Void = null;
	private var _onOver:Btn->Void = null;
	private var _onOut:Btn->Void = null;
	
	public var _name:String = "";
	public var _id:Int = -1;
	
	public function new(X:Float=0, Y:Float=0,id:Int,Graphic:FlxGraphicAsset,?OnDown:Btn->Void,?OnUp:Btn->Void,?OnOver:Btn->Void,?OnOut:Btn->Void) 
	{
		super(X, Y);		
		
		//makeGraphic(16, 16, FlxColor.BLUE);
		var graph:FlxGraphic = FlxG.bitmap.add(Graphic);
		loadGraphic(Graphic, true,graph.width,graph.height);
		
		_onDown = OnDown;
		_onUp = OnUp;
		_onOver = OnOver;
		_onOut = OnOut;
		
		FlxMouseEventManager.add(this, onDown, onUp, onOver, onOut);
		_name = Graphic;
		_id = id;
	}
	
	private function onDown(Sprite:Btn)
	{
		if( _onDown != null) _onDown(Sprite);
	}
	
	private function onUp(Sprite:Btn)
	{
		if( _onUp != null) _onUp(Sprite);
	}
	
	private function onOver(Sprite:Btn) 
	{
		if( _onOver != null) _onOver(Sprite);
	}
	
	private function onOut(Sprite:Btn)
	{
		if( _onOut != null) _onOut(Sprite);
	}
	
	
	
	override public function destroy():Void 
	{
		// Make sure that this object is removed from the MouseEventManager for GC		
		FlxMouseEventManager.remove(this);
		super.destroy();
	}
}