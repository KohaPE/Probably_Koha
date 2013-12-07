-- ProbablyEngine Rotation Packager
-- Custom Protection Warrior Rotation
-- Created on Nov 21st 2013 6:56 am
ProbablyEngine.rotation.register_custom(73, "KohasProt", {


--Stance Check

{ "Heroic Leap", "modifier.alt", "ground" },
--Racial

--Defensive cooldowns

--Single Target
{{
{ "Cleave", {  "modifier.multitarget", "player.rage >= 90" }},
{ "Heroic Strike", { "!modifier.multitarget", "player.rage >= 90" }},
{ "Heroic Strike", "player.buff(Ultimatum)" },
{ "Cleave", "player.buff(Ultimatum)" },
{ "Thunder Clap", "modifier.multitarget" },
{ "Shockwave", "modifier.multitarget" },
{ "Shield Slam" },
{ "Revenge" },
{ "Devastate" },
{ "Thunder Clap", "!target.debuff(Weakend Blows)" },
{ "Battle Shout", "player.rage < 60" },
{ "Berserker Rage", "player.rage <60" },
{ "Shield Block", { "!modifier.multitarget", "player.rage >= 60" }},
{ "Shield Barrier", { "modifier.multitarget", "player.rage >= 60" }},
{ "Shield Barrier", { "player.buff(Shield Block)", "player.rage >= 60" }},
}, "player.range <= 8" },

-- Out Of Combat
},
{
{ "Heroic Leap", "modifier.alt", "ground" },
--{ "!/click BT4StanceButton2", "player.health >= 1" },

})