--Raid Healing Code

ProbablyEngine.library.register('coreHealing', {
  needsHealing = function(percent, count)
    return ProbablyEngine.raid.needsHealing(tonumber(percent)) >= count
  end,
  needsDispelled = function(spell)
    for unit,_ in pairs(ProbablyEngine.raid.roster) do
      if UnitDebuff(unit, spell) then
        ProbablyEngine.dsl.parsedTarget = unit
        return true
      end
    end
  end,
})

ProbablyEngine.rotation.register_custom(270, "Koha's Mist", {

-- Trinkets
 { "#gloves", "!player.casting" },
 { "#trinket1", "!player.casting"  },
 { "#trinket2", "!player.casting"  },
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

{{
--Dispell
  { "Detox", "@coreHealing.needsDispelled('Aqua Bomb')" },
--SoO Dispells 
  { "Detox", "@coreHealing.needsDispelled('Shadow Word: Bane')" },
  { "Detox", "@coreHealing.needsDispelled('Lingering Corruption')" },
  { "Detox", { "player.buff(Power of the Titans)", "@coreHealing.needsDispelled('Mark of Arrogance')", }}, 
  { "Detox", "@coreHealing.needsDispelled('Corrosive Blood')" },
  }, "toggle.detox" },
  
--Healing Logic
{ "Renewing Mist", { "lowest.health <= 99", "!lowest.buff(Renewing Mist)" }, "lowest" },
{ "Surging Mist", { "lowest.health < 97", "player.buff(Vital Mists).count = 5" }, "lowest" },
{ "Renewing Mist", "focus.health <= 100", "focus" },
{ 'Renewing Mist', '@coreHealing.needsHealing(85, 3)', "lowest" },
{ 'Revival', { 'modifier.cooldowns', '@coreHealing.needsHealing(50, 15)' }, "lowest" },
{ 'Uplift', { 'player.chi >= 2', '@coreHealing.needsHealing(90, 3)', 'lowest.buff(Renewing Mist)' }, 'lowest' },
{ 'Uplift', { 'player.chi >= 5', '@coreHealing.needsHealing(93, 3)', 'lowest.buff(Renewing Mist)' }, "lowest" },
{ 'Spinning Crane Kick', { 'modifier.multitarget', 'player.mana > 55', 'player.chi < 4', '@coreHealing.needsHealing(93, 3)', 'lowest.range < 10' }},

{ 'Zen Sphere', "focus.health < 85" },
{ 'Chi Burst', "focus.health < 85" },
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
{ "Mana Tea", { "player.buff(Mana Tea).count >= 2", "player.mana < 60", }},
{ "Surging Mist", "player.buff(Vital Mists).count = 5" },
{ "Blackout Kick", { "!player.buff(Serpent's Zeal)", "player.chi > 2", "player.buff(Muscle Memory)" }},
{ "Blackout Kick", "player.chi >= 4" },
{ "Blackout Kick", { "player.buff(Muscle Memory)", "player.chi >= 3" }},
{ "Blackout Kick", { "player.chi >= 2", "modifier.enemies > 2" }},
{ "Tiger Palm", { "player.buff(Muscle Memory)", "player.chi >= 1" }},
{ "Jab", { "!player.buff(Muscle Memory)", "player.chi <= 5" }},
}, "toggle.fistweaving" },

-- Mist Weaving
{{
{{
{ "Mana Tea", { "player.buff(Mana Tea).count >= 2", "player.mana < 50", }},
{ 'Surging Mist', { '!player.moving', 'player.casting(Soothing Mist)', 'player.chi < 5', '@coreHealing.needsHealing(60, 1)' }, 'lowest'}, -- 0.3
{ 'Enveloping Mist', { '!player.moving', 'player.casting(Soothing Mist)', 'player.chi >= 3', '!focus.buff(Enveloping Mist)', '@coreHealing.needsHealing(85, 1)' }, 'lowest'},
{ 'Soothing Mist', { '!player.moving', '@coreHealing.needsHealing(93, 1)' }, 'lowest' },
}, "!toggle.fistweaving" }, 
}, "!toggle.lightningweaving" },
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