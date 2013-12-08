
-- ProbablyEngine Rotation Packager
-- Custom Resto Druid Rotation
-- Created on Nov 2nd 2013 1:03 am
ProbablyEngine.rotation.register_custom(264, "RestoShamenKoha", {

  -- aoe
 -- { "Unleash Elements", { "@coreHealing.needsHealing(99, 1)", "lowest", "modifier.shift", }},
  { "Healing Rain", "modifier.shift", "ground" },

--Trinkets
{ "#gloves" },
{ "#trinket1" },
{ "#trinket2" },
  -- buffs
  { "Earthliving Weapon", "!player.enchant.mainhand" },
  { "Water Shield", "!player.buff(Water Shield)" },
  
  --Auto Target Enemy 
  { "!/targetenemy [noharm]", {
    "!target.alive", 
	"!target.enemy",
	"!target.exists",
  }},

  -- tank
  --Earth Sheild Tank
  { "974", {
	"tank.range < 41",
	"!tank.buff(974)",
	"!tank.buff(Water Shield)",
  }, "tank" }, 
  { "Riptide", { "@coreHealing.needsHealing(95, 1)", "!lowest.buff(Riptide)", }, "lowest" },
  
    --SoO Dispells 
  { "Purify Spirit", "@coreHealing.needsDispelled('Shadow Word: Bane')" }, --The Fallen Protectors
  
  { "Purify Spirit", "@coreHealing.needsDispelled('Lingering Corruption')" }, --Norushen
  
  { "Purify Spirit", {  --Sha of Pride encounter
	"player.buff(Power of the Titans)",
	"@coreHealing.needsDispelled('Mark of Arrogance')",
  }}, 

  -- healing totem
  { "Healing Stream Totem", { "!buff.any(Healing Stream Totem)", "@coreHealing.needsHealing(97, 4)", "lowest", }},
  { "Mana Tide Totem", "player.mana < 20" },
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
  { "3599", { --Searing Totem
  "!player.totem(Fire Elemental Totem)",
   "!player.totem(3599)"
   }},
  { "8050", "!target.debuff(8050)" }, --Flame Shock
  { "51505" }, --Lavaburst
  { "403", "player.mana < 60" },
  { "403" }, --Lightning Bolt

},
{
  { "Earthliving Weapon", "!player.enchant.mainhand" },
  { "Water Shield", "!player.buff(Water Shield)" },
})