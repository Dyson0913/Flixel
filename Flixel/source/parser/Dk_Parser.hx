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
				Main._model._recode_hisotry = pack.record_list;
				Main._model.NewRoundState.dispatch(pack.game_state);
			}
			
			if ( pack.game_state == "StartBetState")
			{				
				Main._model._remain_time = pack.remain_time;
				Main._model._recode_hisotry = pack.record_list;
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
				
				var bcard:Array<String> = pack.cards_info.banker_card_list;				
				if ( bcard.length !=0)
				{
					if ( bcard.length == 1) Main._model._bigwin_banker_card.push(bcard[0]);
					else if ( bcard.length == 2) 
					{
						Main._model._bigwin_banker_card.push(bcard[0]);
						Main._model._bigwin_banker_card.push(bcard[1]);
					}					
				}
				
				var pcard:Array<String> = pack.cards_info.player_card_list;				
				if ( pcard.length !=0)
				{
					if ( pcard.length == 1) Main._model._bigwin_player_card.push(pcard[0]);
					else if ( pcard.length == 2) 
					{
						Main._model._bigwin_player_card.push(pcard[0]);
						Main._model._bigwin_player_card.push(pcard[1]);
					}
					
				}
				
				var rcard:Array<String> = pack.cards_info.river_card_list;				
				if ( rcard.length !=0)
				{
					if ( rcard.length == 1) Main._model._bigwin_river_card.push(rcard[0]);
					else if ( rcard.length == 2) 
					{						
						Main._model._bigwin_river_card.push(rcard[0]);
						Main._model._bigwin_river_card.push(rcard[1]);
					}					
				}
				
				Main._model._bigwin_opencard_type = pack.card_type;			
				
				Main._model._bigwin_prob = pack.cards_bigwin_prob;
				Main._model.OpenState.dispatch(pack.game_state);
			}
			
			if ( pack.game_state == "EndRoundState")
			{
				//remain_time option
				//result_list :[{"real_win_amount":95,"odds":1.95,"bet_attr":"BetAttrMain","bet_amount":100,"win_state":"WSBWNormalWin","settle_amount":195,"bet_type":"BetBWPlayer"},
				
				Main._model._bigwin_banker_card.push(pack.cards_info.banker_card_list);
				Main._model._bigwin_player_card.push(pack.cards_info.player_card_list);
				Main._model._bigwin_river_card.push(pack.cards_info.river_card_list);
				
				
				var _result:Array<String> = pack.result_list;			
				var len:Int = _result.length;
				for (i in 0...(len))
				{
					var str:Dynamic = pack.result_list[i];				
					if ( str.bet_type == "BetBWBanker") 
					{
						Main._model._zone_settle_bet.insert(0, str.settle_amount);
						if (str.win_state != "WSLost") Main._model._win_type = 1;
					}
					if ( str.bet_type == "BetBWPlayer")
					{
						Main._model._zone_settle_bet.insert(1, str.settle_amount);
						if (str.win_state != "WSLost") Main._model._win_type = 2;
					}
					if ( str.bet_type == "BetBWTiePoint")
					{
						Main._model._zone_settle_bet.insert(2, str.settle_amount);
						if (str.win_state != "WSLost") Main._model._win_type = 3;
					}
					if ( str.bet_type == "BetBWBankerPair") Main._model._zone_settle_bet.insert(3, str.settle_amount);
					if ( str.bet_type == "BetBWPlayerPair") Main._model._zone_settle_bet.insert(4, str.settle_amount);
					if ( str.bet_type == "BetBWSpecial") Main._model._zone_settle_bet.insert(5, str.settle_amount);
					
				}			
				
				Main._model._bigwin_opencard_type = "";
				
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
			var _result:Array<String> = pack.result_list;			
			var len:Int = _result.length;
			for (i in 0...(len))
			{
				var str:Dynamic = pack.result_list[i];				
				if ( str.bet_type == "BetBWBanker") 
				{
					Main._model._zone_settle_bet.insert(0, str.settle_amount);
					if (str.win_state != "WSLost") Main._model._win_type = 1;
				}
				if ( str.bet_type == "BetBWPlayer")
				{
					Main._model._zone_settle_bet.insert(1, str.settle_amount);
					if (str.win_state != "WSLost") Main._model._win_type = 2;
				}
				if ( str.bet_type == "BetBWTiePoint")
				{
					Main._model._zone_settle_bet.insert(2, str.settle_amount);
					if (str.win_state != "WSLost") Main._model._win_type = 3;
				}
				if ( str.bet_type == "BetBWBankerPair") Main._model._zone_settle_bet.insert(3, str.settle_amount);
				if ( str.bet_type == "BetBWPlayerPair") Main._model._zone_settle_bet.insert(4, str.settle_amount);
				if ( str.bet_type == "BetBWSpecial") Main._model._zone_settle_bet.insert(5, str.settle_amount);
				
			}
			Main._model._bigwin_opencard_type = "";
			
			Main._model.EndRoundState.dispatch(pack.game_state);
		}
		
		
		//Main._model.StateUpdate.dispatch(pack.game_state);
    }
	
	
}
