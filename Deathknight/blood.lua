-- ProbablyEngine Rotation Packager
-- Custom Blood Death Knight Rotation
-- Created on Nov 2nd 2013 12:12 am
ProbablyEngine.rotation.register_custom(250, "DKBloodKoha", {

--PVP
{{

--Trinkets


--Dots
{ "Outbreak", { "!target.debuff(Frost Fever)", "!target.debuff(Blood Plague)", }},
{ "Icy Touch", "!target.debuff(Frost Fever)" },
{ "Plague Strike", "!target.debuff(Blood Plague)" },
}, "toggle.pvp" },

{{
--Trinket Procs
{ "#gloves" },
	{ "#trinket1" },
	{ "#trinket2" },

	--Auto Target Enemy 
  { "!/targetenemy [noharm]", {
    "!target.alive", 
	"!target.enemy",
	"!target.exists",
  }},

--Racial Cooldowns
	{ "26297", { "player.spell(26297).exists", "modifier.cooldowns" }}, --Berserking
	{ "20572", { "player.spell(20572).exists", "modifier.cooldowns" }}, --Blood Fury

--Cooldowns
	{ "46584", "modifier.cooldowns" }, --Raise Dead
	{ "47568", { --Empower Rune Weapon
	"modifier.cooldowns", 
	"player.runicpower <= 25", 
	"player.runes(death).count = 0", 
	"player.runes(frost).count = 0", 
	"player.runes(unholy).count = 0" 
	}}, 

-- hard cast dnd
  	{ "43265", "modifier.shift", "ground" }, --Death n Decay
{ "48721", "modifier.alt" }, --Blood Boil

--Interupts
	{ "47528", "modifier.interrupts" },  --MindFreeze
	{ "108194", { "player.spell(108194).exists", "modifier.interrupts" }}, --Asphyxiate

-- Survival
  	{ "48707", "player.health < 70" }, --Anti-Magic Shell
	{ "49998", "player.health < 50" }, --Death Strike
  	{ "49028", "player.health < 60" }, --Dancing Rune
  	{ "108196", "player.health < 40" }, --Death Siphon
	{ "119975", "player.health < 40" }, --Conversion
  	{ "55233", "player.health < 55" }, --Vampiric Blood
  	{ "48792", "player.health < 50" }, --IceboundFort
  	{ "48982", "player.health < 40" }, --RuneTap
  	{ "47568", "player.health < 40" }, --ERW

-- 48792 Macro
  	{ "!/cast 46584\n/cast 48792", { --Deathpact Macro
	"player.health < 35",
	"player.spell.cooldown(48792)",
	"player.spell.cooldown(46584)",
	"player.spell.usable(48792)"
	}},
	

--Dots Tracking
	{ "Outbreak", "!target.debuff(Frost Fever)" },
	{ "Blood Boil", {
	  "target.range <= 8",
	  "target.debuff(Frost Fever).duration < 4" }},
	{ "Icy Touch", "target.debuff(Frost Fever).duration < 4" },
	{ "Plague Strike", "target.debuff(Blood Plague).duration < 4" },
	{ "Icy Touch", "!target.debuff(Frost Fever)" },
	{ "Plague Strike", "!target.debuff(Blood Plague)" },

-- Refresh dots with Blood Boil
	{ "48721", {
	"target.debuff(Frost Fever)",
	"target.debuff(Blood Plague)",
	"target.debuff(Frost Fever).duration < 10",
	"target.debuff(Blood Plague).duration < 10",
	}},
	{ "48721", { 
	"modifier.multitarget",
	"player.buff(81141)",
	}},

-- defensive
  	{ "49222", "!player.buff" }, --Bone Shield

-- Taunts
  	{ "56222", "modifier.taunt" }, --Dark Command
  	{ "49576", "modifier.taunt" }, --Death Grip
  	{ "114866", "target.health < 35" }, --Soul Reaper

--Rotation AOE
	{ "49998" }, --Death Strike
	{ "48721", { --Bloodboil
	"modifier.multitarget",
	"player.runes(blood).count >= 1",
	"target.range <= 8",
	"target.debuff(Frost Fever)",
	"target.debuff(Blood Plague)",
	}},
	

-- Rotation Single Target
	{ "55050", { "player.runes(blood).count >= 1", "!modifier.multitarget", }}, --Heart Strike
	{ "49998" }, --Death Strike
	{ "48721", { --Blood Boil
	"player.buff(81141)",
	"target.range <= 5"
	}},
	{ "114866", "target.health < 35" }, --Soul Reaper
	{ "56815" }, --Rune Strike
	{ "45529", "player.buff(114851).count >= 5" }, --BloodTap
	{ "57330" }, --Horn of Winter
}, "!toggle.pvp" },

-- Out Of Combat
},
{
--Presence Checks
{ "48263", "!player.buff(48263)" }, --Blood Presence
{ "49222", "!player.buff" }, --Bone Shield
{ "42650", "modifier.alt" }, --Army of the Dead
{ "43265", "modifier.shift", "ground" }, --Death and Decay
}, function ()
 ProbablyEngine.toggle.create('pvp', 'Interface\\Icons\\Spell_Shadow_Nethercloak', 'Player Vs Player', '')
end)