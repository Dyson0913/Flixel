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



class Card extends FlxTypedGroup<FlxSprite>
{
	private var _zone:FlxSprite;		
	
	private var _poker:Array<FlxSprite>;
	
	private var _Cards:FlxGroup;
	
	public function new() 
	{
		super();
		FlxG.log.add("Card init");
		_zone = new FlxSprite(330,530).loadGraphic(AssetPaths.open_card_bg__png);
		add(_zone);
		_zone.kill();
		
		//event
		Main._model.NewRoundState.add(disappear);
		Main._model.StartBetState.add(disappear);
		Main._model.EndBetState.add(appear);
		Main._model.OpenState.add(appear);
		Main._model.EndRoundState.add(appear);
		
		_Cards = new FlxGroup();
		_poker = new Array<FlxSprite>();
		
		var RowCnt:Int = 10;
		var gap:Int = 0;
		for (i in 0...(6))
		{
			if (i % 2 == 0 && i != 0) 
			{
				gap += 125;			
			}
			var x:Float = 78 + (i % RowCnt * 210) + gap;			
			var y:Float = 429 + Math.floor(i / RowCnt) * 466;
			
			var card:FlxSprite = new FlxSprite(x, y).loadGraphic("assets/images/share/poker/" + (i+1) + ".png");
			card.scale.set(0.4, 0.4);
			card.antialiasing = true;
			add(card);
			_poker.push(card);
			_Cards.add(card);
		}
		
		_Cards.kill();
	}
	
	private function appear(s:Dynamic):Void
	{
		
		_zone.revive();
		_Cards.revive();
	}
	
	private function disappear(s:Dynamic):Void
	{
		
		_zone.kill();
		_Cards.kill();
	}
	
}