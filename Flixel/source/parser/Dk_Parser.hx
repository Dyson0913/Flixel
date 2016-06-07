package parser;

import flixel.FlxObject;
import flixel.FlxG;

import model.IParser;


/**
 * ...
 * @author hhg4092
 */

class Dk_Parser extends IParser
{	
	public function new() 
	{
		super();		
	}
	
	public override function parser(message:Dynamic):Void 
	{
		FlxG.log.add("dk parse");
		//FlxG.log.add(message);
		
		
		
		Main._model._game_round = pack.game_round;
		Main._model._game_state = pack.game_state;
		
		
		
		if ( pack.message_type == "MsgPlayerEnterGame")
		{
			if ( pack.game_state == "NewRoundState")
			{
				//record_list : [ { banker_pair : false, point : 3, player_pair : true, winner : BetBWBanker } : false, winner : None },..] }
			}
			
			if ( pack.game_state == "StartBetState")
			{
				//Main._model._remain_time = pack.remain_time;
			}
			
			if ( pack.game_state == "EndBetState")
			{
				//event
			}
			
			if ( pack.game_state == "OpenState")
			{
				//cards_info : { river_card_list : [], extra_card_list : [], banker_card_list : [], player_card_list : [] }
				//"cards_bigwin_prob":[0.00017,0.011068,0.072029,0.815305,1.00866,2.15512]
				//"card_list":["7s"],"card_type":"Player",Banker,River				
			}
			
			if ( pack.game_state == "EndRoundState")
			{
				//remain_time option
				//result_list :[{"real_win_amount":95,"odds":1.95,"bet_attr":"BetAttrMain","bet_amount":100,"win_state":"WSBWNormalWin","settle_amount":195,"bet_type":"BetBWPlayer"},
			}
			
			// bet_list : {}, 
			
		}
		
		if ( pack.message_type == "MsgBPState")
		{
			if ( pack.game_state == "NewRoundState")
			{
				//record_list : [ { banker_pair : false, point : 3, player_pair : true, winner : BetBWBanker } : false, winner : None },..] }
			}
			
			if ( pack.game_state == "StartBetState")
			{
				//Main._model._remain_time = pack.remain_time;
			}
			if ( pack.game_state == "EndBetState")
			{
				//event
			}
			if ( pack.game_state == "OpenState")
			{
				//"cards_bigwin_prob":[0.00017,0.011068,0.072029,0.815305,1.00866,2.15512]
				//"card_list":["7s"],"card_type":"Player",Banker,River				
			}
			if ( pack.game_state == "EndRoundState")
			{
				//remain_time option
				//result_list :[{"real_win_amount":95,"odds":1.95,"bet_attr":"BetAttrMain","bet_amount":100,"win_state":"WSBWNormalWin","settle_amount":195,"bet_type":"BetBWPlayer"},
			}
		}
		
		//Main._model.StateUpdate.dispatch(message);
    }
	
	
}
