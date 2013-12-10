-- ProbablyEngine Rotation Packager
-- Custom Destruction Warlock Rotation
-- Created on Nov 13th 2013 6:18 am
ProbablyEngine.rotation.register_custom(267, "KohasDestruction", {

{ "Rain of Fire", "modifier.shift", "ground" },
--Trinkets
{ "#gloves" },
{ "#trinket1" },
{ "#trinket2" },

{ "Shadowburn", { "!modifier.last(Shadowburn)", "target.ttd < 4","target.health <= 20", "!target.debuff(Shadowburn)", "target.deathin < 4", }},
{ "Conflagrate", { "player.embers > 30", "!player.buff(Backdraft)", }},
{ "Incinerate", "player.moving" },
--Rein of fire



	--Auto Target Enemy 
  { "!/targetenemy [noharm]", {
    "!target.alive", 
	"!target.enemy",
	"!target.exists",
  }},
-- Cooldowns
  { "Dark Soul: Instability",{ "modifier.alt", "modifier.cooldowns" }},
  { "Mortal Coil", "player.health < 70" },

  --Pet Survival
  { "Health Funnel", { "player.glyph(42461).exists", "pet.health < 85", }},
  { "Flames of Xoroth", { "!player.spell(108503).exists", "!pet.exists", "player.embers >= 10", }},
  
--Rotation Multi
{{
{ "Summon Doomguard",{ "modifier.control", "modifier.cooldowns", }},
{ "Fire and Brimstone", "player.embers >= 15" },
{ "Havoc" },
{{
{ "Conflagrate" , "player.embers >= 10" },
{ "Immolate", { "target.debuff(Immolate).duration <= 4", "!modifier.last(Immolate)", }},
{ "Incenerate", "player.embers >= 15" },
}, "player.buff(Fire and Brimstone)" },
}, "modifier.multitarget" },
{ "!/cancelaura Fire and Brimstone", { "player.buff(Fire and Brimstone)", "!modifier.multitarget", "player.embers <= 9", }},


--Rotation Single
{{
{ "Summon Terrorguard",{ "modifier.control", "modifier.cooldowns" }},
{ "Immolate", { "target.debuff(Immolate).duration <= 4", "!modifier.last(Immolate)", }},
{ "Shadowburn", { "target.health <= 20", "player.embers >= 10" }},
{ "Conflagrate", { "player.spell(Conflagrate).charges > 1", "!player.buff(Backdraft)", }},
{{
{ "Chaos Bolt",{ "!modifier.last(Chaos Bolt)", "player.embers >= 35" }},
{ "Chaos Bolt", "player.buff(Dark Soul: Instability)" },
{ "Chaos Bolt", "player.buff(Skull Banner)" },
}, "target.health > 20" },
}, "!modifier.multitarget" },
{ "Conflagrate", { "player.embers < 7", "!player.buff(Backdraft)", }},
{ "Incinerate" },

-- Out Of Combat
},
{
{ "Dark Intent", "!player.buff(Dark Intent)" },
{ "Rain of Fire", "modifier.shift", "ground" },
{ "Unending Breath", "!player.buff(Unending Breath)" },
})