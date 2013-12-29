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

ProbablyEngine.rotation.register_custom(105, "The Tree of Life", {

  --==========================================--
  --     Racials Support for All Races      --
  --      We arent racist here at PE        --
  --        Except to Blood-Elves           --
  --          You fucking suck              --
  --=========================================--
  --           Support added by              --
  --                Imogen                   --
  --=========================================--

  -- Dwarves
  { "Stoneform", "player.health <= 65" },
 
  -- Humans (Sexist fuckers)
  { "Every Man for Himself", "player.state.charm" },
  { "Every Man for Himself", "player.state.disorient" },
  { "Every Man for Himself", "player.state.fear" },
  { "Every Man for Himself", "player.state.incapacitate" },
  { "Every Man for Himself", "player.state.misc" },
  { "Every Man for Himself", "player.state.root" },
  { "Every Man for Himself", "player.state.sleep" },
  { "Every Man for Himself", "player.state.snare" },
  { "Every Man for Himself", "player.state.stun" },
 
  -- Draenei
  { "Gift of the Naaru", "player.health <= 70", "player" },
  { "Gift of the Naaru", "focus.health <= 70", "focus" },
  { "Gift of the Naaru", "tank.health <= 60", "tank" },
 
  -- Gnomes
  { "Escape Artist", "player.state.root" },
  { "Escape Artist", "player.state.snare" },

  -- Night Elves
  { "Shadowmeld", "target.threat >= 80" },
  { "Shadowmeld", "focus.threat >= 80"},
  
  -- Worgen
  { "Darkflight", "modifier.cooldowns", "player.moving" },
  
  -- <,&~ Horde ~&,> --
  -- Orcs
  { "Blood Fury" },
  
  -- Trolls
  { "Berserking", "player.buff(Time Warp)" },
  { "Berserking", "player.buff(Bloodlust)" },
  { "Berserking", "player.debuff(Exhaustion)" },
  
  -- Tauren
  { "War Stomp", { "target.range <= 10", "target.casting", "!player.moving"} },
  -- Or
  { "War Stomp", { "modifier.interrupts", "target.range <= 10", "!player.moving"} },
  -- Forsaken (Undead, you uninformed bastards)&
  { "Will of the Forsaken", "player.state.fear" },
  { "Will of the Forsaken", "player.state.charm" },
  { "Will of the Forsaken", "player.state.sleep" },
  
  -- Goblins
  { "Rocket Barrage", "player.moving" },
  -- { "Rocket Jump", "modifier.control" },
  
  -- Blood Elves, Fuck everything about this racial.
  { "Arcane Torrent", "target.casting", "target.range <= 10" },
  { "Arcane Torrent", "target.range <= 1" },
  
  -- _,-=%Pandaren%=-,_ --
  { "Quaking Palm", "modifier.interrupts" },
  { "Quaking Palm", "target.casting" },
  
  --================================================================================--
 

-- ProbablyEngine Rotation Packager
-- Custom Resto Druid Rotation
-- Created on Nov 2nd 2013 1:03 am

  { "Treant Form", {
    "!player.buff(Cat Form)", 
    "!player.buff(Bear Form)", 
    "!player.buff(Travel Form)", 
    "!player.buff(Aquatic Form)", 
   "!player.buff(Flight Form)", 
   "!player.buff(Swift Flight Form)",
   	"!player.buff(Treant Form)",
 },"player" },


--Innervate
{ "29166", "player.mana < 80", "player" }, --Innervate if player's mana is lower then 80%
{ "145205", "modifier.shift", "mouseover" }, --Mushroom Placement

--Survival
{ "22812", "player.health < 30" }, --Barkskin if player's health is lower then 30%
-- Survival on Self
{ "Renewal", "player.health <= 30" },
{ "Cenarion Ward", "player.health < 75", "player" },
{ "Innervate", "player.mana <= 75", "player" },
{ "Might of Ursoc", "player.health <= 50" },
{ "/cancelaura Bear Form", "player.buff(Might of Ursoc)" },


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

--Mouseover
  { "Rebirth", "!mouseover.alive", "mouseover" },
  { "Rejuvenation", "mouseover.health <= 85", "mouseover" },

--Clear Casting Procs
{ "740", "@coreHealing.needsHealing(67, 7)" }, --Tranquility if 7 players below 67%
{ "8936", { "!modifier.last(8936)", "player.buff(16870)", "!lowest.buff(8936)", "lowest.health <= 95", }}, --Regrowth if Clear cast, Lowest raid health less then 95% and tank is within range
{ "5185", { "player.buff(16870)", "lowest.health <= 80", }}, --Healing Touch if clear cast, Lowest raid health less then 80 and tank is within range

--Tank Healing
{ "33763", { "tank.buff(33763) <= 3", "tank.buff(33763).count <= 2" }, "tank" }, --LifeBloom if tank/focus missing 3 stacks of life Bloom
{ "33763", "focus.buff(33763).duration <= 3", "focus" }, --LifeBloom if 3 seconds left so stacks dont fall off.
{ "8936", { "focus.health <= 45", "!focus.buff(8936)", }}, --Regrowth tank if health is under 45% and hasn't got a regrowth on.

--Healing
{ "145518", { "@coreHealing.needsHealing(70, 3)", "lowest.buff(774)", "!modifer.last(145518)", }}, --Genesis if 3 players below 70 and have the buff rejv
{ "145205", "@coreHealing.needsHealing(98, 5)" },
{ "102693", { "@coreHealing.needsHealing(70, 3)", "!modifier.last(106737)" }, "lowest" }, --Force of Nature if player is below 97%
{ "18562", { "lowest.health <= 85", "lowest.buff(774)", }, "lowest" }, --Swift mend if player has rejuv buff and is below 70%
{ "18562", { "lowest.health <= 85", "lowest.buff(8936)", }, "lowest" }, --Swiftmend if player has regrowth buff and is below 70%
{ "48438", "@coreHealing.needsHealing(90, 3)", "lowest" }, --Wild Growth if 3 raid members are under 90%
{ "8936", { "lowest.health <= 50", "!lowest.buff(8936)", }}, -- Regrowth lowest raid member if health is below 50% and doesnt have a regrowth buff
{ "774", { "lowest.health <= 85", "!lowest.buff(774)", }}, --Rejevenate lowest raid memeber if health is below 85% and doesnt have rejuv buff
{ "50464", { "!player.buff(100977)", "focus.health <= 100" }}, -- noruish to keep up H
{ "50464", "lowest.health <= 90" }, -- Nourish if target health below 90%


}, "lowest.range < 40", },

  -- Oh Shit Healing Start
  { "Incarnation: Tree of Life", "@coreHealing.needsHealing(60,4)" },
  
  --Incarnation: Turret of Healing
  { "48438", "player.buff(Incarnation: Tree of Life)", "lowest" },
  { "8936", { "player.buff(Incarnation: Tree of Life)", "@coreHealing.needsHealing(60, 4)", "lowest.health <= 60" }, "lowest" },
  { "Tranquility", "player.buff(Incarnation: Tree of Life)", "@coreHealing.needsHealing(55, 4)" },

-- Out Of Combat
},
{
--Buffs
{ "1126", "!player.buff(1126)" }, --Mark of the Wild if missing buff
{ "145205", "modifier.shift", "mouseover" }, --Mushroom Placement
{ "33763", { "tank.buff(33763) <= 3", "tank.buff(33763).count <= 2" }, "tank" },


 -- Basic Buffing
  { "Treant Form", {
    "!player.buff(Cat Form)", 
    "!player.buff(Bear Form)", 
    "!player.buff(Travel Form)", 
    "!player.buff(Aquatic Form)", 
    "!player.buff(Flight Form)", 
    "!player.buff(Swift Flight Form)", 
	"!player.buff(Treant Form)",
  }, "player" },


})