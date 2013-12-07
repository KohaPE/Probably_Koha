-- ProbablyEngine Rotation Packager
-- Custom Unholy Death Knight Rotation
-- Created on Nov 3rd 2013 6:30 am
ProbablyEngine.rotation.register_custom(252, "DKUnholyKoha", {

--Presence Checks
	{ "Unholy Presence", "!player.buff(Unholy Presence)" },

{ "#gloves" },
	{ "#trinket1", "player.buff(Unholy Strength)" },
	{ "#trinket2", "player.buff(Unholy Strength)" },

--Pet
	{ "Raise Dead", "!pet.exists" },

--Racial Cooldowns
	{ "Berserking", "modifier.cooldowns" },
	{ "Blood Fury", "modifier.cooldowns" },

-- Cooldowns
  	{ "Unholy Frenzy", "modifier.cooldowns" },
  	{ "Summon Gargoyle", "modifier.cooldowns" },
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
  	{ "Death Pact", "player.health < 20" },
  	{ "Icebound Fortitude", "player.health < 50" },
  	{ "Anti-Magic Shell", "player.health < 70" },
	{ "Death Strike", "player.health < 50" },
  	{ "Dancing Rune Weapon", "player.health < 60" },
  	{ "Death Siphon", "player.health < 40" },
	{ "Conversion", "player.health < 40" },
  	{ "Vampiric Blood", "player.health < 55" },
  	{ "Icebound Fortitude", "player.health < 50" },
  	{ "Rune Tap", "player.health < 40" },
  	{ "Empower Rune Weapon", "player.health < 40" },

  --Dots Tracking
	{ "Outbreak", {
	"!target.debuff(Frost Fever)",
	}},

-- Refresh dots with hard casts
	{ "Plague Strike", "target.debuff(Blood Plague).duration < 4" },
 --Plauge Leech Support
	{ "Plague Leech", {
	"target.debuff(Frost Fever)",
	"target.debuff(Blood Plague).duration < 7",
	"player.rune(Unholy).count <= 1",
	"player.rune(Frost).count <= 1",
	}},

--AOE
{{
{ "Unholy Blight", {
	"player.spell(Unholy Blight).usable",
	"target.range <= 8",
	}},
{ "Blood Boil", {
	"target.range <= 5",
	"target.debuff(Frost Fever)",
	"target.debuff(Blood Plague)",
	}},
	{ "Death Coil", "player.buff(Sudden Doom)" },
{ "Death Coil", "player.runicpower >= 32"},
}, "modifier.multitarget", },
-- Rotation
{ "Dark Transformation" },
{ "Death Coil", "player.buff(Sudden Doom)" },
{ "Death Coil", "player.runicpower >= 32"},
{ "Soul Reaper", "target.health < 35" },
{ "Festering Strike", {
	"player.runes(Blood).count >= 1",
	"player.runes(frost).count >= 1",
	}},
{ "Scourge Strike" },
{ "Blood Tap", "player.buff(Blood Charge).count >= 5" },
{ "Horn of Winter" },

-- Out Of Combat
},
{
--Presence Checks
{ "Unholy Presence", "!player.buff(Unholy Presence)" },
{ "Army of the Dead", "modifier.alt" },
{ "Death and Decay", "modifier.shift", "ground" },

  }
)