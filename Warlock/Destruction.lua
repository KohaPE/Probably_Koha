-- ProbablyEngine Rotation Packager
-- Custom Destruction Warlock Rotation
-- Created on Nov 13th 2013 6:18 am
ProbablyEngine.rotation.register_custom(267, "KohasDestruction", {

--Trinkets
{ "#gloves" },
{ "#trinket1" },
{ "#trinket2" },

{ "Shadowburn", { "target.health <= 20", "!target.debuff(Shadowburn)", "target.ttd <= 5",}},
--Rein of fire
{ "Rain of Fire", "modifier.shift", "ground" },

-- Cooldowns
  { "Dark Soul: Instability",{ "modifier.alt", "modifier.cooldowns" }},

  --Pet Survival
  { "Health Funnel", { "player.glyph(42461).exists", "pet.health < 85", }},
  { "Flames of Xoroth", { "!pet.exists", "player.embers >= 10", }},
  
--Rotation Multi
{{
{ "Summon Doomguard",{ "modifier.control", "modifier.cooldowns", }},
{ "Fire and Brimstone", "player.embers >= 15" },
{ "!/cancelaura Fire and Brimstone", { "!modifier.multitarget", "player.embers < 9", }},
{ "Havoc" },
{{
{ "Conflagrate" , "player.embers >= 10" },
{ "Immolate", { "target.debuff(Immolate).duration <= 4", "!modifier.last(Immolate)", }},
{ "Incenerate", "player.embers >= 15" },
}, "player.buff(Fire and Brimstone)" },
}, "modifier.multitarget" },


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