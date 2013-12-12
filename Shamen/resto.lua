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

--buffs
{ "Unleash Elements", { "modifier.shift", "@coreHealing.needsHealing(99, 1)" }, "lowest" },
{ "Water Shield", "!player.buff" },

--Healing Rain
{ "Unleash Elements", { "modifier.shift", "lowest.health <= 100" }},
{ "Healing Rain", "modifier.shift", "ground" },

--Interupts
{ "Wind Shear", "modifier.interrupt" },
{ "Spiritwalker's Grace", { "lowest.health < 50", "player.moving" }},

--Totems
{ "Healing Stream Totem", { "@coreHealing.needsHealing(98, 2)" }, "lowest" },
{ "Healing Tide Totem", { "@coreHealing.needsHealing(60, 3)" }, "lowest" },
{ "Mana Tide Totem", "player.mana < 30" },
{ "Totemic Recall", { "player.glyph(41535).exists", "player.totem(Healing Stream Totem).duration <= 2", }},
{ "Lightning Bolt", { "lowest.health > 50", "player.mana < 15" }},

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
--5.4 Healing
  
--Auto Target Enemy on DPS Toggle
{ "!/targetenemy [noharm]", { "toggle.dps", "!target.alive", "!target.enemy", "!target.exists", }},

{{
--Tank/Focus Healing
{ "Earth Shield", { "tank.exists", "!tank.buff(Earth Shield)", "!tank.buff(Water Sheild)", }, "tank" },
{ "Riptide", { "!tank.buff", "tank.health < 100" }},
}, "!tank.range > 40" },

{{
--Heavy Healing
{ "Healing Surge", "lowest.health < 40", "lowest" },

--Moderate Healing

{ "Chain Heal", "@coreHealing.needsHealing(94, 3)", "lowest" },
{ "Greater Healing Wave", "lowest.health < 60", "lowest" },


--Basic Healing
{ "Riptide", { "lowest.health < 99", "!lowest.buff(Riptide)" }, "lowest" },
{ "Healing Wave", "lowest.health < 90", "lowest" },
}, "!lowest.range > 40" },

{{
{ "Lightning Bolt", "!target.range > 29" },
}, "toggle.dps" },



},
--Out of Combat
{
{ "Earthliving Weapon", "!player.enchant.mainhand" },
{ "Water Shield", "!player.buff" },
{ "Unleash Elements", { "modifier.shift", "@coreHealing.needsHealing(99, 1)" }, "lowest" },
{ "Healing Rain", "modifier.shift", "ground" },
{ "Greater Healing Wave", "@coreHealing.needsHealing(60, 1)", "lowest" },
{ "Healing Wave", "@coreHealing.needsHealing(93, 1)", "lowest" },
{ "Totemic Recall", { "player.glyph(41535).exists", "player.totem(Healing Stream Totem).duration <= 2", }},

}, function()
ProbablyEngine.toggle.create('dps', 'Interface\\Icons\\spell_nature_lightning', 'DPS', 'Toggle for Lightning Bolt Mana Return')

end)