-- ProbablyEngine Rotation Packager
-- Custom Frost Death Knight Rotation
-- Created on Nov 1st 2013 10:37 pm
ProbablyEngine.rotation.register_custom(251, "FrostDWkoha", {


--Presence Checks
	{ "Frost Presence", "!player.buff(Frost Presence)" },

--Trinket Procs
{ "#gloves" },
	{ "#trinket1", "player.buff(Unholy Strength)" },
	{ "#trinket2", "player.buff(Unholy Strength)" },

--Racial Cooldowns
	{ "Berserking", "modifier.cooldowns" },
	{ "Blood Fury", "modifier.cooldowns" },

--Cooldowns
	{ "Pillar of Frost", "modifier.cooldowns" },
	{ "Raise Dead", "modifier.cooldowns" },
	{ "Empower Rune Weapon", { 
	"modifier.cooldowns", 
	"player.runicpower <= 25", 
	"player.runes(death).count = 0", 
	"player.runes(frost).count = 0", 
	"player.runes(unholy).count = 0" 
	}}, 


-- hard cast dnd
	{ "Death and Decay", "modifier.shift", "ground" },


--Interupts
	{ "Mind Freeze", "modifier.interrupts" },
	{ "Asphyxiate", "modifier.interrupts" },
	
-- Survival
	{ "Anti-Magic Shell", "player.health < 70" },
	{ "Death Strike", "player.health < 50" },
	{ "Death Siphon", "player.health < 80" },
	{ "Icebound Fortitude", "player.health < 30" },
-- Death Pact Macro
	{ "!/cast Raise Dead\n/cast Death Pact", {
      "player.health < 35",
      "player.spell.cooldown(Death Pact)",
      "player.spell.cooldown(Raise Dead)",
      "player.spell.usable(Death Pact)"
	}},

--Dots Tracking
--Dots Tracking
	{ "Outbreak", "!target.debuff(Frost Fever)" },
	{ "Outbreak", "!target.debuff(Blood Plague)" },
	{ "Plague Strike", {
	"!target.debuff(Blood Plague)",
	"target.debuff(Blood Plague).duration <= 3",
	"player.runes(Unholy).count >= 1",
	}},
-- Refresh dots with hard casts
	{ "Howling Blast", "!target.debuff(Frost Fever)" },
	{ "Plague Strike", "!target.debuff(Blood Plague)" },

	--Rotation
	--Plauge Leech Support
	--Plauge Leech Support
	{ "Plague Leech", {
	"target.debuff(Frost Fever)",
	"target.debuff(Blood Plague).duration < 10",
	"player.rune(Unholy).count <= 1",
	"player.rune(Frost).count <= 1",
	"player.buff(Freezing Fog)",
	}},
	--AOE
	{ "Pestilence", {
	"modifier.alt",
	"target.debuff(Blood Plague)",
	"target.debuff(Frost Fever)", 
	}},
	{ "Unholy Blight", {
	"player.spell(Unholy Blight).usable",
	"modifier.multitarget",
	"target.range <= 8",
	}},
	{ "Howling Blast", "modifier.multitarget" },
	{ "Plague Strike", {
	"modifier.multitarget",
	"player.runes(Unholy).count = 2", 
	}},
	

	--Single
	{ "Frost Strike", "player.buff(Killing Machine)" },
	{ "Frost Strike", "player.runicpower >= 40"},
	{ "Howling Blast", "player.buff(Freezing Fog)" },
     { "Soul Reaper", "target.health < 35" },
     { "Howling Blast", "player.buff(Rime)" },
    { "Obliterate", {
	"!player.buff(Killing Machine)",
	"player.runes(Death).count >= 1",
	"player.runes(Unholy).count >= 1",
	}},
	{ "Howling Blast" },
     { "Horn of Winter" },
     { "Blood Tap", "player.buff(Blood Charge).count >= 5" },

-- Out Of Combat
},
{
--Presence Checks
{ "Unholy Presence", "player.moving" },
{ "Army of the Dead", "modifier.alt" },
{ "Death and Decay", "modifier.shift", "ground" },
  })

--Update 3/11/2013 By Koha
