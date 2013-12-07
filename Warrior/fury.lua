-- ProbablyEngine Rotation Packager
-- Custom Furry Warrior Rotation
-- Created on Nov 21st 2013 6:56 am
ProbablyEngine.rotation.register_custom(72, "KohasFury", {

--Cooldowns

--Heroic Leap
{ "Heroic Leap", "modifier.shit", "ground", },

--Shared rotation
{ "Colossus Smash" },
--AOE
{{
{ "Cleave", "player.rage > 100" },
{ "Bladestorm", "player.buff(Enrage)" },
{ "Stormbolt", "target.debuff(Colossus Smash)" },
{ "Bloodthirst" },
{ "Raging Blow", "player.buff(Meat Cleaver).count > 3" },
{ "Whirlwind" },
{ "Colossus Smash" },
{ "Battle Shout", "player.rage < 70" },
}, "modifier.multitarget" },

--Single Target inside of Colossus Smash
{{
{ "Berserker Rage" },
{ "Heroic Strike" },
{ "Raging Blow" },
{ "Bloodthirst" },
{ "Wild Strike" },
}, "!target.debuff(Colossus Smash)" },
--Single Target Outside of Colossus Smash
{{
{ "Heroic Strike", "player.rage > 110" },
{ "Bloodthirst" },
{ "Storm Bolt" },
{ "Dragon Roar" },
{ "Raging Blow" },
{ "Execute", "target.health < 20" },
{ "Wild Strike", "player.buff(Bloodsurge)" },
{ "Wild Strike" },
{ "Impending Victory" },
{ "Battle Shout", "player.rage < 50" },
{ "Heroic Throw" },
}, "!modifier.multitarget" },

})