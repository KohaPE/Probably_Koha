-- ProbablyEngine Rotation Packager
-- Custom Frost Death Knight Rotation
-- Created on Nov 1st 2013 10:37 pm
ProbablyEngine.rotation.register_custom(251, "FrostDWkoha", {


--Presence Checks
	{ "48266", "!player.buff(48266)" }, --Frost Presence

--Trinket Procs
{ "#gloves" },
	{ "#trinket1", "player.buff(53365)" }, --trinket on Unholy Strength
	{ "#trinket2", "player.buff(53365)" },
	
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
	{ "49143", "player.runicpower >= 80"},
	{ "115989", { --Unh0lyBlight1
	"player.spell(115989).exists",
	"modifier.multitarget",
	"target.range <= 8",
	}},
	{ "49184", "modifier.multitarget" }, --H0wlingBlast
	{ "45462", { --H0wlingBlast
	"modifier.multitarget",
	"player.runes(Unholy).count = 2", 
	}},
	

	--Single
	{ "49143", "player.buff(51128)" }, --Fr0stStrike1 51128
	{ "49143", "player.runicpower >= 40"}, --Fr0stStrike1 runic power
	{ "49184", "player.buff(59052)" }, --H0wlingblast1 59052
     { "130735", "target.health < 35" }, --s0ulReaper1
     { "49184", "player.buff(59057)" }, --H0wlingBlast 59057
    { "49020", { --Oblite8rate1
	"!player.buff(51128)",
	"player.runes(Death).count >= 1",
	"player.runes(Unholy).count >= 1",
	}},
	{ "49184" }, --HowlingBlast
     { "57330" }, --Hornofwinter1
     { "45529", "player.buff(114851).count >= 5" }, --Blo0dtap1

-- Out Of Combat
},
{
--Presence Checks
{ "48265", "player.moving" }, --Unh0lyPresence1
{ "42650", "modifier.alt" }, --armyofthedead1
{ "43265", "modifier.shift", "ground" }, --590571
  })

--Update 3/11/2013 By Koha
