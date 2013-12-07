
-- ProbablyEngine Rotation Packager
-- Custom Frost Death Knight Rotation
-- Created on Nov 1st 2013 11:11 pm
ProbablyEngine.rotation.register_custom(251, "Frost2HKoha", {

--Pause
{ "pause", "modifier.control" },
--Presence Checks
	{ "Frost Presence", "!player.buff(Frost Presence)" },
--Trinkets
{ "#gloves" },
	{ "#trinket1", "player.buff(Unholy Strength)" },
	{ "#trinket2", "player.buff(Unholy Strength)" },
	{ "Pillar of Frost", "player.buff(Unholy Strength)" },
--Racial Cooldowns
	{ "Berserking", "modifier.cooldowns" }, --Berserking
	{ "Blood Fury", "modifier.cooldowns" }, --Blood Fury
		{ "Pestilence", {
	"modifier.alt",
	"target.debuff(Blood Plague)",
	"target.debuff(Frost Fever)", 
	}},

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
-- Auto Boss Cooldowns
{{
{ "Pillar of Frost", "player.buff(Unholy Strength)" },
{ "Berserking" },
{ "Blood Fury" },
{ "Army of the Dead" },
	{ "Raise Dead" },
	{ "Empower Rune Weapon", { 
	"modifier.cooldowns", 
	"player.runicpower <= 25", 
	"player.runes(death).count = 0", 
	"player.runes(frost).count = 0", 
	"player.runes(unholy).count = 0" 
	}}, 
	}, "target.boss" },


-- hard cast dnd
	{ "Death and Decay", "modifier.shift", "ground" },


--Interupts
	{ "Mind Freeze", "modifier.interrupts" },
	{ "Asphyxiate", "modifier.interrupts" },
	
-- Survival
	{ "Anti-Magic Shell", "player.health < 70" },
	{ "Death Strike", "player.health < 50" },
	{ "Death Siphon", "player.health < 55" },
	{ "Icebound Fortitude", "player.health < 30" },
-- Death Pact Macro
	{ "!/cast Raise Dead\n/cast Death Pact", {
      "player.health < 35",
      "player.spell.cooldown(Death Pact)",
      "player.spell.cooldown(Raise Dead)",
      "player.spell.usable(Death Pact)"
	}},


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
	{ "Plague Leech", {
	"target.debuff(Frost Fever)",
	"target.debuff(Blood Plague).duration < 15",
	"player.rune(Unholy).count <= 1",
	"player.rune(Frost).count <= 1",
	"player.buff(Freezing Fog)",
	}},
--AOE
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
	{ "Blood Tap", "player.buff(Blood Charge).count >= 5" },
	{ "Frost Strike", "modifier.multitarget" },

--Single
{ "Obliterate", { "player.runes(Frost).count >= 1", "player.runes(Death).count >= 1", }},
	{ "Obliterate", "player.runes(Death).count >= 2" },
	{ "Frost Strike", "player.runicpower > 70" },
{ "Soul Reaper", "target.health < 30" },
   { "Howling Blast", "player.buff(Freezing Fog)" },
    { "Howling Blast", "player.buff(Rime)" },
    { "Obliterate", "player.buff(Killing Machine)" },
    { "Obliterate" },
    { "Horn of Winter" },
    { "Frost Strike" },
    { "Blood Tap", "player.buff(Blood Charge).count >= 5" },
    { "Horn of Winter" },
    
-- Out Of Combat
},
{
--Presence Checks
{ "Unholy Presence", "player.moving" },
{ "Army of the Dead", "modifier.alt" },
{ "Death and Decay", "modifier.shift", "ground" },

  }
)

--Update 20/11/2013 By Koha