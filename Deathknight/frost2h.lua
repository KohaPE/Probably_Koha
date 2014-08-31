
-- ProbablyEngine Rotation Packager
-- Custom Frost Death Knight Rotation
-- Created on Nov 1st 2013 11:11 pm
ProbablyEngine.rotation.register_custom(251, "Frost2HKoha", {


--PVP
{{

--Presence Checks
{ "Frost Presence", { "!player.buff(Frost Presence)", "player.health >= 80" }},
{ "Blood Presence", { "!player.buff(Blood Presence)", "player.health <= 79" }},
--Interupts
{ "47528", "modifier.interrupts" },  --MindFreeze
{ "108194", { "player.spell(108194).exists", "modifier.interrupts" }}, --Asphyxiate

--Cooldowns
{ "26297", { "player.spell(26297).exists", "modifier.cooldowns" }}, --Berserking
{ "20572", { "player.spell(20572).exists", "modifier.cooldowns" }}, --Blood Fury
{ "Remorseless Winter", "modifier.alt" },
{ "51271", "modifier.cooldowns" }, --pillar of frost
{ "46584", "modifier.cooldowns" }, --Raise Dead
{ "47568", { --Empower Rune Weapon
	"modifier.cooldowns", 
	"player.runicpower <= 25", 
	"player.runes(death).count = 0", 
	"player.runes(frost).count = 0", 
	"player.runes(unholy).count = 0" 
}}, 
--Snares
{ "Chains of Ice", { "target.debuff(Frost Fever)", "!target.debuff(Chains of Ice)", "target.range >= 10" }},
--Trinkets

--Survival
{ "48707", "player.health < 70" }, --Anti-Magic Shell
{ "49998", "player.health < 50" }, --Death Strike
{ "119975", { "player.spell(119975).exists", "player.health < 40" }}, --Conversion
{ "108196", { "player.spell(108196).exists", "player.health < 80" }}, --Death Siphon
{ "48792", "player.health < 30" }, --Icebound Foritude1

--Dots
{ "Outbreak", { "!target.debuff(Frost Fever)", "!target.debuff(Blood Plague)", }},
{ "Howling Blast", { "player.range < 30", "!target.debuff(Frost Fever)" }},
{ "Plague Strike", { "player.range <=8", "!target.debuff(Blood Plague)" }},
--Rotation

{ "49020", { "player.range <= 8", "player.runes(Frost).count >= 1", "player.runes(Death).count >= 1", }}, --Obliterate
{ "49020", { "player.range <= 8", "player.runes(Death).count >= 2" }}, --Obliterate
{ "49143", { "player.range <= 8", "player.runicpower >= 30" }}, --Frost Strike
{ "130735", { "player.runes(Death).count >=1 ", "player.range <= 8", "target.health < 30" }}, --Soul Reaper
{ "49184", { "player.range < 30", "player.buff(59052)" }}, --Howling Blast
{ "49184", { "player.range < 30", "player.buff(59057)" }}, --Howling Blast
{ "49020", { "player.range <= 8","player.buff(51128)" }}, --Obliterate
{ "49020", "player.range < 30" }, --Obliterate
{ "57330" }, --Horn of Winter
{ "49143", { "player.range < 30", "player.runicpower >= 60" }}, --Frost Strike
{ "45529", { "player.spell(45529).exists", "player.buff(114851).count >= 5" }}, --Blood Tap
{ "57330" }, --Horn of Winter

}, "toggle.pvp" },

{{
--Presence Checks
	{ "48266", "!player.buff(48266)" }, --Frost Presence

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

--Cooldowns
	{ "51271", "modifier.cooldowns" }, --pillar of frost
	{ "46584", "modifier.cooldowns" }, --Raise Dead
	{ "47568", { --Empower Rune Weapon
	"modifier.cooldowns", 
	"player.runicpower <= 25", 
	"player.runes(death).count = 0", 
	"player.runes(frost).count = 0", 
	"player.runes(unholy).count = 0" 
	}}, 


-- hard cast dnd
	{ "43265", "modifier.shift", "ground" }, --DeathandDecay


--Interupts
	{ "47528", "modifier.interrupts" },  --MindFreeze
	{ "108194", { "player.spell(108194).exists", "modifier.interrupts" }}, --Asphyxiate
	
-- Survival
	{ "48707", "player.health < 70" }, --Anti-Magic Shell
	{ "49998", "player.health < 50" }, --Death Strike
	{ "108196", "player.health < 80" }, --Death Siphon
	{ "48792", "player.health < 30" }, --Icebound Foritude1
-- Death Pact Macro
	{ "!/cast 46584\n/cast 48792", {
      "player.health < 35",
      "player.spell.cooldown(48792)",
      "player.spell.cooldown(46584)",
      "player.spell.usable(48792)"
	}},

--Dots Tracking
	{ "77575", "!target.debuff(59921)" }, --Outbreak Frost
	{ "77575", "!target.debuff(59879)" }, --Outbreak Blood
	{ "45462", { --Plague Strike
	"!target.debuff(59879)",
	"target.debuff(59879).duration <= 3",
	"player.runes(Unholy).count >= 1",
	}},
	
	
-- Refresh dots with hard casts
	{ "49184", "!target.debuff(59921)" }, --Howling Blast
	{ "45462", "!target.debuff(59879)" }, --Plague Strike

	--Rotation
	--Plauge Leech Support
	{ "123693", { --PlagueL3ech1
	"player.spell(123693).exists",
	"target.debuff(59921)",
	"target.debuff(59879).duration < 10",
	"player.rune(Unholy).count <= 1",
	"player.rune(Frost).count <= 1",
	"player.buff(59052)",
	}},
	
	
	--AOE
	{ "51842", { --Pe5tilence1
	"modifier.alt",
	"target.debuff(59879)",
	"target.debuff(59921)", 
	}},
	{ "115989", { --Unh0lyBlight1
	"player.spell(115989).exists",
	"modifier.multitarget",
	"target.range <= 8",
	}},
	{ "49143", "player.runicpower > 80" }, -- Frost Strike cap
	{ "49184", "modifier.multitarget" }, --Howling Blast
	{ "45462", { --Plague Strike
	"modifier.multitarget",
	"player.runes(Unholy).count = 2", 
	}},
	{ "45529", "player.buff(114851).count >= 5" }, --Blood Tap
	{ "49143", "modifier.multitarget" }, --Frost Strike

--Single
{ "Obliterate", { "player.runes(Frost).count >= 1", "player.runes(Death).count >= 1", }}, --Obliterate
	{ "Obliterate", "player.runes(Death).count >= 2" }, --Obliterate
	{ "49143", "player.runicpower > 70" }, --Frost Strike
{ "130735", "target.health < 30" }, --Soul Reaper
   { "49184", "player.buff(59052)" }, --Howling Blast
    { "49184", "player.buff(59052)" }, --Howling Blast
    { "Obliterate", "player.buff(51124)" }, --Obliterate
    { "Obliterate" }, --Obliterate
    { "57330" }, --Horn of Winter
    { "49143" }, --Frost Strike
    { "45529", "player.buff(114851).count >= 5" }, --Blood Tap
    { "57330" }, --Horn of Winter
	}, "!toggle.pvp" },
    
-- Out Of Combat
},
{
--Presence Checks
{ "48265", "player.moving" }, --Unholy Presence
{ "42650", "modifier.alt" }, --Army of the Dead
{ "43265", "modifier.shift", "ground" }, --Death and Decay
}, function ()
 ProbablyEngine.toggle.create('pvp', 'Interface\\Icons\\Spell_Shadow_Nethercloak', 'Player Vs Player', '')
end)

--Update 20/11/2013 By Koha