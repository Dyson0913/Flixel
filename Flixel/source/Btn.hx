package;

import flixel.FlxSprite;
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
	
	private var _onDown:FlxSprite->Void = null;
	private var _onUp:FlxSprite->Void = null;
	private var _onOver:FlxSprite->Void = null;
	private var _onOut:FlxSprite->Void = null;
	
	public function new(X:Float=0, Y:Float=0,Graphic:Dynamic,?OnDown:FlxSprite->Void,?OnUp:FlxSprite->Void,?OnOver:FlxSprite->Void,?OnOut:FlxSprite->Void) 
	{
		super(X, Y);		
		
		//makeGraphic(16, 16, FlxColor.BLUE);
		loadGraphic(Graphic, true,0,0);
		
		_onDown = OnDown;
		_onUp = OnUp;
		_onOver = OnOver;
		_onOut = OnOut;
		
		FlxMouseEventManager.add(this, onDown, onUp, onOver, onOut);
		
	}
	
	private function onDown(Sprite:FlxSprite)
	{
		if( _onDown != null) _onDown(Sprite);
	}
	
	private function onUp(Sprite:FlxSprite)
	{
		if( _onUp != null) _onUp(Sprite);
	}
	
	private function onOver(Sprite:FlxSprite) 
	{
		if( _onOver != null) _onOver(Sprite);
	}
	
	private function onOut(Sprite:FlxSprite)
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