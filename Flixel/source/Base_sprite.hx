package ;

import flash.display.BitmapData;
import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author hhg4092
 */
class Base_sprite extends FlxSprite
{

	public function new(?X:Float = 0, ?Y:Float = 0)
	{
		super(X, Y);
		
		//makeGraphic(16, 16, FlxColor.BLUE);
		
		//spirte
		//loadGraphic(AssetPaths.dyson__png, false, 16, 16);
	}
	
	public function set_bitmap(bitmapdata:BitmapData):Void
	{
		loadGraphic(bitmapdata, false, 16, 16);
	}
	
	public function show():Void
	{
		this.revive();
	}
	
	public function hide():Void
	{
		this.kill();
	}
	
}