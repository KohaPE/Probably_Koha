-- ProbablyEngine Rotation Packager
-- Custom Brewmaster Monk Rotation
-- Created on Nov 18th 2013 10:23 am
ProbablyEngine.rotation.register_custom(268, "Kohabrewmaster", {

--Buff
	{ "Legacy of the Emperor", {
		"!player.buff(Legacy of the Emperor)",
		"!player.buff(Blessing of Kings)",
  		"!player.buff(Mark of the Wild)",
  		"!player.buff(Embrace of the Shale Spider)",
	}},
	{ "#gloves" },
{ "#trinket1" },
{ "#trinket2" },
--Modifier Keys
{ "Dizzying Haze", "modifier.shift", "ground" },
{ "Summon Black Ox Statue", "modifier.alt", "ground" },
{ "Invoke Xuen, the White Tiger", "modifier.control" },

-- Defensives
	{ "Elusive Brew", "player.buff(Elusive Brew).count >= 10" },
	{ "Fortifying Brew", "player.health <= 35" },
	{ "Damnpen Harm", "player.health < 40" },

--Interupts
{ "Spear Hand Strike", "modifier.interrupts" },
{ "Leg Sweep", { "target.range <= 5", "modifier.interrupts", }},
{ "Charging Ox Wave", "modifier.interrupts", "target.range <= 30" },
{ "Ring of Peace", "modifier.interrupts", "player" },

--Self Healing T2
{{
{ "Zen Sphere", "!player.buff(Zen Sphere)", "player" },
{ "Chi Burst" },
{ "Chi Wave" },
}, "player.health <= 100" },

-- Chi Brew
--{ "Chi Brew", { "player.spell(Chi Brew).exists", "player.chi <= 0", "!player.buff(Shuffle)", "!player.buff(Guard)", }},
-- Stagger
	{ "Purifying Brew", "player.debuff(Moderate Stagger)" },
  	{ "Purifying Brew", "player.debuff(Heavy Stagger)" },

--Shared Rotations
{ "Keg Smash" },
{ "Guard", { "player.health <= 99", "player.buff(Power Guard)" }},
-- Stagger
	{ "Purifying Brew", "player.debuff(Moderate Stagger)" },
  	{ "Purifying Brew", "player.debuff(Heavy Stagger)" },
{{
{ "Blackout Kick", "!player.buff(Shuffle)" },
{ "Blackout Kick", "player.buff(Shuffle).duration < 20" },
{ "Breath of Fire", "player.buff(Shuffle).duration > 20" },
}, "player.chi >= 3" },

--Rotation AoE
{{
{ "Expel Harm", "player.health < 80" },
{ "Blackout Kick", "!player.buff(Shuffle)" },
{ "Breath of Fire", "!target.debuff(Breath of Fire)" },
{ "Rushing Jade Wind", { "player.range <= 8", "!player.buff(Russhing Jade Wind" }},
{ "Spinning Crane Kick" },
{ "Jab" },
{ "Tiger Palm" },
{ "Grapple Weapon" },
}, "modifier.multitarget" },

--Rotation Single Target
{{
{ "Expel Harm", "player.health < 80" },
{ "Tiger Palm", "!player.buff(Tiger Power)" },
{ "Tiger Palm", "player.buff(Tiger Power).duration < 6" },
{ "Tiger Palm", "!player.buff(Power Guard)" },
{ "Jab" },
{ "Tiger Palm" },
{ "Grapple Weapon" },
}, "!modifier.multitarget" },


-- Out Of Combat
},
{
{{
{ "Purifying Brew", "player.debuff(Light Stagger)" },
{ "Purifying Brew", "player.debuff(Moderate Stagger)" },
{ "Purifying Brew", "player.debuff(Heavy Stagger)" },
}, "player.chi >= 1" },
{ "Dizzying Haze", "modifier.shift", "ground" },
{ "Legacy of the Emperor", {
	"!player.buff(Legacy of the Emperor)",
	"!player.buff(Blessing of Kings)",
  	"!player.buff(Mark of the Wild)",
  	"!player.buff(Embrace of the Shale Spider)",
}},
{ "Summon Black Ox Statue", "modifier.alt", "ground" },
{ "Stance of the Sturdy Ox", "player.seal != 1" },

})