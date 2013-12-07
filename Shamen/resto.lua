-- SPEC ID 263

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
-- ProbablyEngine Rotation Packager
-- Custom Resto Druid Rotation
-- Created on Nov 2nd 2013 1:03 am
ProbablyEngine.rotation.register_custom(264, "RestoShamenKoha", {

  -- aoe
 -- { "Unleash Elements", { "@coreHealing.needsHealing(99, 1)", "lowest", "modifier.shift", }},
  { "Healing Rain", "modifier.shift", "ground" },


  -- buffs
  { "Earthliving Weapon", "!player.enchant.mainhand" },
  { "Water Shield", "!player.buff(Water Shield)" },

  -- tank
  { "Earth Shield", "!focus.buff(Earth Shield).count < 1" },
  { "Earth Shield", "!tank.buff(Earth Shield).count < 1" },
  --{ "Riptide", "!tank.buff(Riptide)" },
  { "Riptide", { "@coreHealing.needsHealing(95, 1)", "!lowest.buff(Riptide)", }, "lowest" },

  -- healing totem
  { "Healing Stream Totem", "@coreHealing.needsHealing(97, 4)", "lowest" },
  { "Mana Tide Totem", "player.mana < 40" },
  { "Healing Tide Totem", "@coreHealing.needsHealing(60, 4)", "lowest" },

  -- Dispell
  { "Purify Spirit", "@coreHealing.needsDispelled('Aqua Bomb')" },

  -- Unleash Life
  { "Greater Healing Wave", {
    "lowest.health < 50",
    "player.buff(Unleash Life)",
  }, "lowest" },
  { "Unleash Elements", "lowest.health < 50" },

  { "Healing Wave", {
    "lowest.health < 91",
    "lowest.debuff(Chomp)"
  }},

  -- regular healing
  { "Healing Surge", "@coreHealing.needsHealing(40, 1)", "lowest" },
  { "Greater Healing Wave", {
  	"@coreHealing.needsHealing(55, 1)",
    "player.buff(Tidal Waves).count = 2",
    "lowest",
  }},
  { "Riptide", { "@coreHealing.needsHealing(95, 1)", "!lowest.buff(Riptide)", }, "lowest" },
  { "Chain Heal", "@coreHealing.needsHealing(90, 4)", "lowest" },
  { "Healing Wave", "@coreHealing.needsHealing(85, 1)", "lowest", },
  { "Lightning Bolt", "player.mana < 60" },

},
{
  { "Earthliving Weapon", "!player.enchant.mainhand" },
  { "Water Shield", "!player.buff(Water Shield)" },
})