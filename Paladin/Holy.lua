ProbablyEngine.library.register('coreHealing', {
  needsHealing = function(percent, count)
    return ProbablyEngine.raid.needsHealing(tonumber(percent)) >= count
  end,
  needsDispelled = function(spell)
    for unit,_ in pairs(ProbablyEngine.raid.roster) do
      if UnitDebuff(unit, spell) then
        ProbablyEngine.dsl.parsedTarget = unit
        return true
      end
    end
  end,
})

--Koha's Holy Paladin
ProbablyEngine.rotation.register_custom(65, "Koha's Holy Pally", {

-- Seal Check
{ "Seal of Insight", "player.seal != 3" },

-- Trinkets
{ "#gloves" },

-- Cooldowns
{{
{ "Devine Favor" },
{ "Avenging Wrath" },
{ "Guardian of Ancient Kings" },
}, "modifier.cooldowns" },

--Tank Healing/Becon Tank
{ "Beacon of Light", "!tank.buff(Beacon of Light)", "tank" },

--Healing
{{
{ "Holy Shock", { "player.buff(Daybreak)", "@coreHealing.needsHealing(98, 2)" }},
{ "Holy Shock", "player.holypower < 5" },
{ "Light of Dawn", { "@coreHealing.needsHealing(95, 6)", "player.holypower >= 3", }},
{ "Eternal Flame", "player.holypower >= 3" },
{ "Divine Light", "@coreHealing.needsHealing(50, 1)" },
{ "Flash of Light", "@coreHealing.needsHealing(40, 1)" },
{ "Holy Radiance", "@coreHealing.needsHealing(94, 3)" },
{ "Holy Light", "@coreHealing.needsHealing(96, 1)" },
}, "lowest" },

},
--Out of Combat
{
-- Seal Check
{ "Seal of Insight", "player.seal != 3" },

})