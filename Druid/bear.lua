
-- ProbablyEngine Rotation Packager
-- Custom Guardian Druid Rotation
-- Created on Nov 2nd 2013 1:03 am
ProbablyEngine.rotation.register_custom(104, "DruidBearKoha", {

{ "!/cast Bear Form", { "!player.buff(Bear Form)", "modifier.control" }},
{ "!/cast Cat Form", { "!player.buff(Cat Form)", "modifier.control" }},
{ "!/cast Bear Form", { "!player.buff(Bear Form)", "!player.buff(Cat Form)" }},


-----------------------------------------------------------------------------------------------------------------------------
-- 5.3 autotaunt Events --------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
{ "Growl", { "target.name(Feng the Accursed)", "!player.debuff(Shadowburn)", "focus.debuff(Shadowburn).count >= 4", "toggle.autotaunt" }},
{ "Growl", { "target.name(Blade Lord Ta'yak)", "!player.debuff(Overwhelming Assault)", "focus.debuff(Overwhelming Assault).count >= 1", "toggle.autotaunt" }},
{ "Growl", { "target.name(Grand Empress Shek'zeer)", "!player.debuff(Eyes of the Empress)", "focus.debuff(Eyes of the Empress).count <= 4", "toggle.autotaunt" }},
{ "Growl", { "target.name(Tsulong)", "!player.debuff(Shadow Breath)", "focus.debuff(Shadow Breath).count >= 1", "toggle.autotaunt"}},
{ "Growl", { "target.name(Lei Shi)", "!player.debuff(Spray)", "focus.debuff(Spray).count >= 13", "toggle.autotaunt"}},
{ "Growl", { "target.name(Jin’rokh the Breaker)", "!player.debuff(Static Wound)", "focus.debuff(Static Wound).count >= 1", "toggle.autotaunt"}},
{ "Growl", { "target.name(Ji-Kun)", "!player.debuff(Talon Rake)", "focus.debuff(Talon Rake).count >= 2", "toggle.autotaunt"}},
{ "Growl", { "target.name(Durumu the Forgotten)", "!player.debuff(Serious Wound)", "focus.debuff(Serious Wound).count >= 3", "toggle.autotaunt"}},
{ "Growl", { "target.name(Primordius)", "!player.debuff(Malformed Blood)", "focus.debuff(Malformed Blood).count >= 5", "toggle.autotaunt"}},
{ "Growl", { "target.name(Iron Qon)", "!player.debuff(Impale)", "focus.debuff(Impale).count >= 2", "toggle.autotaunt"}},
{ "Growl", { "target.id(68904)", "!player.debuff(Fan of Flames)", "focus.debuff(Fan of Flames).count >= 2", "toggle.autotaunt"}},
{ "Growl", { "target.id(68397)", "!player.debuff(Decapitate)", "focus.debuff(Decapitate).count >= 1", "toggle.autotaunt"}},
{ "Growl", { "target.id(68397)", "!player.debuff(Fusion Slash)", "focus.debuff(Fusion Slash).count >= 1", "toggle.autotaunt"}},
{ "Growl", { "target.id(68397)", "!player.debuff(Overwhelming Power)", "focus.debuff(Overwhelming Power).count >= 1", "toggle.autotaunt"}},

	
-----------------------------------------------------------------------------------------------------------------------------
-- SoO autotaunt Events --------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
{ "Growl", {"target.id(71543)", "!player.debuff(143436)", "focus.debuff(143436).count >= 1", "toggle.autotaunt"}},         -- Immerseus 1 Stack
{ "Growl", {"target.id(72276)", "!player.debuff(146124)", "focus.debuff(146124).count >= 4", "toggle.autotaunt"}},         -- Norushen 4 Stacks
{ "Growl", {"target.id(71734)", "!player.debuff(144358)", "focus.debuff(144358).count >= 1", "toggle.autotaunt"}},         -- Sha of Pride 1 Stack
{ "Growl", {"target.id(71466)", "!player.debuff(144467)", "focus.debuff(144467).count >= 3", "toggle.autotaunt"}},         -- Iron Juggernaut 3 Stacks
{ "Growl", {"target.id(71859)", "!player.debuff(144215)", "focus.debuff(144215).count >= 5", "toggle.autotaunt"}},         -- Dark Shamans 5 Stacks
        { "Growl", {"target.id(71515)", "!player.debuff(143494)", "focus.debuff(143494).count >= 3", "toggle.autotaunt"}},         -- Nazgrim 3 Stacks
        { "Growl", {"target.id(71454)", "!player.debuff(142990)", "focus.debuff(142990).count >= 13", "toggle.autotaunt"}},         -- Malkorok 13 Stacks
        { "Growl", {"target.id(71504)", "!player.debuff(143385)", "focus.debuff(143385).count >= 3", "toggle.autotaunt"}},                -- Blackfuse 3 Stacks !!!
        { "Growl", {"target.id(71529)", "!player.debuff(143426)", "focus.debuff(143426).count >= 3", "toggle.autotaunt"}},         -- Thok 3 Stacks Fearsome Roar
        { "Growl", {"target.id(71529)", "!player.debuff(143780)", "focus.debuff(143780).count >= 3", "toggle.autotaunt"}},         -- Thok 3 Stacks Acid Breath
        { "Growl", {"target.id(71529)", "!player.debuff(143773)", "focus.debuff(143773).count >= 3", "toggle.autotaunt"}},         -- Thok 3 Stacks Freezing Breath
        { "Growl", {"target.id(71865)", "!player.debuff(145183)", "focus.debuff(145183).count >= 3", "toggle.autotaunt"}},         -- Garrosh 3 Stacks Gripping Despair
        { "Growl", {"target.id(71865)", "!player.debuff(145195)", "focus.debuff(145195).count >= 3", "toggle.autotaunt"}},         -- Garrosh 3 Stacks Empowered Gripping Despair

--Cat Form DPS hold Control

{{
--AOE
{{
	{ "Ferocious Bite", "player.combopoints = 5" },
	{ "Thrash", "!target.debuff(Thrash)" },
	{ "Swipe" },
}, "modifier.multitarget" },

--Single Target
{{
	{ "Mangle", "!target.debuff(Infected Wounds)" },
	{ "Ferocious Bite", { "player.combopoints = 5", "target.debuff(Rip).duration > 3" }},
	{ "Rip", { "!target.debuff(Rip)", "player.combopoints = 5" }},
	{ "Rake", "!target.debuff(Rake)" },
	{ "Rake", "target.debuff(Rake).duration < 4" },
	{ "Mangle", "player.combopoints < 5" }
}, "!modifier.multitarget" },
}, "player.buff(Cat Form)" },

--Buffs
{ "Mark of the Wild", { 
	"!player.buff(Mark of the Wild)",
	"!player.buff(Cat Form)", 
    "!player.buff(Bear Form)", 
    "!player.buff(Travel Form)", 
    "!player.buff(Aquatic Form)", 
    "!player.buff(Flight Form)", 
    "!player.buff(Swift Flight Form)", 
	"!player.buff(Treant Form)",
    "!player.buff(117666)", -- Legacy of the Emperor Buff
    "!player.buff(1126)", -- Mark of the Wild
    "!player.buff(90363)", -- Embrace of the Shale Spider
    "!player.buff(20217)" -- Blessing of Kings
    --Mark of the Wild if missing buff
}},
{ "Healing Touch", "player.buff(Dream of Cenarius)", "player" },
{{

-- Interrupts
{{
  	{ "Skull Bash" },
  	{ "Mighty Bash", { "player.spell(Skull Bash).cooldown", "!modifier.last(Skull Bash)" }},
	{ "Bear Hug", { "player.spell(Skull Bash).cooldown", "!modifier.last(Skull Bash)", "!modifer.last(Mighty Bash)" }},
}, "modifier.interrupts" },


--Survival
	{ "Savage Defense", {
    "!player.buff",
    "player.rage >= 70"
  	}},
  	{ "Barkskin", "player.health < 90" },
  	{ "Bone Shield", "player.health < 85" },
  	{ "Cenarion Ward" , "player.health < 80", "player" },
  	{ "Frenzied Regeneration", {
	"player.rage > 20",
    "player.health < 80"
  	}},
  	{ "Might of Ursoc", "player.health < 60" },
  	{ "Survival Instincts", "player.health < 50" },
  	{ "Renewal", "player.health < 40" },


--Cooldowns
	{ "Berserk" , "modifier.cooldowns" },
	{ "Incarnation: Son of Ursoc", {
    "!player.buff(Incarnation: Son of Ursoc)",
    "modifier.cooldowns"
  	}},
  	{ "Natures Vigil" },
	{ "Force of Nature", "!modifier.last(Forece of Nature)" },


--AOE
{{
	{ "Maul", "player.rage > 80" },
	{ "Thrash", "target.range <= 12" },
	{ "Swipe", "target.range <= 12" },
	{ "Mangle" },
	}, "modifier.multitarget" },

--Single Target
{{
	{ "Swipe", "modifier.alt" },
	{ "Enrage", "player.rage < 20" },
	{ "Mangle" },
	{ "Thrash", "target.debuff.duration < 6" },
	{ "Lacerate" },
	{ "Maul", "player.buff(Tooth and Claw)" },
  	{ "Maul", "player.rage >= 85" },
	{ "Faerie Fire" },
	}, "!modifier.multitarget" },
	
}, "player.buff(Bear Form)" },
	
-- Out Of Combat
},
{
--Buffs
{ "Mark of the Wild", { 
	"!player.buff(Mark of the Wild)",
	"!player.buff(Cat Form)", 
    "!player.buff(Bear Form)", 
    "!player.buff(Travel Form)", 
    "!player.buff(Aquatic Form)", 
    "!player.buff(Flight Form)", 
    "!player.buff(Swift Flight Form)", 
	"!player.buff(Treant Form)",
    "!player.buff(117666)", -- Legacy of the Emperor Buff
    "!player.buff(1126)", -- Mark of the Wild
    "!player.buff(90363)", -- Embrace of the Shale Spider
    "!player.buff(20217)" -- Blessing of Kings
    --Mark of the Wild if missing buff
}},

}, function()
ProbablyEngine.toggle.create('autotaunt', 'Interface\\Icons\\Ability_Monk_Provoke', 'Auto Taunt', 'Toggle Auto Taunting for Bosses.')

end)