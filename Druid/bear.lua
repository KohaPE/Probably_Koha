
-- ProbablyEngine Rotation Packager
-- Custom Guardian Druid Rotation
-- Created on Nov 2nd 2013 1:03 am
ProbablyEngine.rotation.register_custom(104, "DruidBearKoha", {


--Buffs
	{ "Mark of the Wild", "!player.buff(Mark of the Wild)" },
	{ "!/cast Bear Form", "!player.buff(Bear Form)" },
	{ "Healing Touch", "player.buff(Dream of Cenarius)", "player" },


-- Interrupts
  	{ "Skull Bash", "modifier.interrupts" },
  	{ "Mighty Bash" , "modifier.interrupts" },
	{ "Bear Hug", "modifier.interrupts" },


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


--AOE
	{ "Thrash", "modifier.multitarget" },
	{ "Swipe", "modifier.multitarget" },

--Single Target
	{ "Swipe", "modifier.alt" },
	{ "Enrage", "player.rage < 20" },
	{ "Mangle" },
	{ "Thrash", "target.debuff.duration < 6" },
	{ "Lacerate" },
	{ "Maul", "player.buff(Tooth and Claw)" },
  	{ "Maul", "player.rage >= 85" },
	{ "Faerie Fire" },
	
-- Out Of Combat
},
{
--Buffs
{ "Mark of the Wild", "!player.buff(Mark of the Wild)" },

})