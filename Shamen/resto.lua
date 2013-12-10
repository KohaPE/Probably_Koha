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

-- Custom Resto Shaman Rotation v0.1

ProbablyEngine.rotation.register_custom(264, "Koha's Resto Shamen", {

--Healing Rain
{ "Unleash Elements", { "modifier.shift", "@coreHealing.needsHealing(99, 1)" }, "lowest" },
{ "Healing Rain", "modifier.shift", "ground" },

--Interupts
{ "Wind Shear", "modifier.interupt" },

--Totems
{ "Healing Stream Totem", { "@coreHealing.needsHealing(98, 1)" }, "lowest" },
{ "Healing Tide Totem", { "@coreHealing.needsHealing(60, 5)" }, "lowest" },
{ "Mana Tide Totem", "player.mana < 30" },
{ "Totemic Recall", { "player.glyph(41535).exists", "player.totem(Healing Stream Totem).duration <= 2", }},

--Cooldowns
{ "Spiritwalker's Grace", { "player.moving", "modifier.cooldowns", }},
{ "Ascendance", "modifier.cooldowns" },
{ "Bloodlust", { "modifier.cooldowns","!debuff.any(Sated)" }},

--Dispell
  { "Purify Spirit", "@coreHealing.needsDispelled('Aqua Bomb')" },
--SoO Dispells 
  { "Purify Spirit", "@coreHealing.needsDispelled('Shadow Word: Bane')" },
  { "Purify Spirit", "@coreHealing.needsDispelled('Lingering Corruption')" },
  { "Purify Spirit", { "player.buff(Power of the Titans)", "@coreHealing.needsDispelled('Mark of Arrogance')", }}, 
  { "Purify Spirit", "@coreHealing.needsDispelled('Corrosive Blood')" },

--Auto Target Enemy on DPS Toggle
{ "!/targetenemy [noharm]", { "toggle.dps", "!target.alive", "!target.enemy", "!target.exists", }},


--Tank/Focus Healing
{ "Earth Shield", { "!tank.buff(Earth Shield)", "!tank.buff(Water Sheild)", }, "tank" },
{ "Riptide", { "@coreHealing.needsHealing(99, 1)", "!tank.buff(Riptide)", "tank" }},

--Heavy Healing
{ "Healing Surge", "@coreHealing.needsHealing(40, 1)", "lowest" },
{ "Greater Healing Wave", "@coreHealing.needsHealing(60, 1)", "lowest" },

--Moderate Healing
{ "Chain Heal", "@coreHealing.needsHealing(87, 3)", "lowest" },

--Basic Healing
{ "Riptide", { "@coreHealing.needsHealing(95, 1)", "!lowest.buff(Riptide)", }, "lowest" },
{ "Healing Wave", "@coreHealing.needsHealing(93, 1)", "lowest" },

--DPS Toggle for Mana
{{
{ "Lightning Bolt", "target.range <= 29" },
}, "toggle.dps" },


},
--Out of Combat
{
{ "Earthliving Weapon", "!player.enchant.mainhand" },
{ "Water Shield", "!player.buff" },
{ "Healing Rain", "modifier.shift", "ground" },
{ "Greater Healing Wave", "@coreHealing.needsHealing(60, 1)", "lowest" },
{ "Chain Heal", "@coreHealing.needsHealing(87, 3)", "lowest" },
{ "Healing Wave", "@coreHealing.needsHealing(93, 1)", "lowest" },
{ "Totemic Recall", { "player.glyph(41535).exists", "player.totem(Healing Stream Totem).duration <= 2", }},

}, function()
ProbablyEngine.toggle.create('dps', 'Interface\\Icons\\spell_nature_lightning', 'DPS', 'Toggle for Lightning Bolt Mana Return')

end)