-- ProbablyEngine Rotation Packager
-- Custom Profile using Tao's Healing lodgic i've added my version of fist and Lightning weaving to it.
ProbablyEngine.rotation.register_custom(270, "Koha's Mist", {

-- Trinkets
 { "#gloves" },
 { "#trinket1" },
 { "#trinket2" },
-- Interrupts
  { "Spear Hand Strike", "modifier.interrupts" },

-- Survival
  { "Expel Harm", "player.health < 80" },

-- Statue
{ "Summon Jade Serpent Statue", "modifier.alt", "ground"},

-- Cooldowns
{ "Invoke Xuen, the White Tiger", "modifier.cooldowns" },
 
-- Life Cocoon on the tank if he's low. 
  { 'Life Cocoon', { 'modifier.cooldowns', 'tank.health < 10' }, 'tank' },

-- Mana
{ "Mana Tea", { "player.buff(Mana Tea).count >= 12", "player.mana > 10", }},
{ "Mana Tea", "player.mana < 10" },



  -- Detox if needed. 
  { '!Detox', { 'player.buff(Gift of the Titans)', '@coreHealing.needsDispelled("Mark of Arrogance")' }, nil },
  -- { '!Detox', { '@coreHealing.needsDispelled("Displaced Energy")', 'z_z work to do' }, nil },
  { '!Detox', '@coreHealing.needsDispelled("Shadow Word: Bane")', nil },
  { '!Detox', '@coreHealing.needsDispelled("Corrosive Blood")', nil },
  { '!Detox', '@coreHealing.needsDispelled("Harden Flesh")', nil },
  { '!Detox', '@coreHealing.needsDispelled("Torment")', nil },
  { '!Detox', '@coreHealing.needsDispelled("Breath of Fire")', nil },
  { '!Detox', '@coreHealing.needsDispelled("Aqua Bomb")', nil },
  { '!Detox', { 'toggle.detox', '@mistweaver.detox()' }, nil },

  
  
--Healing Logic
{ "Renewing Mist", "@coreHealing.needsHealing (99, 1)", nil },
{ "Surging Mist", { "@coreHealing.needsHealing(95, 1)", "player.buff(Vital Mists).count = 5" }},
{ "Renewing Mist", "target.role(tank).health <= 100" },
{ 'Renewing Mist', '@coreHealing.needsHealing(85, 3)', nil },
{ 'Revival', { 'modifier.cooldowns', '@coreHealing.needsHealing(50, 15)' }, nil },
{ 'Uplift', { 'player.chi >= 2', '@mistweaver.uplift(90000)' }, nil },
{ 'Uplift', { 'player.chi >= 5', '@mistweaver.uplift(60000)' }, nil },
{ 'Uplift', { 'player.chi >= 2', '@coreHealing.needsHealing(85, 3)' }, nil },
{ 'Spinning Crane Kick', { 'modifier.multitarget', 'player.mana > 55', 'player.chi < 4', '@mistweaver.spinningCraneKick(3)' }, nil },

{ 'Zen Sphere', "target.role(tank).health < 85" },
{ 'Chi Burst', "target.role(tank).health < 85" },
{ "Chi Brew", "player.chi < 2" },
{ "Chi Wave" },


-- Rotation
{{ --LightningWeave Toggle
{{  -- Free State(Lucidity)
{ "Renewing Mist" },
{ "Blackout Kick", "player.buff(Muscle Memory)" },
{ "Tiger Palm", "player.buff(Muscle Memory)" },
{ "Jab" },
{ "Crackling Jade Lightning" },
}, "player.buff(Lucidity)" },

{{ -- Bloodlust
{ "Blackout Kick" },
{ "Crackling Jade Lightning" },
}, "player.buff(BloodLust)" },
{{ -- Heroism
{ "Blackout Kick" },
{ "Crackling Jade Lightning" },
}, "player.buff(Heroism)" },
{{ -- Time Warp
{ "Blackout Kick" },
{ "Crackling Jade Lightning" },
}, "player.buff(Time Warp)" },

{{ --Perfect Aim Burst
{ "Crackling Jade Lightning" },
}, "player.buff(Perfect Aim)" },

{{ --OOM State
{ "Mana Tea", "player.buff(Mana Tea)" },
{ "Blackout Kick", "!player.buff(Serpent's Zeal)" },
{ "Expel Harm" },
}, "player.mana < 15" },

{{ --Mana Saving State
{ "Mana Tea", { "player.buff(Mana Tea).count >= 2", "player.mana < 80", }},
{ "Blackout Kick", "!player.buff(Serpent's Zeal)" },
{ "Tiger Palm", "player.buff(Tiger Power).duration < 3" },
{ "Blackout Kick", "player.chi >= 2" },
{ "Expel Harm" },
{ "Crackling Jade Lightning" },
}, "player.mana < 35" },

{{ --Above 35% Mana
{ "Tiger Palm", "!player.buff(Tiger Power)" },
{ "Blackout Kick", "!player.buff(Serpent's Zeal)" },
{ "Tiger Palm", "player.buff(Tiger Power).duration < 3" },
{ "Blackout Kick", "player.chi >= 2" },
{ "Crackling Jade Lightning" },
}, "player.mana > 35" },

{{ --Out of Melee Range
{ "Crackling Jade Lightning"},
}, "player.range >= 10" },
}, "toggle.lightningweaving" },

--FistWeaving
{{
{ "Mana Tea", { "player.buff(Mana Tea).count >= 2", "player.mana < 80", }},
{ "Surging Mist", "player.buff(Vital Mists).count = 5" },
{ "Tiger Palm", { "player.buff(Muscle Memory)", "player.chi >= 2" }},
{ "Blackout Kick", { "!player.buff(Serpent's Zeal)", "player.chi > 2" }},
{ "Blackout Kick", { "player.buff(Muscle Memory)", "player.chi >= 3" }},
{ "Blackout Kick", { "player.chi >= 2", "modifier.enemies > 2" }},
{ "Tiger Palm", "player.chi >= 3" },
{ "Expel Harm" },
{ "Jab" },
}, "toggle.fistweaving" },

-- Mist Weaving
{ "Mana Tea", { "player.buff(Mana Tea).count >= 2", "player.mana < 50", }},
{ 'Surging Mist', { '!player.moving', 'player.casting(Soothing Mist)', 'player.chi < 5', '@mistweaver.soothingTarget(60)' }, nil}, -- 0.3
{ 'Enveloping Mist', { '!player.moving', 'player.casting(Soothing Mist)', 'player.chi >= 3', '!focus.buff(Enveloping Mist)', '@mistweaver.soothingTarget(85)' }, nil},
{ 'Soothing Mist', { '!player.moving', '@mistweaver.soothingMist(90, 95, 65)' }, nil },
-- Out Of Combat
},
{
{ "Legacy of the Emperor", {
	"!player.buff(Legacy of the Emperor)",
	"!player.buff(Blessing of Kings)",
  	"!player.buff(Mark of the Wild)",
  	"!player.buff(Embrace of the Shale Spider)",
}},
{ "Summon Jade Serpent Statue", "modifier.alt", "ground" },
{ "Stance of the Wise Serpent", "player.seal != 1" },

}, function ()
  ProbablyEngine.toggle.create('detox', 'Interface\\Icons\\Spell_Holy_DispelMagic', 'Detox Everything', '')
  ProbablyEngine.toggle.create('fistweaving', 'Interface\\Icons\\ability_monk_tigerpalm', 'Fistweave', '')
  ProbablyEngine.toggle.create('lightningweaving', 'Interface\\Icons\\ability_monk_CracklingJadeLightning', 'Lightning Weaving', '')
end)