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

{{ --Non Pvp Toggle
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
	
	-----------------------------------------------------------------------------------------------------------------------------
-- 5.3 autotaunt Events --------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
{ "Dark Command", { "target.name(Feng the Accursed)", "!player.debuff(Shadowburn)", "focus.debuff(Shadowburn).count >= 4", "toggle.autotaunt" }},
{ "Dark Command", { "target.name(Blade Lord Ta'yak)", "!player.debuff(Overwhelming Assault)", "focus.debuff(Overwhelming Assault).count >= 1", "toggle.autotaunt" }},
{ "Dark Command", { "target.name(Grand Empress Shek'zeer)", "!player.debuff(Eyes of the Empress)", "focus.debuff(Eyes of the Empress).count <= 4", "toggle.autotaunt" }},
{ "Dark Command", { "target.name(Tsulong)", "!player.debuff(Shadow Breath)", "focus.debuff(Shadow Breath).count >= 1", "toggle.autotaunt"}},
{ "Dark Command", { "target.name(Lei Shi)", "!player.debuff(Spray)", "focus.debuff(Spray).count >= 13", "toggle.autotaunt"}},
{ "Dark Command", { "target.name(Jin’rokh the Breaker)", "!player.debuff(Static Wound)", "focus.debuff(Static Wound).count >= 1", "toggle.autotaunt"}},
{ "Dark Command", { "target.name(Ji-Kun)", "!player.debuff(Talon Rake)", "focus.debuff(Talon Rake).count >= 2", "toggle.autotaunt"}},
{ "Dark Command", { "target.name(Durumu the Forgotten)", "!player.debuff(Serious Wound)", "focus.debuff(Serious Wound).count >= 3", "toggle.autotaunt"}},
{ "Dark Command", { "target.name(Primordius)", "!player.debuff(Malformed Blood)", "focus.debuff(Malformed Blood).count >= 5", "toggle.autotaunt"}},
{ "Dark Command", { "target.name(Iron Qon)", "!player.debuff(Impale)", "focus.debuff(Impale).count >= 2", "toggle.autotaunt"}},
{ "Dark Command", { "target.id(68904)", "!player.debuff(Fan of Flames)", "focus.debuff(Fan of Flames).count >= 2", "toggle.autotaunt"}},
{ "Dark Command", { "target.id(68397)", "!player.debuff(Decapitate)", "focus.debuff(Decapitate).count >= 1", "toggle.autotaunt"}},
{ "Dark Command", { "target.id(68397)", "!player.debuff(Fusion Slash)", "focus.debuff(Fusion Slash).count >= 1", "toggle.autotaunt"}},
{ "Dark Command", { "target.id(68397)", "!player.debuff(Overwhelming Power)", "focus.debuff(Overwhelming Power).count >= 1", "toggle.autotaunt"}},

	
-----------------------------------------------------------------------------------------------------------------------------
-- SoO autotaunt Events --------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
{ "Dark Command", {"target.id(71543)", "!player.debuff(143436)", "focus.debuff(143436).count >= 1", "toggle.autotaunt"}},         -- Immerseus 1 Stack
{ "Dark Command", {"target.id(72276)", "!player.debuff(146124)", "focus.debuff(146124).count >= 4", "toggle.autotaunt"}},         -- Norushen 4 Stacks
{ "Dark Command", {"target.id(71734)", "!player.debuff(144358)", "focus.debuff(144358).count >= 1", "toggle.autotaunt"}},         -- Sha of Pride 1 Stack
{ "Dark Command", {"target.id(71466)", "!player.debuff(144467)", "focus.debuff(144467).count >= 3", "toggle.autotaunt"}},         -- Iron Juggernaut 3 Stacks
{ "Dark Command", {"target.id(71859)", "!player.debuff(144215)", "focus.debuff(144215).count >= 5", "toggle.autotaunt"}},         -- Dark Shamans 5 Stacks
        { "Dark Command", {"target.id(71515)", "!player.debuff(143494)", "focus.debuff(143494).count >= 3", "toggle.autotaunt"}},         -- Nazgrim 3 Stacks
        { "Dark Command", {"target.id(71454)", "!player.debuff(142990)", "focus.debuff(142990).count >= 13", "toggle.autotaunt"}},         -- Malkorok 13 Stacks
        { "Dark Command", {"target.id(71504)", "!player.debuff(143385)", "focus.debuff(143385).count >= 3", "toggle.autotaunt"}},                -- Blackfuse 3 Stacks !!!
        { "Dark Command", {"target.id(71529)", "!player.debuff(143426)", "focus.debuff(143426).count >= 3", "toggle.autotaunt"}},         -- Thok 3 Stacks Fearsome Roar
        { "Dark Command", {"target.id(71529)", "!player.debuff(143780)", "focus.debuff(143780).count >= 3", "toggle.autotaunt"}},         -- Thok 3 Stacks Acid Breath
        { "Dark Command", {"target.id(71529)", "!player.debuff(143773)", "focus.debuff(143773).count >= 3", "toggle.autotaunt"}},         -- Thok 3 Stacks Freezing Breath
        { "Dark Command", {"target.id(71865)", "!player.debuff(145183)", "focus.debuff(145183).count >= 3", "toggle.autotaunt"}},         -- Garrosh 3 Stacks Gripping Despair
        { "Dark Command", {"target.id(71865)", "!player.debuff(145195)", "focus.debuff(145195).count >= 3", "toggle.autotaunt"}},         -- Garrosh 3 Stacks Empowered Gripping Despair


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
{ "Blood Boil", "modifier.alt" }, --Blood Boil

--Interupts
	{ "47528", "modifier.interrupts" },  --MindFreeze
	{ "108194", { "player.spell(108194).exists", "modifier.interrupts" }}, --Asphyxiate

-- Survival
	--Lichborne Healing
	{ "Lichborne", { "player.spell(49039).exists", "player.health < 40" }},
	{ "Death Coil", { "player.health < 40", "player.buff(Lichborne)", "player", }},
  	{ "48707", "player.health < 70" }, --Anti-Magic Shell
	{ "49998", "player.health < 50" }, --Death Strike
  	{ "49028", "player.health < 60" }, --Dancing Rune
  	{ "108196", "player.health < 40" }, --Death Siphon
	{ "119975", "player.health < 40" }, --Conversion
  	{ "55233", "player.health < 55" }, --Vampiric Blood
  	{ "48792", "player.health < 50" }, --IceboundFort
  	{ "48982", "player.health < 40" }, --RuneTap
  	{ "47568", "player.health < 40" }, --ERW



-- defensive
  	{ "49222", "!player.buff" }, --Bone Shield

-- Taunts
  	{ "56222", "modifier.taunt" }, --Dark Command
  	{ "49576", "modifier.taunt" }, --Death Grip
	
	-- Dot Tracking
  { "Outbreak", "target.debuff(Frost Fever).duration < 3", "target.debuff(Blood Plague).duration <3", "target" },
  { "Blood Boil", "player.runes(blood).count > 1","target.debuff(Frost Fever).duration < 3", "target.debuff(Blood Plague).duration <3" },
  { "Blood Boil", "player.runes(death).count > 1","target.debuff(Frost Fever).duration < 3", "target.debuff(Blood Plague).duration <3" },  
  { "Icy Touch", "target.debuff(Frost Fever).duration < 3" },
  { "Plague Strike", "target.debuff(Blood Plague).duration < 3" },
  { "Rune Strike", "player.runicpower > 90" },
  { "Blood Boil", { "target.debuff(Frost Fever)", "target.debuff(Blood Plague)", "player.buff(Crimson Scourge)" }},
  { "Horn of Winter", "player.runicpower < 30" },

--Rotation AOE
{{
{ "Death Strike", "!player.buff(Blood Shield)" },
{ "Death Strike", "player.buff(Blood Shield).duration < 5" },
{ "Blood Boil", { "target.debuff(Frost Fever)", "target.debuff(Blood Plague)", "player.runes(Death).count >= 1" }},
{ "Blood Boil", { "target.debuff(Frost Fever)", "target.debuff(Blood Plague)", "player.runes(Blood).count >= 1" }},
{ "Blood Tap", "player.buff(Blood Charge).count >= 5" },
{ "Rune Strike", "player.runicpower > 30" },
{ "Horn of Winter", "player.runicpower < 30" },
}, "modifier.multitarget" },

--Single Target Rotation
{{
{ "Death Strike", "!player.buff(Blood Shield)" },
{ "Death Strike", "player.buff(Blood Shield).duration < 5" },
{ "Heart Strike", "player.runes(Death).count >= 1" },
{ "Heart Strike", "player.runes(Blood).count >= 1" },
{ "Soul Reaper", {
"!modifier.multitarget",
"player.buff(Blood Shield)", 
"!target.debuff(Soul Reaper)", 
"!modifier.last(Soul Reaper)", 
"target.health < 35", 
"player.runes(Death).count >= 1" 
}},
{ "Death Strike" },
{ "Blood Tap", "player.buff(Blood Charge).count >= 5" },
{ "Rune Strike", "player.runicpower > 30" },
}, "!modifier.multitarget" },

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
 ProbablyEngine.toggle.create('autotaunt', 'Interface\\Icons\\Ability_Monk_Provoke', 'Auto Taunt', 'Toggle Auto Taunting for Bosses.')
end)