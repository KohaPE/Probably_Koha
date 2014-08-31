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

{ "Divine Plea", "player.mana <= 85" },

{ "Light's Hammer", "modifier.shift", "ground" },

--Tank Healing/Becon Tank
{ "Beacon of Light", "!focus.buff(Beacon of Light)", "focus" },
{ "Eternal Flame", { "!focus.buff(Eternal Flame)" , "!focus.range > 39" }, "focus" },

--Healing
{ "Holy Shock", { "player.buff(Daybreak)", "@coreHealing.needsHealing(98, 2)" }, "lowest" },
{ "Eternal Flame", { "player.buff(Divine Purpose)", "lowest.health <= 80" }, "lowest" },
{ "Light of Dawn", { "player.buff(Divine Purpose)", "@coreHealing.needsHealing(99, 3)" }, "lowest"},
{ "Holy Shock", {"player.holypower < 5", "lowest.health < 95"}, "lowest" },
{ "Light of Dawn", { "@coreHealing.needsHealing(98, 3)", "player.holypower >= 3" } , "lowest"},
{ "Eternal Flame", { "lowest.health < 96", "player.holypower >= 3"} , "lowest"},
{ "Divine Light", "@coreHealing.needsHealing(50, 1)", "lowest"},
{ "Flash of Light", "@coreHealing.needsHealing(40, 1)", "lowest" },
{ "Holy Radiance", "@coreHealing.needsHealing(94, 3)", "lowest" },
{ "Holy Light", "@coreHealing.needsHealing(96, 1)", "lowest" },



},
--Out of Combat
{
-- Seal Check
{ "Seal of Insight", "player.seal != 3" },
{ "Holy Shock", "player.holypower < 5" },

})