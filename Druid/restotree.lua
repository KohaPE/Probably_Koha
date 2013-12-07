--Raid Healing Code

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
ProbablyEngine.rotation.register_custom(105, "The Tree of Life", {


--Innervate
{ "Innervate", "player.mana < 80", "player" },

--Survival
{ "Barkskin", "player.health < 30" },


--Cooldowns
{ "Natures Vigil", "modifier.cooldowns" },

-- Dispell
{ "Nature's Cure", "@coreHealing.needsDispelled('Aqua Bomb')" },


--Healing
{ "Tranquility", "modifier.shift" },
{ "Tranquility", { "@coreHealing.needsHealing(60, 4)", "lowest" }},
{ "Genesis", { "@coreHealing.needsHealing(50, 3)", "lowest.buff(Rejuvenation)", }, "lowest" },
{ "Regrowth", { "player.buff(Clearcasting)", "!lowest.buff(Regrowth)", "lowest.health < 90", }},
{ "Healing Touch", { "player.buff(Clearcasting)", "lowest.buff(Regrowth)", "lowest.health < 90", }},
{ "Lifebloom", { "!tank.buff(Lifebloom).count = 3", "lowest.health < 99", }},
{ "Lifebloom", "tank.buff(Lifebloom).duration <= 3" },

--Wild Mushroom
{ "Wild Mushroom", "@coreHealing.needsHealing(99, 3)", "lowest" },
{ "Wild Growth", "@coreHealing.needsHealing(87, 3)", "lowest" },
{ "Rejuvenation", { "@coreHealing.needsHealing(78, 1)", "!lowest.buff(Rejuvenation)", }, "lowest" },
{ "Swiftmend", { "@coreHealing.needsHealing(70, 1)", "lowest.buff(Rejuvenation)", }, "lowest" },
{ "Force of Nature", "@coreHealing.needsHealing(90, 4)", "lowest" },
{ "Wild Mushroom: Bloom", "@coreHealing.needsHealing(60, 5)", "lowest" },
{ "Regrowth", { "@coreHealing.needsHealing(50, 1)", "!lowest.buff(Regrowth)", }, "lowest" },

--Instant Healing Touch
{ "Nature's Swiftness", "@coreHealing.needsHealing(30, 1)", "lowest" },
{ "Healing Touch", "@coreHealing.needsHealing(40, 1)", "lowest" },

-- Out Of Combat
},
{
--Buffs
{ "Mark of the Wild", "!player.buff(Mark of the Wild)" },

})