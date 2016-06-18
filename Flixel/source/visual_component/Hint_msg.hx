package visual_component;

/**
 * ...
 * @author hhg4092
 */
import flixel.FlxG;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import model.Model;

import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;


class Hint_msg extends FlxTypedGroup<FlxSprite>
{
	private var _msgbg:FlxSprite;	
	
	private var _msg_startbet:FlxSprite;	
	private var _msg_endbet:FlxSprite;
	private var _msg_no_money:FlxSprite;	
	
	public function new() 
	{
		super();		
		
		_msgbg = new FlxSprite(140, 645).loadGraphic(AssetPaths.msg_bg__png);
		
		_msg_startbet = new FlxSprite(792, 645).loadGraphic(AssetPaths.msg_start_bet__png);
		_msg_endbet = new FlxSprite(746, 645).loadGraphic(AssetPaths.msg_stop_bet__png);
		_msg_no_money = new FlxSprite(704, 641).loadGraphic(AssetPaths.msg_no_money__png);
		
		
		add(_msgbg);		
		add(_msg_startbet);		
		add(_msg_endbet);		
		add(_msg_no_money);
		
		//event
		Main._model.NewRoundState.add(disappear);
		Main._model.StartBetState.add(appear);
		Main._model.EndBetState.add(appear);
		Main._model.OpenState.add(disappear);
		Main._model.EndRoundState.add(disappear);
		
		disappear(1);
		Main._model.adjust_item.dispatch(_msg_no_money);		
	}
	
	private function appear(s:Dynamic):Void
	{		
		_msgbg.revive();
		
		_msgbg.alpha = 1;
		FlxTween.tween(_msgbg, { alpha:0, }, 0.5);
		
		if ( Main._model._game_state == "StartBetState")
		{			
			_msg_startbet.revive();			
			FlxTween.tween(_msg_startbet, { alpha:0, }, 0.5 , { ease:FlxEase.backIn } );
		}
		
		if ( Main._model._game_state == "EndBetState")
		{
			_msg_endbet.revive();		
			FlxTween.tween(_msg_endbet, { alpha:0, },  0.5 , { ease:FlxEase.backIn } );
		}
		
	}
	
	private function disappear(s:Dynamic):Void
	{		
		_msgbg.kill();
		_msg_startbet.kill();
		_msg_endbet.kill();
		_msg_no_money.kill();
	}
	
}