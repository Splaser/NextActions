function getNA6Actions(no)
  if(no < 0)then return {};
  elseif(no == 0)then
    return {'49998','48707','48792','符能转换','死亡虹吸','天灾契约','灵魂收割','51271','47568','亡者大军','湮没','爆发','49184','暗影打击','49143','冰冷触摸','凋零缠绕','血魔之握','61999','57330'};
  elseif(no == 1)then
    return {'49998','48707','冰封之韧','符能转换','死亡虹吸','55233','天灾契约','灵魂收割','符文武器增效','49028','56222','冰冷触摸','凋零缠绕','白骨之盾','爆发','暗影打击','50842','108199','61999','巫妖之躯','冷酷严冬','寒冬号角'};
  elseif(no == 2)then
    return {'49998','48707','48792','符能转换','死亡虹吸','天灾契约','灵魂收割','51271','47568','亡者大军','49143','49184','暗影打击','湮没','吸血瘟疫','血魔之握','爆发','61999','57330','冰冷触摸'};
  elseif(no == 3)then
    return {'61999'};
  end
  return {};
end

NA6ProfileNames = {[0]='Two-Handed Frost',[1]='Blood',[2]='Dual-Wield Frost',[3]='Unholy',};

function NA6Dps()
  W_Log(1,"死亡骑士 dps");
  
	local hasBoneshield=not(NA_ProfileNo == 1) or W_HasBuff(NA_Player, 49222, true);  --白骨之盾
	local haswyzq=W_HasBuff(NA_Player, 49039, true);  --巫妖之躯
	
	
	
	
  if(W_IsInCombat())then
    if(NA_ProfileNo < 0)then return false; --保命施法
    elseif(NA_ProfileNo == 0)then --Two-Handed Frost
      
      if(false
					or NA_Fire(NA_checkHP(2), '49998', NA_Target) --灵界打击
					or NA_Fire(NA_checkHP(2), '48707', NA_Player) --反魔法护罩
					or NA_Fire(NA_checkHP(0), '48792', NA_Player) --冰封之韧
					or NA_Fire(NA_isUsableTalentSpell(5,3) and NA_checkHP(0), '符能转换', NA_Player) --符能转换
					or NA_Fire(NA_isUsableTalentSpell(5,2) and NA_checkHP(0), '死亡虹吸', NA_Player) --死亡虹吸
					or NA_Fire(NA_isUsableTalentSpell(5,1) and NA_checkHP(0), '天灾契约', NA_Player) --天灾契约

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Blood
      
      if(false
					or NA_Fire(NA_checkHP(2), '49998', NA_Target) --灵界打击
					or NA_Fire(NA_checkHP(2), '48707', NA_Player) --反魔法护罩
					or NA_Fire(NA_checkHP(0), '冰封之韧', NA_Player) --冰封之韧
					or NA_Fire(NA_isUsableTalentSpell(5,3) and NA_checkHP(0), '符能转换', NA_Player) --符能转换
					or NA_Fire(NA_isUsableTalentSpell(5,2) and NA_checkHP(0), '死亡虹吸', NA_Player) --死亡虹吸
					or NA_Fire(NA_isUsableTalentSpell(2,1) and NA_checkHP(0), '巫妖之躯', NA_Player) --巫妖之躯
					or NA_Fire(NA_isUsableTalentSpell(2,1) and NA_checkHP(0) and W_RetainBuff(NA_Player, 49039, true), '凋零缠绕', NA_Player) --凋零缠绕
					or NA_Fire(NA_checkHP(0), '55233', NA_Player) --吸血鬼之血
					or NA_Fire(NA_isUsableTalentSpell(5,1) and NA_checkHP(0), '天灾契约', NA_Player) --天灾契约
					or NA_Fire(not hasBoneshield, '白骨之盾', NA_Player) --白骨之盾
					or NA_Fire(NA_isUsableTalentSpell(6,2), '冷酷严冬', NA_Player) --冷酷严冬

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Dual-Wield Frost
      
      if(false
					or NA_Fire(NA_checkHP(2), '49998', NA_Target) --灵界打击
					or NA_Fire(NA_checkHP(2), '48707', NA_Player) --反魔法护罩
					or NA_Fire(NA_checkHP(0), '48792', NA_Player) --冰封之韧
					or NA_Fire(NA_isUsableTalentSpell(5,3) and NA_checkHP(0), '符能转换', NA_Player) --符能转换
					or NA_Fire(NA_isUsableTalentSpell(5,2) and NA_checkHP(0), '死亡虹吸', NA_Player) --死亡虹吸
					or NA_Fire(NA_isUsableTalentSpell(5,1) and NA_checkHP(0), '天灾契约', NA_Player) --天灾契约

      )then return true; end
    elseif(NA_ProfileNo == 3)then --Unholy
      
      if(false

      )then return true; end

    end
    if(W_TargetCanAttack()) then  --攻击施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Two-Handed Frost
        local hasKillingMachine = W_HasBuff(NA_Player, 51124, true);  --杀戮机器
				local hasFreezingFog = W_HasBuff(NA_Player, 59052, true);   --冰冻之雾
				local hasRime = W_HasBuff(NA_Player, 59057, true);   --白霜
				local retainFrostFever = W_RetainBuff(NA_Target, -55095, true);   --冰霜疫病
				local retainBloodPlague = W_RetainBuff(NA_Target, -55078, true);    --血之疫病
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_checkHP(2), '49998', NA_Target) --灵界打击
					or NA_Fire(NA_checkHP(2), '48707', NA_Player) --反魔法护罩
					or NA_Fire(NA_checkHP(0), '48792', NA_Player) --冰封之韧
					or NA_Fire(NA_isUsableTalentSpell(5,3) and NA_checkHP(0), '符能转换', NA_Player) --符能转换
					or NA_Fire(NA_isUsableTalentSpell(5,2) and NA_checkHP(0), '死亡虹吸', NA_Player) --死亡虹吸
					or NA_Fire(NA_isUsableTalentSpell(5,1) and NA_checkHP(0), '天灾契约', NA_Player) --天灾契约
					or NA_Fire(W_HPlevel(NA_Target) < 0.35, '灵魂收割', NA_Target) --灵魂收割
					or NA_Fire(NA_IsSolo or NA_IsMaxDps, '51271', NA_Target) --冰霜之柱
					or NA_Fire(NA_IsMaxDps, '47568', NA_Target) --符文武器增效
					or NA_Fire(NA_IsMaxDps, '亡者大军', NA_Target) --亡者大军
					or NA_Fire(NA_checkHP(2) and W_HasBuff(NA_Player, 178819, true), '49998', NA_Target) --灵界打击
					or NA_Fire(hasKillingMachine and retainFrostFever and retainBloodPlague, '湮没', NA_Target) --湮没
					or NA_Fire(not retainFrostFever and not retainBloodPlague, '爆发', NA_Target) --爆发
					or NA_Fire(not retainFrostFever, '49184', NA_Target) --凛风冲击
					or NA_Fire(not retainBloodPlague, '暗影打击', NA_Target) --暗影打击
					or NA_Fire(W_StarCount(1)>1 or W_StarCount(2)>1 or W_StarCount(3)>1 or W_StarCount(4)>1, '湮没', NA_Target) --湮没
					or NA_Fire(W_PowerLevel(NA_Player) > 0.7, '49143', NA_Target) --冰霜打击
					or NA_Fire(hasFreezingFog or hasRime, '冰冷触摸', NA_Target) --冰冷触摸
					or NA_Fire(W_PowerLevel(NA_Player) > 0.6, '凋零缠绕', NA_Target) --凋零缠绕
					or NA_Fire(true, '49143', NA_Target) --冰霜打击
					or NA_Fire(true, '湮没', NA_Target) --湮没

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(NA_checkHP(2), '49998', NA_Target) --灵界打击
					or NA_Fire(NA_checkHP(2), '48707', NA_Player) --反魔法护罩
					or NA_Fire(NA_checkHP(0), '48792', NA_Player) --冰封之韧
					or NA_Fire(NA_isUsableTalentSpell(5,3) and NA_checkHP(0), '符能转换', NA_Player) --符能转换
					or NA_Fire(NA_isUsableTalentSpell(5,2) and NA_checkHP(0), '死亡虹吸', NA_Player) --死亡虹吸
					or NA_Fire(NA_isUsableTalentSpell(5,1) and NA_checkHP(0), '天灾契约', NA_Player) --天灾契约
					or NA_Fire(W_HPlevel(NA_Target) < 0.35, '灵魂收割', NA_Target) --灵魂收割
					or NA_Fire(NA_IsSolo, '血魔之握', NA_Target) --血魔之握
					or NA_Fire(NA_IsSolo or NA_IsMaxDps, '51271', NA_Target) --冰霜之柱
					or NA_Fire(NA_IsMaxDps, '47568', NA_Target) --符文武器增效
					or NA_Fire(NA_IsMaxDps, '亡者大军', NA_Target) --亡者大军
					or NA_Fire(NA_checkHP(2) and W_HasBuff(NA_Player, 178819, true), '49998', NA_Target) --灵界打击
					or NA_Fire(not retainFrostFever and not retainBloodPlague, '爆发', NA_Target) --爆发
					or NA_Fire(not retainFrostFever, '49184', NA_Target) --凛风冲击
					or NA_Fire(not retainBloodPlague, '暗影打击', NA_Target) --暗影打击
					or NA_Fire(hasFreezingFog or hasRime, '49184', NA_Target) --凛风冲击
					or NA_Fire(W_StarCount(3)>1 or W_StarCount(4)>1, '49184', NA_Target) --凛风冲击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.7, '49143', NA_Target) --冰霜打击
					or NA_Fire(hasKillingMachine and retainFrostFever and retainBloodPlague, '湮没', NA_Target) --湮没
					or NA_Fire(true, '49184', NA_Target) --凛风冲击
					or NA_Fire(true, '49143', NA_Target) --冰霜打击
					or NA_Fire(true, '暗影打击', NA_Target) --暗影打击

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 1)then --Blood
        local retainFrostFever = W_RetainBuff(NA_Target, -55095, true);   --冰霜疫病
				local retainBloodPlague = W_RetainBuff(NA_Target, -55078, true);  --血之疫病
				local hasCrimsonScourge = W_HasBuff(NA_Player, 81141, true);    --赤色天灾
				local countxzqx = W_BuffCount(NA_Player, 50421); --血之气息
				local countxxcn = W_BuffCount(NA_Player, 114851);  --鲜血充能
				local xdgszx = W_RetainBuff(NA_Player, 152279, true);   --辛达苟萨之息
				local notTanking = not NA_IsSolo and not W_isTanking();
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_checkHP(2), '49998', NA_Target) --灵界打击
					or NA_Fire(NA_checkHP(2), '48707', NA_Player) --反魔法护罩
					or NA_Fire(NA_checkHP(0), '冰封之韧', NA_Player) --冰封之韧
					or NA_Fire(NA_isUsableTalentSpell(5,3) and NA_checkHP(0), '符能转换', NA_Player) --符能转换
					or NA_Fire(NA_isUsableTalentSpell(5,2) and NA_checkHP(0), '死亡虹吸', NA_Player) --死亡虹吸
					or NA_Fire(NA_checkHP(0), '55233', NA_Player) --吸血鬼之血
					or NA_Fire(NA_isUsableTalentSpell(5,1) and NA_checkHP(0), '天灾契约', NA_Player) --天灾契约
					or NA_Fire(W_HPlevel(NA_Target) < 0.35, '灵魂收割', NA_Target) --灵魂收割
					or NA_Fire(NA_IsMaxDps, '符文武器增效', NA_Target) --符文武器增效
					or NA_Fire(NA_IsMaxDps, '49028', NA_Target) --符文刃舞
					or NA_Fire(notTanking, '56222', NA_Target) --黑暗命令
					or NA_Fire(notTanking, '冰冷触摸', NA_Target) --冰冷触摸
					or NA_Fire(notTanking and W_PowerLevel(NA_Player)>0.6, '凋零缠绕', NA_Target) --凋零缠绕
					or NA_Fire(not hasBoneshield, '白骨之盾', NA_Player) --白骨之盾
					or NA_Fire(not retainFrostFever and not retainBloodPlague and not xdgszx, '爆发', NA_Target) --爆发
					or NA_Fire(not retainFrostFever, '冰冷触摸', NA_Target) --冰冷触摸
					or NA_Fire(not retainBloodPlague, '暗影打击', NA_Target) --暗影打击
					or NA_Fire(hasCrimsonScourge or retainFrostFever or retainBloodPlague, '50842', NA_Target) --血液沸腾
					or NA_Fire(xdgszx, '符文武器增效', NA_Player) --符文武器增效
					or NA_Fire(not xdgszx and W_PowerLevel(NA_Player)>0.6, '凋零缠绕', NA_Target) --凋零缠绕
					or NA_Fire((W_StarCount(3)>1 or W_StarCount(4)>1) and (W_StarCount(5)>1 or W_StarCount(6)>1), '49998', NA_Target) --灵界打击
					or NA_Fire(true, '灵魂收割', NA_Target) --灵魂收割

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(NA_checkHP(2), '49998', NA_Target) --灵界打击
					or NA_Fire(NA_checkHP(2), '48707', NA_Player) --反魔法护罩
					or NA_Fire(NA_checkHP(0), '冰封之韧', NA_Player) --冰封之韧
					or NA_Fire(NA_isUsableTalentSpell(5,3) and NA_checkHP(0), '符能转换', NA_Player) --符能转换
					or NA_Fire(NA_isUsableTalentSpell(5,2) and NA_checkHP(0), '死亡虹吸', NA_Player) --死亡虹吸
					or NA_Fire(NA_checkHP(0), '55233', NA_Player) --吸血鬼之血
					or NA_Fire(NA_isUsableTalentSpell(5,1) and NA_checkHP(0), '天灾契约', NA_Player) --天灾契约
					or NA_Fire(W_HPlevel(NA_Target) < 0.35, '灵魂收割', NA_Target) --灵魂收割
					or NA_Fire(NA_IsSolo, '108199', NA_Target) --血魔之握
					or NA_Fire(NA_IsMaxDps, '符文武器增效', NA_Target) --符文武器增效
					or NA_Fire(NA_IsMaxDps, '49028', NA_Target) --符文刃舞
					or NA_Fire(notTanking, '56222', NA_Target) --黑暗命令
					or NA_Fire(notTanking, '冰冷触摸', NA_Target) --冰冷触摸
					or NA_Fire(notTanking and W_PowerLevel(NA_Player)>0.6, '凋零缠绕', NA_Target) --凋零缠绕
					or NA_Fire(not hasBoneshield, '白骨之盾', NA_Player) --白骨之盾
					or NA_Fire(hasCrimsonScourge, '50842', NA_Target) --血液沸腾
					or NA_Fire(not retainFrostFever and not retainBloodPlague, '爆发', NA_Target) --爆发
					or NA_Fire(not retainFrostFever, '冰冷触摸', NA_Target) --冰冷触摸
					or NA_Fire(not retainBloodPlague, '暗影打击', NA_Target) --暗影打击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.6, '凋零缠绕', NA_Target) --凋零缠绕
					or NA_Fire(NA_IsMaxDps and retainFrostFever and retainBloodPlague, '50842', NA_Target) --血液沸腾
					or NA_Fire(W_HPlevel(NA_Player) < 0.8, '49998', NA_Target) --灵界打击
					or NA_Fire(true, '灵魂收割', NA_Target) --灵魂收割
					or NA_Fire(not NA_IsMaxDps, '50842', NA_Target) --血液沸腾

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 2)then --Dual-Wield Frost
        local hasKillingMachine = W_HasBuff(NA_Player, 51124, true);  --杀戮机器
				local hasFreezingFog = W_HasBuff(NA_Player, 59052, true);   --冰冻之雾
				local hasRime = W_HasBuff(NA_Player, 59057, true);   --白霜
				local retainFrostFever = W_RetainBuff(NA_Target, -55095, true);   --冰霜疫病
				local retainBloodPlague = W_RetainBuff(NA_Target, -55078, true);    --血之疫病
				
				
        
        if(not NA_IsAOE and (false
					or NA_Fire(NA_checkHP(2), '49998', NA_Target) --灵界打击
					or NA_Fire(NA_checkHP(2), '48707', NA_Player) --反魔法护罩
					or NA_Fire(NA_checkHP(0), '48792', NA_Player) --冰封之韧
					or NA_Fire(NA_isUsableTalentSpell(5,3) and NA_checkHP(0), '符能转换', NA_Player) --符能转换
					or NA_Fire(NA_isUsableTalentSpell(5,2) and NA_checkHP(0), '死亡虹吸', NA_Player) --死亡虹吸
					or NA_Fire(NA_isUsableTalentSpell(5,1) and NA_checkHP(0), '天灾契约', NA_Player) --天灾契约
					or NA_Fire(W_HPlevel(NA_Target) < 0.35, '灵魂收割', NA_Target) --灵魂收割
					or NA_Fire(NA_IsSolo or NA_IsMaxDps, '51271', NA_Target) --冰霜之柱
					or NA_Fire(NA_IsMaxDps, '47568', NA_Target) --符文武器增效
					or NA_Fire(NA_IsMaxDps, '亡者大军', NA_Target) --亡者大军
					or NA_Fire(NA_checkHP(2) and W_HasBuff(NA_Player, 178819, true), '49998', NA_Target) --灵界打击
					or NA_Fire(hasKillingMachine or W_PowerLevel(NA_Player) > 0.88, '49143', NA_Target) --冰霜打击
					or NA_Fire(W_StarCount(3)>1 and W_StarCount(4)>1, '49184', NA_Target) --凛风冲击
					or NA_Fire(not retainBloodPlague, '暗影打击', NA_Target) --暗影打击
					or NA_Fire(hasRime, '49184', NA_Target) --凛风冲击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.76, '49143', NA_Target) --冰霜打击
					or NA_Fire((W_StarCount(1)>0 or W_StarCount(2)>0 or W_StarCount(3)>0 or W_StarCount(4)>0) and hasKillingMachine, '湮没', NA_Target) --湮没
					or NA_Fire(true, '49184', NA_Target) --凛风冲击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.40, '49143', NA_Target) --冰霜打击
					or NA_Fire(true, '吸血瘟疫', NA_Target) --吸血瘟疫

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false
					or NA_Fire(NA_checkHP(2), '49998', NA_Target) --灵界打击
					or NA_Fire(NA_checkHP(2), '48707', NA_Player) --反魔法护罩
					or NA_Fire(NA_checkHP(0), '48792', NA_Player) --冰封之韧
					or NA_Fire(NA_isUsableTalentSpell(5,3) and NA_checkHP(0), '符能转换', NA_Player) --符能转换
					or NA_Fire(NA_isUsableTalentSpell(5,2) and NA_checkHP(0), '死亡虹吸', NA_Player) --死亡虹吸
					or NA_Fire(NA_isUsableTalentSpell(5,1) and NA_checkHP(0), '天灾契约', NA_Player) --天灾契约
					or NA_Fire(W_HPlevel(NA_Target) < 0.35, '灵魂收割', NA_Target) --灵魂收割
					or NA_Fire(NA_IsSolo, '血魔之握', NA_Target) --血魔之握
					or NA_Fire(NA_IsSolo or NA_IsMaxDps, '51271', NA_Target) --冰霜之柱
					or NA_Fire(NA_IsMaxDps, '47568', NA_Target) --符文武器增效
					or NA_Fire(NA_IsMaxDps, '亡者大军', NA_Target) --亡者大军
					or NA_Fire(NA_checkHP(2) and W_HasBuff(NA_Player, 178819, true), '49998', NA_Target) --灵界打击
					or NA_Fire(not retainFrostFever and not retainBloodPlague, '爆发', NA_Target) --爆发
					or NA_Fire(not retainFrostFever, '49184', NA_Target) --凛风冲击
					or NA_Fire(not retainBloodPlague, '暗影打击', NA_Target) --暗影打击
					or NA_Fire(hasFreezingFog or hasRime, '49184', NA_Target) --凛风冲击
					or NA_Fire(W_StarCount(3)>1 or W_StarCount(4)>1, '49184', NA_Target) --凛风冲击
					or NA_Fire(W_PowerLevel(NA_Player) > 0.7, '49143', NA_Target) --冰霜打击
					or NA_Fire(hasKillingMachine and retainFrostFever and retainBloodPlague, '湮没', NA_Target) --湮没
					or NA_Fire(true, '49184', NA_Target) --凛风冲击
					or NA_Fire(true, '49143', NA_Target) --冰霜打击
					or NA_Fire(true, '暗影打击', NA_Target) --暗影打击

          or NA_fireByOvale()
        ))then return true; end
      elseif(NA_ProfileNo == 3)then --Unholy
        
				
        
        if(not NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end

        if(NA_IsAOE and (false

          or NA_fireByOvale()
        ))then return true; end
      end
    elseif(UnitCanAssist(NA_Player, NA_Target))then --辅助施法
      if(NA_ProfileNo < 0)then return false;
      elseif(NA_ProfileNo == 0)then --Two-Handed Frost
        
				
        if(false
					or NA_Fire(UnitIsDead(NA_Target), '61999', NA_Target) --复活盟友

        )then return true; end
      elseif(NA_ProfileNo == 1)then --Blood
        
				
        if(false
					or NA_Fire(UnitIsDead(NA_Target), '61999', NA_Target) --复活盟友

        )then return true; end
      elseif(NA_ProfileNo == 2)then --Dual-Wield Frost
        
				
        if(false
					or NA_Fire(UnitIsDead(NA_Target), '61999', NA_Target) --复活盟友

        )then return true; end
      elseif(NA_ProfileNo == 3)then --Unholy
        
				
        if(false
					or NA_Fire(UnitIsDead(NA_Target), '61999', NA_Target) --复活盟友

        )then return true; end
      end
    end
  else  --不在战斗中
    if(NA_ProfileNo < 0)then return false; --脱战后补buff，开怪等
    elseif(NA_ProfileNo == 0)then --Two-Handed Frost
      
      if(false
					or NA_Fire(select(3,UnitStat(NA_Player,1))==0, '57330', NA_Player) --寒冬号角
					or NA_Fire(NA_IsSolo and NA_isUsableTalentSpell(5,3) and W_HPlevel(NA_Player) < 0.7, '符能转换', NA_Player) --符能转换
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '冰冷触摸', NA_Target) --冰冷触摸

      )then return true; end
    elseif(NA_ProfileNo == 1)then --Blood
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 57330, true), '寒冬号角', NA_Player) --寒冬号角
					or NA_Fire(not hasBoneshield, '白骨之盾', NA_Player) --白骨之盾
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '冰冷触摸', NA_Target) --冰冷触摸

      )then return true; end
    elseif(NA_ProfileNo == 2)then --Dual-Wield Frost
      
      if(false
					or NA_Fire(not W_HasBuff(NA_Player, 57330, true), '57330', NA_Player) --寒冬号角
					or NA_Fire(NA_IsSolo and NA_isUsableTalentSpell(5,3) and W_HPlevel(NA_Player) < 0.7, '符能转换', NA_Player) --符能转换
					or NA_Fire(NA_IsSolo and W_TargetCanAttack(), '冰冷触摸', NA_Target) --冰冷触摸

      )then return true; end
    elseif(NA_ProfileNo == 3)then --Unholy
      
      if(false

      )then return true; end
    end
  end
  return false;
end
