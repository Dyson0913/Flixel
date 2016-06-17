package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import model.Model;

import flixel.util.FlxColor;



class Kiban_board extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;
	private var _zone2:FlxSprite;
	private var _zone3:FlxSprite;
	
	private var _permanent_bar:FlxGroup;
	private var _permanent_text:FlxGroup;
	
	
	public function new() 
	{
		super();
		
		_zone = new FlxSprite(12,93).loadGraphic(AssetPaths.kiban_with_title__png);
		add(_zone);		
		
		_zone2 = new FlxSprite(1256,90).loadGraphic(AssetPaths.kiban_no_title__png);
		add(_zone2);
		
		_zone3 = new FlxSprite(1290,423).loadGraphic(AssetPaths.powerbar__png);
		add(_zone3);
		
		_permanent_bar = new FlxGroup();
		creat_permanent_bar(1385, 433, _permanent_bar);
		_permanent_bar.kill();
		
		_permanent_text = new FlxGroup();
		creat_permanent_text(1685, 423, _permanent_text);
		_permanent_bar.kill();
		
		
		//event
		//two pair third msg
	}
	
	private function creat_permanent_bar(x:Float,y:Float,target:FlxGroup):Void
	{
		var ColumnCnt:Int = 10;
		for (i in 0...(2))
		{
			var x:Float = x;			
			var y:Float = y - (i % ColumnCnt * - 35);
			
			var _bar:FlxBar = new FlxBar(x, y, LEFT_TO_RIGHT, 380, 24);
			if ( i == 0) _bar.createImageBar(null, AssetPaths.dk_three_bar__png);
			else _bar.createImageBar(null, AssetPaths.dk_twopair_bar__png);			
			_bar.value = 100;
			add(_bar);
			target.add(_bar);
		}
	}
	
	private function permanent_bar_update(target:FlxGroup,data:Array<Float>):Void
	{		
		var i:Int = 0;
		for ( mem in target)
		{
			var item:FlxBar = cast(mem, FlxBar);
			
			//TODO 2/5?
			item.value = data[i];
			//item.updateFilledBar();
			i++;
		}
	}	
	
	private function creat_permanent_text(x:Float,y:Float,target:FlxGroup):Void
	{
		var ColumnCnt:Int = 10;		
		for (i in 0...(2))
		{
			var x:Float = x;			
			var y:Float = y - (i % ColumnCnt * - 35);
			
			var text = new FlxText(x, y, 170, "0", 30, true);			
			text.setFormat(AssetPaths.arial_0__ttf, text.size, FlxColor.WHITE, "right");			
			add(text);		
			target.add(text);			
		}
	}
	
	private function permanent_text_update(target:FlxGroup,data:Array<Float>):Void
	{		
		var i:Int = 0;
		for ( mem in target)
		{
			var item:FlxText = cast(mem, FlxText);			
			item.text = Std.string(data[i]);	
			i++;
			
		}
	}	
}