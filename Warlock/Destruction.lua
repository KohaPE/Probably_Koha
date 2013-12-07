-- ProbablyEngine Rotation Packager
-- Custom Destruction Warlock Rotation
-- Created on Nov 13th 2013 6:18 am
ProbablyEngine.rotation.register_custom(267, "KohasDestruction", {

{ "Shadowburn", { "target.health <= 20", "!target.debuff(Shadowburn)", "player.embers >= 10", "!modifier.last(Shadowburn)", }},
--Rein of fire
{ "Rain of Fire", "modifier.shift", "ground" },

-- Cooldowns
  { "Dark Soul: Instability",{ "modifier.alt", "modifier.cooldowns" }},
  { "Summon Terrorguard",{ "modifier.control", "modifier.cooldowns", "!modifier.multitarget" }},
  { "Summon Doomguard",{ "modifier.control", "modifier.cooldowns", "modifier.multitarget", }},

--{ "Curse of the Elements", "!target.debuff(Curse of the Elements)" },

--Rotation Multi
{{
{ "Fire and Brimstone", "player.embers >= 15" },
{ "!/cancelaura Fire and Brimstone", "!modifier.multitarget" },
{ "Havoc" },
{{
{ "Conflagrate" , "player.embers >= 10" },
{ "Immolate", { "target.debuff(Immolate).duration <= 4", "!modifier.last(Immolate)", }},
{ "Incenerate", "player.embers >= 15" },
}, "player.buff(Fire and Brimstone)" },
}, "modifier.multitarget" },

--Rotation Single
{ "Immolate", { "target.debuff(Immolate).duration <= 4", "!modifier.last(Immolate)", }},
{ "Shadowburn", { "target.health <= 20", "player.embers >= 10" }},
{ "Conflagrate", { "player.spell(Conflagrate).charges > 1", "!player.buff(Backdraft)", }},
{{
    { "Chaos Bolt",{ "!modifier.last(Chaos Bolt)", "player.embers >= 35" }},
    { "Chaos Bolt", "player.buff(Dark Soul: Instability)" },
    { "Chaos Bolt", "player.buff(Skull Banner)" },
  }, "target.health > 20" },
 -- { "Fel Flame", "player.moving" },
{ "Incinerate" },


-- Out Of Combat
},
{
--Buffs
{ "Dark Intent", "!player.buff(Dark Intent)" },
{ "Rain of Fire", "modifier.shift", "ground" },
  -- Out of COmbat
},{
  { "Dark Intent", "!player.buff" },wwwwwwwwww
})