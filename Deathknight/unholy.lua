-- ProbablyEngine Rotation Packager
-- Custom Unholy Death Knight Rotation
-- Created on Nov 3rd 2013 6:30 am
ProbablyEngine.rotation.register_custom(252, "DKUnholyKoha", {

--PVP
{{

--Presence Checks
{ "Unholy Presence", { "!player.buff(Unholy Presence)", "modifier.control" }},
{ "Blood Presence", { "!player.buff(Blood Presence)", "modifier.control" }},
--Interupts
{ "47528", "modifier.interrupts" },  --MindFreeze
{ "108194", { "player.spell(108194).exists", "modifier.interrupts" }}, --Asphyxiate

--Cooldowns
{ "26297", "modifier.cooldowns" }, --Berserking
{ "20572", "modifier.cooldowns" }, --Blood Fury
{ "Remorseless Winter", "modifier.alt" },
{ "Desecrated Ground", "modifier.alt" },
{ "Gorefiend's Grasp", "modifier.alt" },
{ "46584", { "!pet.exists", "modifier.cooldowns" }}, --Raise Dead
{ "47568", { --Empower Rune Weapon
	"modifier.cooldowns", 
	"player.runicpower <= 25", 
	"player.runes(death).count = 0", 
	"player.runes(frost).count = 0", 
	"player.runes(unholy).count = 0" 
}}, 

--Survival
{ "48707", "player.health < 70" }, --Anti-Magic Shell
{ "49998", "player.health < 50" }, --Death Strike
{ "119975", { "player.spell(119975).exists", "player.health < 40" }}, --Conversion
{ "108196", { "player.spell(108196).exists", "player.health < 80" }}, --Death Siphon
{ "48792", "player.health < 30" }, --Icebound Foritude1

--Lichborne survival
{ "Lichborne", "player.health < 70" },
{ "Death Coil", { "player.buff(Lichbourne)", "player.health <= 90", "player.runic power >= 40" }},


--Snares
{ "Chains of Ice", { "target.debuff(Frost Fever)", "!target.debuff(Chains of Ice)", "target.range >= 10" }},
--Trinkets

--Pet Survival
{ "Death Coil", { "pet.exists", "pet.health <= 60", "pet", }},

--Dots
{ "Outbreak", { "!target.debuff(Frost Fever)", "!target.debuff(Blood Plague)", }},
{ "Icy Touch", { "player.range < 10", "!target.debuff(Frost Fever)" }},
{ "Plague Strike", { "player.range <=8", "!target.debuff(Blood Plague)" }},
{ "Dark Transformation" },

--AoE Rotation
{{
{ "115989", { "player.spell(115989).exists", "target.range <= 8", }},
{ "Blood Boil", { "target.range <= 5", "target.debuff(Frost Fever)", "target.debuff(Blood Plague)", }},
{ "Death Coil", "player.buff(Sudden Doom)" },
{ "Death Coil", "player.runicpower >= 32"},
{ "Icy Touch" },
}, "modifier.multitarget", },
-- Rotation

{ "Death Coil", "player.buff(Sudden Doom)" },
{ "Death Coil", "player.runicpower >= 32"},
{ "Soul Reaper", { "!modifier.last(Soul Reaper)", "!target.debuff(Soul Reaper)", "target.health < 35" }},
{ "Necrotic Strike" },
{ "Festering Strike", { "player.runes(Blood).count >= 1", "player.runes(frost).count >= 1", }},
{ "Scourge Strike" },
{ "45529", "player.buff(114851).count >= 5" },
{ "57330" },

}, "toggle.pvp" },

{{
--Presence Checks
	{ "48265", "!player.buff(48265)" }, --Unholy Presence

--Trinket Procs
{ "#gloves" },
	{ "#trinket1", "player.buff(53365)" }, --trinket on Unholy Strength
	{ "#trinket2", "player.buff(53365)" },
	
	--Auto Target Enemy 
  { "!/targetenemy [noharm]", {
	"target.range < 8",
    "!target.alive", 
	"!target.enemy",
	"!target.exists",
  }},

--Racial Cooldowns
	{ "26297", { "player.spell(26297).exists", "modifier.cooldowns" }}, --Berserking
	{ "20572", { "player.spell(20572).exists", "modifier.cooldowns" }}, --Blood Fury
--Pet
	{ "46584", "!pet.exists" }, --raise ghoul

-- Cooldowns
  	{ "49016", "modifier.cooldowns" }, --unholy frenzy
  	{ "49206", "modifier.cooldowns" }, --Summon Gargoye
	{ "Empower Rune Weapon", { 
	"modifier.cooldowns", 
	"player.runicpower <= 25", 
	"player.runes(death).count = 0", 
	"player.runes(frost).count = 0", 
	"player.runes(unholy).count = 0" 
	}}, 

-- hard cast dnd
  	{ "43265", "modifier.shift", "ground" }, --Death and Decay

--Interupts
	{ "47528", "modifier.interrupts" },  --MindFreeze
	{ "108194", { "player.spell(108194).exists", "modifier.interrupts" }}, --Asphyxiate

 -- Survival
	{ "48707", "player.health < 70" }, --Anti-Magic Shell
	{ "49998", "player.health < 50" }, --Death Strike
	{ "108196", { "player.spell(108196).exists", "player.health < 80" }}, --Death Siphon
	{ "48792", "player.health < 30" }, --Icebound Foritude1

  --Dots Tracking
	{ "77575", {
	"!target.debuff(Frost Fever)",
	}},
	
	{ "Dark Transformation" },

-- Refresh dots with hard casts
	{ "45462", "target.debuff(Blood Plague).duration < 4" },
 --Plauge Leech Support
	{ "123693", {
	"player.spell(123693).exists",
	"target.debuff(Frost Fever)",
	"target.debuff(Blood Plague).duration < 7",
	"player.rune(Unholy).count <= 1",
	"player.rune(Frost).count <= 1",
	}},

--AOE
{{
{ "Dark Transformation" },
{ "115989", { "player.spell(115989).exists", "target.range <= 8", }},
{ "Blood Boil", { "target.range <= 5", "target.debuff(Frost Fever)", "target.debuff(Blood Plague)", }},
{ "Death Coil", "player.buff(Sudden Doom)" },
{ "Death Coil", "player.runicpower >= 32"},
{ "Icy Touch" },
}, "modifier.multitarget", },
-- Rotation

{ "Death Coil", "player.buff(Sudden Doom)" },
{ "Death Coil", "player.runicpower >= 32"},
{ "Soul Reaper", { "!modifier.last(Soul Reaper)", "!target.debuff(Soul Reaper)", "target.health < 35" }},
{ "Festering Strike", { "player.runes(Blood).count >= 1", "player.runes(frost).count >= 1", }},
{ "Scourge Strike" },
{ "45529", "player.buff(114851).count >= 5" },
{ "57330" },
}, "!toggle.pvp" },

-- Out Of Combat
},
{
--Presence Checks
{ "48265", "!player.buff(48265)" },
{ "42650", "modifier.alt" },
{ "59057", "modifier.shift", "ground" },
--Pet
	{ "46584", "!pet.exists" }, --raise ghoul

}, function ()
 ProbablyEngine.toggle.create('pvp', 'Interface\\Icons\\Spell_Shadow_Nethercloak', 'Player Vs Player', '')
end)