COMMAND:revistar2(playerid, params[])
{
    if(!PlayerInfo[playerid][pLogado]) return SendClientMessage(playerid, COLOR_LIGHTRED, "ACESSO NEGADO: {FFFFFF}voc� deve estar conectado antes de usar algum comando.");

    new other, stringrt[126];

	if (sscanf(params, "i",other)) SendClientMessage(playerid, COLOR_LIGHTRED,"{FF6347}USE:{FFFFFF} /revistar [playerid]");
	else
	{
	    if(GetDistanceBetweenPlayers(playerid,other) < 5.0)
		{
		    format(stringrt, sizeof(stringrt), "SERVER: Voc� est� revisando %s.", PlayerName(other, 1));
		    SendClientMessage(playerid, COLOR_YELLOW, stringrt);
		    format(stringrt, sizeof(stringrt), "SERVER: %s est� te revistando.", PlayerName(playerid, 1));
		    SendClientMessage(other, COLOR_YELLOW, stringrt);

			if(GetPVarInt(playerid, "QuerRevistar") != 9999)
			{
				if(IsPlayerConnected(GetPVarInt(playerid, "QuerRevistar")))
				{
					if(GetDistanceBetweenPlayers(playerid,GetPVarInt(playerid, "QuerRevistar")) < 5.0)
					{
						new IdQVaiVer = GetPVarInt(playerid, "QuerRevistar");

						format(string, sizeof(string), "_____Itens de %s_______", PlayerName(playerid, 1));
						SendClientMessage(IdQVaiVer, COLOR_COPDUTY, string);
						format(string, sizeof(string), "Dinheiro: [%d]", PlayerInfo[playerid][pGrana]);
						SendClientMessage(IdQVaiVer, COLOR_YELLOW, string);
						SendClientMessage(IdQVaiVer, COLOR_COPDUTY, "__________________________");
						new Arma1[126],Arma2[126],Arma3[126],Arma4[126],Arma5[126],Armas[856];
						if(PlayerInfo[playerid][pSlot1] > 0) format(Arma1, sizeof(Arma1), "1. %s [Muni��o:%d]", GunNames[ArmaData[PlayerInfo[playerid][pSlot1]][ArmaModelo]], PlayerInfo[playerid][pSlot1a]);
						else format(Arma1, sizeof(Arma1), "1. Vazio [Muni��o:0]");
						if(PlayerInfo[playerid][pSlot2] > 0) format(Arma2, sizeof(Arma2), "2. %s [Muni��o:%d]", GunNames[ArmaData[PlayerInfo[playerid][pSlot2]][ArmaModelo]], PlayerInfo[playerid][pSlot2a]);
						else format(Arma2, sizeof(Arma2), "2. Vazio [Muni��o:0]");
						if(PlayerInfo[playerid][pSlot3] > 0) format(Arma3, sizeof(Arma3), "3. %s [Muni��o:%d]", GunNames[ArmaData[PlayerInfo[playerid][pSlot3]][ArmaModelo]], PlayerInfo[playerid][pSlot3a]);
						else format(Arma3, sizeof(Arma3), "3. Vazio [Muni��o:0]");
						if(PlayerInfo[playerid][pSlot4] > 0) format(Arma4, sizeof(Arma4), "4. %s [Muni��o:%d]", GunNames[ArmaData[PlayerInfo[playerid][pSlot4]][ArmaModelo]], PlayerInfo[playerid][pSlot4a]);
						else format(Arma4, sizeof(Arma4), "4. Vazio [Muni��o:0]");
						if(PlayerInfo[playerid][pSlot5] > 0) format(Arma5, sizeof(Arma5), "5. %s [Muni��o:%d]", GunNames[ArmaData[PlayerInfo[playerid][pSlot5]][ArmaModelo]], PlayerInfo[playerid][pSlot5a]);
						else format(Arma5, sizeof(Arma5), "5. Vazio [Muni��o:0]");

						SendClientMessage(IdQVaiVer, COLOR_LIGHTGREEN, "_______Invent�rio de armas:_______");
						format(Armas, sizeof(Armas), "Na m�o: %s | No corpo: %s", GunNames[ArmaData[PlayerInfo[playerid][pArmaMao]][ArmaModelo]], GunNames[ArmaData[PlayerInfo[playerid][pColde]][ArmaModelo]]); SendClientMessage(IdQVaiVer, COLOR_WHITE, Armas);
						format(Armas, sizeof(Armas), "%s %s %s", Arma1, Arma2, Arma3); SendClientMessage(IdQVaiVer, COLOR_WHITE, Armas);
						format(Armas, sizeof(Armas), "%s %s", Arma4, Arma5); SendClientMessage(IdQVaiVer, COLOR_WHITE, Armas);
						//=======================================================================================================================
						new Ammo1[126],Ammo2[126],Ammo3[126],Ammo4[126],Ammos[526];
						if(PlayerInfo[playerid][pMun9mm] > 0) format(Ammo1, sizeof(Ammo1), "1. 9mm [%d balas]", PlayerInfo[playerid][pMun9mm]); else format(Ammo1, sizeof(Ammo1), "1. 9mm [Muni��o:0]");
						if(PlayerInfo[playerid][pMun556] > 0) format(Ammo2, sizeof(Ammo2), "2. 5x56mm [%d balas]", PlayerInfo[playerid][pMun556]); else format(Ammo2, sizeof(Ammo2), "2. 5x56mm [Muni��o:0]");
						if(PlayerInfo[playerid][pMunCart] > 0) format(Ammo3, sizeof(Ammo3), "3. Cartucho [%d cartuchos]", PlayerInfo[playerid][pMunCart]); else format(Ammo3, sizeof(Ammo3), "3. Cartucho [0 cartuchos]");
						if(PlayerInfo[playerid][pMun127] > 0) format(Ammo4, sizeof(Ammo4), "4. 12.7x106mm [%d balas]", PlayerInfo[playerid][pMun127]); else format(Ammo4, sizeof(Ammo4), "4. 12.7x106mm [%d balas]");

						SendClientMessage(IdQVaiVer, COLOR_LIGHTGREEN, "_______Invent�rio de muni��es:_______");
						format(Ammos, sizeof(Ammos), "%s %s", Ammo1, Ammo2); SendClientMessage(IdQVaiVer, COLOR_WHITE, Ammos);
						format(Ammos, sizeof(Ammos), "%s %s", Ammo2, Ammo4); SendClientMessage(IdQVaiVer, COLOR_WHITE, Ammos);
						//=======================================================================================================================
						ShowDrugs(IdQVaiVer, playerid);
						//=======================================================================================================================

						//=======================================================================================================================
						new strSendoRevistado[128];
						format(strSendoRevistado, sizeof(strSendoRevistado), "%s esta revistando voc�.", PlayerName(playerid, 1));
						SendClientMessage(playerid, COLOR_COPDUTY, strSendoRevistado);
						SetPVarInt(playerid, "QuerRevistar", 9999);
					}
				}
			}
		else
		{
  			SendClientMessage(playerid,COLOR_LIGHTRED,"Voc� n�o est� pr�ximo deste jogador!");
		}
	}
	return 1;
}
