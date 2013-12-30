
-- ProbablyEngine Rotation Packager
-- Custom Guardian Druid Rotation
-- Created on Nov 2nd 2013 1:03 am
ProbablyEngine.rotation.register_custom(104, "DruidBearKoha", {

{ "!/cast Bear Form", { "!player.buff(Bear Form)", "modifier.control" }},
{ "!/cast Cat Form", { "!player.buff(Cat Form)", "modifier.control" }},
{ "!/cast Bear Form", { "!player.buff(Bear Form)", "!player.buff(Cat Form)" }},

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
    "!player.buff",
    "player.health < 70"
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
	{ "Thrash", "target.range <= 8" },
	{ "Swipe", "target.range <= 8" },
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
{ "Mark of the Wild", "!player.buff(Mark of the Wild)" },

})