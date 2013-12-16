-- ProbablyEngine Rotation Packager
-- Custom Demo Warlock Rotation
-- Created on Nov 13th 2013 6:18 am
ProbablyEngine.rotation.register_custom(266, "DemonicKoha", {

--Mana Management
{ "Life Tap", { "player.mana < 40", "player.health > 70", }},


--Rotation Shared
{ "Command Demon", { "pet.energy > 60", "modifier.multitarget", }},
{ "Curse of Elements", "!target.debuff(Curse of Elements)" },
--Rotation Meta
{ "Metamorphosis", { "player.demonicfury >= 970", "target.debuff(Corruption).duration >= 10", }},
{ "!/cancelaura Metamorphosis", "player.demonicfury <= 100" },
{{
	{ "Corruption", "!target.debuff(Doom)" },
	{ "Corruption", "player.demonicfury < 200" },
	{ "Immolation Aura", { "player.range <= 8", "modifier.multitarget", }},
	{ "Hand of Gul'dan", "modifier.multitarget" },
	{ "Shadow Bolt", "target.debuff(Corruption).duration <= 15" },
	{ "Soul Fire", "player.buff(Molten Core).count >= 2" },
	{ "Soul Fire", { "target.health < 25", "player.buff(Molten Core).count >= 2", }},
	{ "Dark Soul: Knowledge", "player.buff(Bloodlust)" },
	{ "Shadow Bolt" },
}, "player.buff(Metamorphosis)" },
--Rotation Single
{{
	{ "Corruption", { "target.debuff(Corruption).duration <= 10", "player.demonicfury >= 950" }},
	{ "Corruption", "target.debuff(Corruption).duration < 3" },
	{ "Hand of Gul'dan", { "!modifier.last(Hand of Gul'dan)", "!target.debuff(Shadowflame)" },
	{ "Soul Fire", "player.buff(Molten Core).count >= 2" },
	{ "Soul Fire", { "target.health < 25", "player.buff(Molten Core)", }},
	{ "Shadow Bolt" },
}, "!player.buff(Metamorphosis)" },

-- Out Of Combat
},
{
{ "Dark Intent", "!player.buff(Dark Intent)" },
{ "Summon Wrathguard", "!pet.alive" },
{ "!/cancelaura Metamorphosis" },
})