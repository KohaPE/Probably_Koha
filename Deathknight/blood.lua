-- ProbablyEngine Rotation Packager
-- Custom Blood Death Knight Rotation
-- Created on Nov 2nd 2013 12:12 am
ProbablyEngine.rotation.register_custom(250, "DKBloodKoha", {


--Trinket Procs
{ "#gloves" },
	{ "#trinket1", "player.buff(Unholy Strength)" },
	{ "#trinket2", "player.buff(Unholy Strength)" },

--Racial Cooldowns
	{ "Berserking", "modifier.cooldowns" },
	{ "Blood Fury", "modifier.cooldowns" },

--Cooldowns
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
  		{ "Blood Boil", "modifier.alt" },
  		{ "Death Strike", "player.buff(Sent of Blood).count = 5" },

--Interupts
	{ "Mind Freeze", "modifier.interrupts" },
	{ "Asphyxiate", "modifier.interrupts" },

-- Survival
  	{ "Anti-Magic Shell", "player.health < 70" },
	{ "Death Strike", "player.health < 50" },
  	{ "Dancing Rune Weapon", "player.health < 60" },
  	{ "Death Siphon", "player.health < 40" },
	{ "Conversion", "player.health < 40" },
  	{ "Vampiric Blood", "player.health < 55" },
  	{ "Icebound Fortitude", "player.health < 50" },
  	{ "Rune Tap", "player.health < 40" },
  	{ "Empower Rune Weapon", "player.health < 40" },

-- Death Pact Macro
  	{ "!/cast Raise Dead\n/cast Death Pact", {
	"player.health < 35",
	"player.spell.cooldown(Death Pact)",
	"player.spell.cooldown(Raise Dead)",
	"player.spell.usable(Death Pact)"
	}},

--Dots Tracking
	{ "Outbreak", {
	"!target.debuff(Blood Plague)",
	"target.health >= 50",
	}},
	{ "Outbreak", {
	"!target.debuff(Frost Fever)",
	"target.health >= 50",
	}},

-- Refresh dots with hard casts
	{ "Icy Touch", "target.debuff(Frost Fever).duration < 4" 	},
	{ "Plague Strike", "target.debuff(Blood Plague).duration < 4" },

-- Refresh dots with Blood Boil
	{ "Blood Boil", {
	"target.debuff(Frost Fever)",
	"target.debuff(Blood Plague)",
	"target.debuff(Frost Fever).duration < 10",
	"target.debuff(Blood Plague).duration < 10",
	}},
	{ "Blood Boil", {
	"modifier.multitarget",
	"player.buff(Crimson Scourge)",
	}},

-- defensive
  	{ "Bone Shield", "!player.buff" },

-- Taunts
  	{ "Dark Command", "modifier.taunt" },
  	{ "Death Grip", "modifier.taunt" },
  	{ "Soul Reaper", "target.health < 35" },

--Rotation AOE
	{ "Death Strike" },
	{ "Blood Boil", {
	"modifier.multitarget",
	"player.runes(blood).count >= 1",
	"target.range <= 5",
	"target.debuff(Frost Fever)",
	"target.debuff(Blood Plague)",
	}},
	

-- Rotation Single Target
	{ "Heart Strike", { "player.runes(blood).count >= 1", "!modifier.multitarget", }},
	{ "Death Strike" },
	{ "Blood Boil", {
	"player.buff(Crimson Scourge)",
	"target.range <= 5"
	}},
	{ "Soul Reaper", "target.health < 35" },
	{ "Rune Strike" },
	{ "Blood Tap", "player.buff(Blood Charge).count >= 5" },
	{ "Horn of Winter" },
-- Out Of Combat
},
{
--Presence Checks
{ "Blood Presence", "!player.buff(Blood Presence)" },
{ "Bone Shield", "!player.buff" },
{ "Army of the Dead", "modifier.alt" },
{ "Death and Decay", "modifier.shift", "ground" },
})