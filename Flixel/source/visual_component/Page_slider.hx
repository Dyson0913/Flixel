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



class Page_slider extends FlxTypedGroup<FlxSprite>
{
	
	private var _teach_btn:Btn;
	private var _teach_bg:FlxSprite;
	private var _teach_close:Btn;	
	private var _teach_dot:FlxGroup;	
	
	private var _teach_right:FlxSprite;
	private var _teach_left:FlxSprite;
	private var _teach_table:FlxSprite;
	
	private var _res:Array<String> = new Array<String>();
	private var _res_idx:Int = 0;
	
	public function new() 
	{
		super();
		
		_teach_btn = new Btn(19, 949, 0, AssetPaths.teach_btn_1__png, onDown, onUp);	
		_teach_btn.antialiasing = true;
		add(_teach_btn);
		
		_teach_bg = new FlxSprite(298, 67).loadGraphic(AssetPaths.teach_bg__png);
		_teach_bg.antialiasing = true;
		add(_teach_bg);
		_teach_bg.kill();
		
		_teach_close = new Btn(_teach_bg.x +1190, _teach_bg.y+60, 0, AssetPaths.teach_close_1__png, onteachDown,onteachup);	
		_teach_close.antialiasing = true;
		add(_teach_close);
		_teach_close.kill();
		
		_teach_right = new Btn(_teach_bg.x +1277, _teach_bg.y + 439, 0, AssetPaths.teach_page_r__png, onpagedown, onpageup); 
		_teach_right.antialiasing = true;
		add(_teach_right);
		_teach_right.kill();
		
		_teach_left = new Btn(_teach_bg.x , _teach_bg.y + 439, 1, AssetPaths.teach_page_l__png, onpagedown, onpageup); 
		_teach_left.antialiasing = true;
		add(_teach_left);
		_teach_left.kill();
		
		_teach_dot = new FlxGroup();
		creat_dot(_teach_bg.x+605, _teach_bg.y+856, _teach_dot);		
		
		_teach_table = new FlxSprite(377,133, AssetPaths.dk_teach_1__png);
		add(_teach_table);
		_teach_table.kill();
		
		_res.push(AssetPaths.dk_teach_1__png);
		_res.push(AssetPaths.dk_teach_2__png);
		_res.push(AssetPaths.dk_teach_3__png);
		
		
		//Main._model.adjust_item.dispatch(_teach_table);	
	}
	
	private function onpagedown(Sprite:Btn)
	{
		FlxG.log.add(_res_idx);
		if( Sprite._id ==0) _res_idx = (_res_idx + 1) % 3;		
		else if ( Sprite._id == 1)
		{
			if (_res_idx == 0) _res_idx = 2;
			else  _res_idx = (_res_idx - 1);
		}
		
		_teach_table.loadGraphic(_res[_res_idx]);
		
		var i:Int = 0;
		for (mem in _teach_dot)
		{
			var item:FlxSprite = cast(mem, FlxSprite);
			if( i == _res_idx) item.loadGraphic(AssetPaths.teach_dot_1__png);
			else item.loadGraphic(AssetPaths.teach_dot_2__png);
			i++;
		}
		
		
	}
	
	private function onpageup(Sprite:Btn)
	{
		
	}
	
	private function onteachDown(Sprite:Btn)
	{
		_teach_close.loadGraphic(AssetPaths.teach_close_2__png);
	}
	
	private function onteachup(Sprite:Btn)
	{		
		_teach_close.kill();
		_teach_close.loadGraphic(AssetPaths.teach_close_1__png);
		
		_teach_table.kill();		
		_teach_bg.kill();
		_teach_dot.kill();
		_teach_right.kill();
		_teach_left.kill();
	}
	
	
	private function onDown(Sprite:Btn)
	{
		_teach_btn.loadGraphic(AssetPaths.teach_btn_2__png);
	}
	
	private function onUp(Sprite:Btn)
	{		
		_teach_btn.loadGraphic(AssetPaths.teach_btn_1__png);
		if ( _teach_bg.alive ) return;
		
		_teach_bg.revive();
		_teach_close.revive();
		_teach_table.revive();
		_teach_right.revive();
		_teach_left.revive();
		
		_teach_dot.revive();
		
		var i:Int = 0;
		for (mem in _teach_dot)
		{
			var item:FlxSprite = cast(mem, FlxSprite);
			if( i == 0) item.loadGraphic(AssetPaths.teach_dot_1__png);			
			else item.loadGraphic(AssetPaths.teach_dot_2__png);			
			i++;
		}
		_res_idx = 0;
		_teach_table.loadGraphic(_res[_res_idx]);
	}
	
	private function creat_dot(x:Float,y:Float,target:FlxGroup):Void
	{
		var RowCnt:Int = 10;
		for (i in 0...(3))
		{
			var x:Float = x + (i % RowCnt * 40) ;	
			var y:Float = y + Math.floor(i / RowCnt) * 48;
			
			var _bar:FlxSprite = new FlxSprite(x, y, AssetPaths.teach_dot_2__png);
			_bar.antialiasing = true;
			add(_bar);
			target.add(_bar);
		}
	}
	
}