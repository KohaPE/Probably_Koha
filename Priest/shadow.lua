-- ProbablyEngine Rotation Packager
-- Custom Shadow Priest Rotation
-- Created on Dec 14th 2013 6:21 am
ProbablyEngine.rotation.register_custom(258, "Koha's Shadow", {

--Trinkets/Gloves
{ "#gloves" },
{ "#trinket1" },
{ "#trinket2" },

--Cooldowns
{ "Shadowfiend", { "modifier.cooldowns", "player.mana < 80" }},

--Heals
{ "Renew", { "!player.buff(Renew)", "player.health < 80" }},
{ "Power Word: Shield", { "player.health <= 100", "player.glyph(33202).exists", "!player.debuff(Weakend Soul)" }},
{ "Power Word: Shield", { "player.health < 80", "!player.debuff(Weakend Soul)", }},


--Shared Rotation
{ "Shadow Word: Death", { "player.shadoworbs <= 2", "target.health <= 20" }},
{ "Mind Blast", { "player.buff(Devine Insight)", "player.shadoworbs <= 2", }},
{ "Shadow Word: Death" },

--AoE Rotation
{ "Mind Sear", "modifier.multitarget" },

--Single Target Rotation
{{
{ "Devouring Plague", { "player.shadoworbs = 3", "target.ttd >= 6", "!target.debuff(Devouring Plague)", }},
{ "Mind Flay", "target.debuff(Devouring Plague)" },
{ "Mind Blast", { "!player.moving", "player.shadoworbs < 3" }},
{ "Vampiric Touch", { "!player.moving", "!modifier.last(Vampiric Touch)", "target.debuff(Vampiric Touch).duration < 5" }},
{ "Shadow Word: Pain", "target.debuff(Shadow Word: Pain).duration < 3" },
{ "Shadow Word: Pain", { "!target.debuff(Shadow Word: Pain)", "!modifier.last(Shadow Word: Pain)", "target.ttd >= 15" }},
{ "Vampiric Touch", { "!player.moving", "!target.debuff(Vampiric Touch)", "!modifier.last(Vampiric Touch)" }},
{ "Mind Flay", "!player.moving" },
{ "Shadow Word: Death" },
}, "!modifier.multitarget" },



},
--Out of Combat
{
-- Shadow Form
{ "Shadowform", "player.seal != 1" },
{ "Inner Fire", "!player.buff(Inner Fire)" },
{ "Power Word: Shield", { "player.health <= 100", "player.glyph(33202).exists", "!player.debuff(Weakend Soul)" }}
})