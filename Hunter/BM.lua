-- ProbablyEngine Rotation Packager
-- Custom Beast Mastery Hunter Rotation
-- Created on Nov 16th 2013 10:44 pm
ProbablyEngine.rotation.register_custom(253, "BMKoha", {


--Aspect Check
{ "Aspect of the Hawk", { "!player.moving", "!player.buff(Aspect of the Hawk)", "!player.buff(Aspect of the Iron Hawk)", }},
{ "Aspect of the Iron Hawk", { "!player.moving", "!player.buff(Aspect of the Hawk)", "!player.buff(Aspect of the Iron Hawk)", }},
	
	--other
	{ "Feign Death", "modifier.control" },
	{ "pause", "modifier.control" },

-- Misdirect Test
	{ "!/cast [@focus, help] [@pet, nodead, exists] Misdirection", "modifier.shift" },
	
	--Auto Target Enemy 
  { "!/targetenemy [noharm]", {
    "!target.alive", 
	"!target.enemy",
	"!target.exists",
	"target.range < 10",
  }},

--Racial Cooldowns
	{ "Berserking", "modifier.cooldowns" },
	{ "Blood Fury", "modifier.cooldowns" },

-- Pet
	{ "!/cast [@pet,dead] Revive Pet; Call Pet 1", "!pet.alive" },
	{ "!/cast [@pet,dead] Revive Pet; Call Pet 1", "!pet.exists" },
	
	{ "Misdirection", { "focus.exists", "!player,buff(Misdirection)", "target.threat > 60" }, "focus" },
    { "Misdirection", { "pet.exists", "!player,buff(Misdirection)", "!focus.exists", "target.threat > 85" }, "pet" },

-- Traps
	{ "Explosive Trap", "modifier.alt", "ground" },
	{ "Snake Trap", "modifier.alt", "ground" },
	{ "Freezing Trap" , "modifier.alt", "ground" },

-- Interupts
	{ "Counter Shot", "modifier.interrupts" },
	{ "Scatter Shot", { "player.range < 19", "modifier.interrupts" }},

-- Survival
    { "Exhilaration", "player.health < 50" },

-- Pet Survival
    { "Mend Pet", {
        "pet.health <= 80",
        "pet.exists",
        "!pet.buff(Mend Pet)"
    }},
    
-- Cooldowns 
    { "Rapid Fire", "modifier.cooldowns" },
    { "Bestial Wrath", "modifier.cooldowns" },
    { "Rabid", {
    "player.buff(The Beast Within)",
    "modifier.cooldowns",
    }},

--Tier 5 Talents
    { "Stampede", "modifier.cooldowns" },
    { "A Murder of Crows", "modifier.cooldowns" },


--Shared Rotation
{ "Kill Shot", "target.health < 20" },
{ "Focus Fire", "player.buff(Frenzy).count = 5" },
{ "Glaive Toss", "player.focus > 15" },


-- AoE
{ "Multi-Shot", {
"player.focus > 40",
"modifier.multitarget",
}},
{ "Cobra Shot", "modifier.multitarget" },

--Rotation
--Single Target
{{
{ "Dire Beast", "player.spell(Dire Beast).usable" },
{ "Kill Command", "player.focus > 40" },
{ "Serpent Sting", "!target.debuff(Serpent Sting)" },
{ "Arcane Shot", "player.focus > 60" },
{ "Powershot" },
{ "Cobra Shot", "player.focus < 100" },
}, "!modifier.multitarget" },
 
   
-- Out Of Combat
},
{
--Buffs
{ "!/cast [@focus, help] [@pet, nodead, exists] Misdirection", { "!player.buff(Misdirection)", "modifier.shift" }},
-- Pet Survival
{ "Mend Pet", { "pet.health <= 80", "pet.exists", "!pet.buff(Mend Pet)" }},
{ "Aspect of the Hawk", { "!player.moving", "!player.buff(Aspect of the Hawk)", "!player.buff(Aspect of the Iron Hawk)", }},
{ "Aspect of the Iron Hawk", { "!player.moving", "!player.buff(Aspect of the Hawk)", "!player.buff(Aspect of the Iron Hawk)", }},


})