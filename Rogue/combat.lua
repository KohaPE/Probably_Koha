-- ProbablyEngine Rotation Packager
ProbablyEngine.rotation.register_custom(260, "Koha's Combat Rogue", {

-- Trinkets
 { "#gloves" },
 { "#trinket1" },
 { "#trinket2" },
-- Interrupts
{ "Redirect", "modifier.shift" },
{ "Kick", "modifier.interrupts" },
{ "Blade Flurry", "modifier.alt" },

--Healing
{ "Recuperate", { "!player.buff(Recuperate)", "player.health < 80" }},
--Defence
{ "Cloak of Shadows", "player.health < 50" },
{ "Stealth", "player.buff(Cloak of Shadows)" },
-- Cooldowns
{{
{ "Killing Spree", "player.energy <= 20" },
{ "Adrenaline Rush", { "player.energy < 20", "!player.buff(Killing Spree)" }},
}, "modifer.cooldowns" },
  { "Ambush", "player.buff(Stealth)" },
  
 --AoE
 {{
 { "/!cancelaura Blade Flurry", "player.buff(Blade Flurry)" },
 { "Crimson Tempest", { "player.energy >= 35", "player.combopoints = 5", }},
 { "Fan of Knives", "player.energy >= 40" },
 }, "modifier.multitarget" },
 

-- Stealh Opening
{{
{ "Rupture", { "!player.buff(Blade Flurry)", "target.ttd > 20", "player.buff(Slice and Dice)", "!target.debuff(Rupture)", "player.combopoints = 5" }},
{ "Eviscerate", { "player.buff(Slice and Dice)", "player.combopoints >= 4" }},
{ "Slice and Dice", { "player.buff(Slice and Dice).duration <= 5", "player.combopoints >= 3", "!player.buff(Stealth)" }},
{ "Slice and Dice", { "!player.buff(Slice and Dice)", "player.combopoints = 5", "!player.buff(Stealth)" }},
{ "Shadowstep", { "player.spell(36554).exists", "player.range > 10", "player.range < 25" }},
{ "Revealing Strike", { "!player.buff(Stealth)", "!target.debuff(Revealing Strike)", "player.combopoints <= 3" }},
{ "Sinister Strike", "player.combopoints < 5" },
}, "!modifier.multitarget" },
-- Out Of Combat
},
{

  -- Out of Combat
  { "Deadly Poison", "!player.buff(Deadly Poison)" },
  { "Leeching Poison", "!player.buff(Leeching Poison)" },
{ "Stealth", "player.seal != 1" },
{ "Shadowstep", { "player.spell(36554).exists", "player.range > 10", "player.range < 25" }},
{ "Ambush", { "player.behind", "player.buff(Stealth)" }},

}, function ()
 ProbablyEngine.toggle.create('pvp', 'Interface\\Icons\\Spell_Shadow_Nethercloak', 'Player Vs Player', '')
end)