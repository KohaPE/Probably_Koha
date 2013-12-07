
-- ProbablyEngine Rotation Packager
-- Custom Brewmaster Monk Rotation
-- Created on Nov 18th 2013 10:23 am
ProbablyEngine.rotation.register_custom(269, "KohasWindWalker", {

--Buff
	{ "Legacy of the Emperor", {
		"!player.buff(Legacy of the Emperor)",
		"!player.buff(Blessing of Kings)",
  		"!player.buff(Mark of the Wild)",
  		"!player.buff(Embrace of the Shale Spider)",
	}},
{ "Legacy of the White Tiger", "!player.buff(Legacy of the White Tiger)" },

--Interupts
{{
{ "Spear Hand Strike" },
{ "Leg Sweep" },
{ "Charging Ox Wave" },
{ "Ring of Peace", "player" },
}, "modifier.interrupts", },
{ "!/cast [@mouseover,harm,exists][] storm, earth, and fire", "modifier.control" },

--Self Healing T2
{ "Zen Sphere", "!player.buff(Zen Sphere)", "player" },
{ "Chi Burst" },
{ "Chi Wave" },
{ "#trinket1" },
{ "#trinket2" },
{ "#gloves"},
--Shared Rotations
{ "Expel Harm", "player.health < 80" },
{ "Tigereye Brew", "player.buff(Tigereye Brew).count >= 10" },
{ "Energizing Brew", { "player.energy < 20", "player.spell(Fists of Fury).cooldown" }},
{ "Touch of Karma", "player.health < 90" },
{ "Grapple Weapon", "modifier.alt" },
{{
--Rotation Single Target/multi target
{ "Spinning Crane Kick", { "modifier.multitarget", "!player.buff(Rushing Jade Wind)" }},
{ "Rising Sun Kick" },
{ "Tiger Palm", "player.buff(Combo Breaker: Tiger Palm)" },
{ "Tiger Palm", "player.buff(Tiger Power).duration < 3" },
{ "Fists of Fury", { "player.energy <= 40", "player.buff(Tiger Power).duration > 5", "!player.moving", "!player.buff(Energizing Brew)" }},
{ "Blackout Kick", "player.buff(Combo Breaker: Blackout Kick)" },
{ "Blackout Kick", "player.chi >= 3" },
{ "Jab" },
}, "player.range <= 5" },


-- Out Of Combat
},
{
{ "Legacy of the Emperor", {
	"!player.buff(Legacy of the Emperor)",
	"!player.buff(Blessing of Kings)",
  	"!player.buff(Mark of the Wild)",
  	"!player.buff(Embrace of the Shale Spider)",
}},
{ "Legacy of the White Tiger", "!player.buff(Legacy of the White Tiger)" },

})