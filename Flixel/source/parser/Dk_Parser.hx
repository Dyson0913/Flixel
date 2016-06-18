package parser;

import flixel.FlxObject;
import flixel.FlxG;

import model.IParser;

import haxe.Json;
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
	
	public override function parser(pack:Dynamic):Void 
	{
		FlxG.log.add("dk parse");
		FlxG.log.add(pack);
		
		Main._model._game_id = pack.game_id;
		Main._model._game_type = pack.game_type;
		Main._model._game_round = pack.game_round;
		Main._model._game_state = pack.game_state;
		
		
		
		if ( pack.message_type == "MsgPlayerEnterGame")
		{
			Main._model.join_game_success.dispatch(pack.game_state);
			
			if ( pack.game_state == "NewRoundState")
			{
				//record_list : [ { banker_pair : false, point : 3, player_pair : true, winner : BetBWBanker } : false, winner : None },..] }
				Main._model._recode_hisotry = pack.record_list;
				Main._model.NewRoundState.dispatch(pack.game_state);
			}
			
			if ( pack.game_state == "StartBetState")
			{
				//Main._model._remain_time = pack.remain_time;
				Main._model._remain_time = pack.remain_time;
				Main._model.StartBetState.dispatch(pack.game_state);
			}
			
			if ( pack.game_state == "EndBetState")
			{
				//event
				Main._model.EndBetState.dispatch(pack.game_state);
			}
			
			if ( pack.game_state == "OpenState")
			{
				//cards_info : { river_card_list : [], extra_card_list : [], banker_card_list : [], player_card_list : [] }
				//"cards_bigwin_prob":[0.00017, 0.011068, 0.072029, 0.815305, 1.00866, 2.15512]
				//"card_list":["7s"],"card_type":"Player",Banker,River
				Main._model._bigwin_prob = pack.cards_bigwin_prob;
				Main._model.OpenState.dispatch(pack.game_state);
			}
			
			if ( pack.game_state == "EndRoundState")
			{
				//remain_time option
				//result_list :[{"real_win_amount":95,"odds":1.95,"bet_attr":"BetAttrMain","bet_amount":100,"win_state":"WSBWNormalWin","settle_amount":195,"bet_type":"BetBWPlayer"},
				Main._model.EndRoundState.dispatch(pack.game_state);
			}
			
			// bet_list : {}, 
			
		}
		
		if ( pack.message_type == "MsgBPState")
		{
			if ( pack.game_state == "NewRoundState")
			{
				//record_list : [ { banker_pair : false, point : 3, player_pair : true, winner : BetBWBanker } : false, winner : None },..] }				
				Main._model._recode_hisotry = pack.record_list;
				Main._model.NewRoundState.dispatch(pack.game_state);
			}
			
			if ( pack.game_state == "StartBetState")
			{
				Main._model._remain_time = pack.remain_time;
				Main._model.StartBetState.dispatch(pack.game_state);
			}
			if ( pack.game_state == "EndBetState")
			{
				//event
				Main._model.EndBetState.dispatch(pack.game_state);
			}			
		}
		
		if ( pack.message_type == "MsgBPOpenCard")
		{			
			//"cards_bigwin_prob":[0.00017,0.011068,0.072029,0.815305,1.00866,2.15512]
			//"card_list":["7s"],"card_type":"Player",Banker,River
			if ( pack.card_type == "Banker" ) Main._model._bigwin_banker_card.push(pack.card_list[0]);
			if ( pack.card_type == "Player" ) Main._model._bigwin_player_card.push(pack.card_list[0]);
			if ( pack.card_type == "River" ) Main._model._bigwin_river_card.push(pack.card_list[0]);
			Main._model._bigwin_opencard_type = pack.card_type;
			
			Main._model._bigwin_prob = pack.cards_bigwin_prob;			
			Main._model.OpenState.dispatch(pack.game_state);			
		}
		
		if ( pack.message_type == "MsgBPEndRound")
		{			
			//remain_time option
			//result_list :[{"real_win_amount":95,"odds":1.95,"bet_attr":"BetAttrMain","bet_amount":100,"win_state":"WSBWNormalWin","settle_amount":195,"bet_type":"BetBWPlayer"},
			Main._model._bigwin_opencard_type = "";
			
			Main._model.EndRoundState.dispatch(pack.game_state);
		}
		
		
		//Main._model.StateUpdate.dispatch(pack.game_state);
    }
	
	
}
