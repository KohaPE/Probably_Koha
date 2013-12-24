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
{ "29166", "player.mana < 80", "player" }, --Innervate if player's mana is lower then 80%
{ "145205", "modifier.shift", "mouseover" }, --Mushroom Placement

--Survival
{ "22812", "player.health < 30" }, --Barkskin if player's health is lower then 30%


--Cooldowns
{ "124974", "modifier.cooldowns" }, --Nature's Vigil when cooldowns are enabled
{ "106731", { "modifier.cooldowns", "@coreHealing.needsHealing(50, 5)" }, "player" }, --Incarnation if 5 people are under 50%

--Defensive Cooldowns
{ "102342", "tank.health < 60", "tank" }, --Iron Bark on tank below 60% health
{ "102342", "lowest.health < 60", "lowest" }, --Iron Bark on lowest target below 60% health
{ "123158", "lowest.health <= 40" },
{ "5185", { "player.buff(132158)", "lowest.health < 40", }},

{{														--Range check Nested Command for healing.
-- Dispell
{ "88423", "@coreHealing.needsDispelled(Aqua Bomb)" }, -- Nature's Cure if player needs Aqua Bomb dispelled.
{ "88423", "@coreHealing.needsDispelled(Aqua Bomb)" },  -- Aqua Bomb (Proving Grounds)
{ "88423", "@coreHealing.needsDispelled(Shadow Word: Bane)" }, -- Shadow Word: Bane (Fallen Protectors)
{ "88423", "@coreHealing.needsDispelled(Lingering Corruption)" },-- Lingering Corruption (Norushen)
{ "88423", { "player.buff(144359)", "@coreHealing.needsDispelled(Mark of Arrogance)" }}, -- Mark of Arrogance (Sha of Pride) 
{ "88423", "@coreHealing.needsDispelled(Corrosive Blood)" },  -- Corrosive Blood (Thok)
{ "8936", { "lowest.health < 100", "!lowest.buff(8936)" }, "target.id(71604)" },
{ "5185", { "lowest.health < 100", "lowest.buff(8936)", }, "target.id(71604)" },

--Clear Casting Procs
{ "740", "@coreHealing.needsHealing(67, 7)" }, --Tranquility if 7 players below 67%
{ "8936", { "!modifier.last(8936)", "player.buff(16870)", "!lowest.buff(8936)", "lowest.health <= 95", }}, --Regrowth if Clear cast, Lowest raid health less then 95% and tank is within range
{ "5185", { "player.buff(16870)", "lowest.health <= 80", }}, --Healing Touch if clear cast, Lowest raid health less then 80 and tank is within range

--Tank Healing
{ "33763", { "!tank.buff(33763).count = 3", "tank.health < 99", }}, --LifeBloom if tank/focus missing 3 stacks of life Bloom
{ "33763", "focus.buff(33763).duration <= 3", "focus" }, --LifeBloom if 3 seconds left so stacks dont fall off.
{ "8936", { "focus.health <= 45", "!focus.buff(8936)", }}, --Regrowth tank if health is under 45% and hasn't got a regrowth on.

--Healing
{ "145518", { "@coreHealing.needsHealing(70, 3)", "lowest.buff(774)", "!modifer.last(145518)", }}, --Genesis if 3 players below 70 and have the buff rejv
{ "145205", "@coreHealing.needsHealing(98, 5)" },
{ "102693", { "lowest.health < 97", "!modifier.last(102693)", }}, --Force of Nature if player is below 97%
{ "18562", { "lowest.health <= 75", "lowest.buff(774)", }, "lowest" }, --Swift mend if player has rejuv buff and is below 70%
{ "18562", { "lowest.health <= 75", "lowest.buff(8936)", }, "lowest" }, --Swiftmend if player has regrowth buff and is below 70%
{ "48438", "@coreHealing.needsHealing(90, 3)", "lowest" }, --Wild Growth if 3 raid members are under 90%
{ "8936", { "lowest.health <= 50", "!lowest.buff(8936)", }}, -- Regrowth lowest raid member if health is below 50% and doesnt have a regrowth buff
{ "774", { "lowest.health <= 85", "!lowest.buff(774)", }}, --Rejevenate lowest raid memeber if health is below 85% and doesnt have rejuv buff
{ "50464", { "!player.buff(100977)", "focus.health <= 100" }}, -- noruish to keep up H
{ "50464", "lowest.health <= 90" }, -- Nourish if target health below 90%


}, "lowest.range < 40", },



-- Out Of Combat
},
{
--Buffs
{ "1126", "!player.buff(1126)" }, --Mark of the Wild if missing buff
{ "145205", "modifier.shift", "mouseover" }, --Mushroom Placement

})