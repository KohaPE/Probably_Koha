-- ProbablyEngine Rotation Packager
-- Custom Survival Hunter Rotation
-- Created on Nov 3rd 2013 10:24 pm
ProbablyEngine.rotation.register_custom(255, "HunterSVKoha", {


-- Stance Check
	--{ "Aspect of the Iron Hawk", "!player.buff(Aspect of the Iron Hawk)" },
	
	{ "Feign Death", "modifier.control" },
	{ "pause", "modifier.control" },

-- Misdirect Test
	--{ "!/cast [btn:1,@focus,nodead,exists][btn:2,@focus,nodead,exists] Misdirection; Misdirection", "modifier.shift" },
	{ "!/cast [@focus, help] [@pet, nodead, exists] Misdirection", "modifier.shift" },

--Racial Cooldowns
	{ "Berserking", "modifier.cooldowns" },
	{ "Blood Fury", "modifier.cooldowns" },

-- Pet
	{ "!/cast [@pet,dead] Revive Pet; Call Pet 1", "!pet.alive" },
	{ "!/cast [@pet,dead] Revive Pet; Call Pet 1", "!pet.exists" },

-- Traps
	{ "Explosive Trap", "modifier.alt", "ground" },
	{ "Snake Trap", "modifier.alt", "ground" },
	{ "Freezing Trap" , "modifier.alt", "ground" },

-- Interupts
	{{{ "Counter Shot" },{ "Scatter Shot", "player.spell(Counter Shot).cooldown" }}, "modifier.interrupts" },

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
{ "Kill Shot", "target.health <= 20" },
    { "Explosive Shot", "player.buff(Lock and Load)" },
    { "Fervor", {
      "player.focus < 50",
    }},
    { "Dire Beast", },

-- Rotation
-- AoE
{ "Barrage", "modifier.multitarget" },
{ "Multi-Shot", {
	"player.buff(Thrill of the Hunt)",
	"player.focus >= 20",
	"modifier.multitarget",
}},
{ "Multi-Shot", {
"modifier.multitarget",
"player.focus > 40", 
}},

-- Single Target
{ "Arcane Shot", "player.focus > 80" },
{ "Explosive Shot", "player.focus >= 45" },
{ "Serpent Sting", "!target.debuff(Serpent Sting)" },
{ "Black Arrow", "!target.debuff(Black Arrow)" },
{ "Arcane Shot", {
 "player.focus > 60",
 "player.buff(Thrill of the Hunt)",
 }},
{ "Glaive Toss" },
{ "Powershot" },
{ "Cobra Shot" },


-- Out Of Combat
},
{
--Buffs
{ "!/cast [@focus, help] [@pet, nodead, exists] Misdirection", "modifier.shift" },
{ "Aspect of the Hawk", {
"player.spell(Aspect of the Hawk).exists",
"!player.buff(Aspect of the Hawk)"
}},
{ "Aspect of the Iron Hawk", {
"player.spell(Aspect of the Iron Hawk).exists",
"!player.buff(Aspect of the Iron Hawk)"
}},


})