
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
-- ProbablyEngine Rotation Packager
-- Custom Brewmaster Monk Rotation
-- Created on Nov 18th 2013 10:23 am
ProbablyEngine.rotation.register_custom(268, "Koha's brewmaster", {

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
	
	-- Dispell
{ "88423", "@coreHealing.needsDispelled(Aqua Bomb)" }, -- Nature's Cure if player needs Aqua Bomb dispelled.
{ "88423", "@coreHealing.needsDispelled(Aqua Bomb)" },  -- Aqua Bomb (Proving Grounds)
{ "88423", "@coreHealing.needsDispelled(Shadow Word: Bane)" }, -- Shadow Word: Bane (Fallen Protectors)
{ "88423", "@coreHealing.needsDispelled(Lingering Corruption)" },-- Lingering Corruption (Norushen)
{ "88423", { "player.buff(144359)", "@coreHealing.needsDispelled(Mark of Arrogance)" }}, -- Mark of Arrogance (Sha of Pride) 
{ "88423", "@coreHealing.needsDispelled(Corrosive Blood)" },  -- Corrosive Blood (Thok)

-----------------------------------------------------------------------------------------------------------------------------
-- 5.3 autotaunt Events --------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
{ "Provoke", { "target.name(Feng the Accursed)", "!player.debuff(Shadowburn)", "focus.debuff(Shadowburn).count >= 4", "toggle.autotaunt" }},
{ "Provoke", { "target.name(Blade Lord Ta'yak)", "!player.debuff(Overwhelming Assault)", "focus.debuff(Overwhelming Assault).count >= 1", "toggle.autotaunt" }},
{ "Provoke", { "target.name(Grand Empress Shek'zeer)", "!player.debuff(Eyes of the Empress)", "focus.debuff(Eyes of the Empress).count <= 4", "toggle.autotaunt" }},
{ "Provoke", { "target.name(Tsulong)", "!player.debuff(Shadow Breath)", "focus.debuff(Shadow Breath).count >= 1", "toggle.autotaunt"}},
{ "Provoke", { "target.name(Lei Shi)", "!player.debuff(Spray)", "focus.debuff(Spray).count >= 13", "toggle.autotaunt"}},
{ "Provoke", { "target.name(Jin’rokh the Breaker)", "!player.debuff(Static Wound)", "focus.debuff(Static Wound).count >= 1", "toggle.autotaunt"}},
{ "Provoke", { "target.name(Ji-Kun)", "!player.debuff(Talon Rake)", "focus.debuff(Talon Rake).count >= 2", "toggle.autotaunt"}},
{ "Provoke", { "target.name(Durumu the Forgotten)", "!player.debuff(Serious Wound)", "focus.debuff(Serious Wound).count >= 3", "toggle.autotaunt"}},
{ "Provoke", { "target.name(Primordius)", "!player.debuff(Malformed Blood)", "focus.debuff(Malformed Blood).count >= 5", "toggle.autotaunt"}},
{ "Provoke", { "target.name(Iron Qon)", "!player.debuff(Impale)", "focus.debuff(Impale).count >= 2", "toggle.autotaunt"}},
{ "Provoke", { "target.id(68904)", "!player.debuff(Fan of Flames)", "focus.debuff(Fan of Flames).count >= 2", "toggle.autotaunt"}},
{ "Provoke", { "target.id(68397)", "!player.debuff(Decapitate)", "focus.debuff(Decapitate).count >= 1", "toggle.autotaunt"}},
{ "Provoke", { "target.id(68397)", "!player.debuff(Fusion Slash)", "focus.debuff(Fusion Slash).count >= 1", "toggle.autotaunt"}},
{ "Provoke", { "target.id(68397)", "!player.debuff(Overwhelming Power)", "focus.debuff(Overwhelming Power).count >= 1", "toggle.autotaunt"}},

	
-----------------------------------------------------------------------------------------------------------------------------
-- SoO autotaunt Events --------------------------------------------------------------------------------------------------------- 
-----------------------------------------------------------------------------------------------------------------------------
{ "115546", {"target.id(71543)", "!player.debuff(143436)", "focus.debuff(143436).count >= 1", "toggle.autotaunt"}},         -- Immerseus 1 Stack
{ "115546", {"target.id(72276)", "!player.debuff(146124)", "focus.debuff(146124).count >= 4", "toggle.autotaunt"}},         -- Norushen 4 Stacks
{ "115546", {"target.id(71734)", "!player.debuff(144358)", "focus.debuff(144358).count >= 1", "toggle.autotaunt"}},         -- Sha of Pride 1 Stack
{ "115546", {"target.id(71466)", "!player.debuff(144467)", "focus.debuff(144467).count >= 3", "toggle.autotaunt"}},         -- Iron Juggernaut 3 Stacks
{ "115546", {"target.id(71859)", "!player.debuff(144215)", "focus.debuff(144215).count >= 5", "toggle.autotaunt"}},         -- Dark Shamans 5 Stacks
        { "115546", {"target.id(71515)", "!player.debuff(143494)", "focus.debuff(143494).count >= 3", "toggle.autotaunt"}},         -- Nazgrim 3 Stacks
        { "115546", {"target.id(71454)", "!player.debuff(142990)", "focus.debuff(142990).count >= 13", "toggle.autotaunt"}},         -- Malkorok 13 Stacks
        { "115546", {"target.id(71504)", "!player.debuff(143385)", "focus.debuff(143385).count >= 3", "toggle.autotaunt"}},                -- Blackfuse 3 Stacks !!!
        { "115546", {"target.id(71529)", "!player.debuff(143426)", "focus.debuff(143426).count >= 3", "toggle.autotaunt"}},         -- Thok 3 Stacks Fearsome Roar
        { "115546", {"target.id(71529)", "!player.debuff(143780)", "focus.debuff(143780).count >= 3", "toggle.autotaunt"}},         -- Thok 3 Stacks Acid Breath
        { "115546", {"target.id(71529)", "!player.debuff(143773)", "focus.debuff(143773).count >= 3", "toggle.autotaunt"}},         -- Thok 3 Stacks Freezing Breath
        { "115546", {"target.id(71865)", "!player.debuff(145183)", "focus.debuff(145183).count >= 3", "toggle.autotaunt"}},         -- Garrosh 3 Stacks Gripping Despair
        { "115546", {"target.id(71865)", "!player.debuff(145195)", "focus.debuff(145195).count >= 3", "toggle.autotaunt"}},         -- Garrosh 3 Stacks Empowered Gripping Despair

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

}, function()
ProbablyEngine.toggle.create('autotaunt', 'Interface\\Icons\\Ability_Monk_Provoke', 'Auto Taunt', 'Toggle Auto Taunting for Bosses.')

end)