-- ProbablyEngine Rotation Packager
-- Custom Enhancement Shaman Rotation
-- Created on Nov 20th 2013 6:12 pm
ProbablyEngine.rotation.register_custom(263, "Mavmins Enhancement", {

-- Buffs
        { "8238", "!player.enchant.mainhand" }, --Windfury
        { "8024", "!player.enchant.offhand" }, --Flametounge
        { "324", "!player.buff(324)" }, --Lightning Shield
        
        --Utility Interrupt
        
        --Wind Shear
         { "57994", {
                "target.exists",
                "target.casting",
                "@mavmins.interruptCast",
                "modifier.interrupts"}},
                  
         --Healing / Survival
         
        {{
        --Healthstone
        {"#5512", "player.health < 45"},
                        
        --Draenei: Gift of the Naaru
        { "59544", {
                "player.spell(59544).exists",
                "!player.buff(59544)",
                "player.health < 71"}},
        
        --Astral shift
        { "108271", {
                "player.spell(108271).exists",
                "!player.buff(108271)",
                "!player.buff(30823)",
                "player.health < 51"}},
        
        --Shamanistic Rage----
        { "30823", {
                "!player.buff(108271)",
                "!player.buff(30823)",
                "player.health < 56"}},
                
        --Healing Stream Totem
        { "5394", {
                "!player.totem(5394)",
                "!player.totem(108280)",
                "player.health < 74"}},
        
        --Healing Tide Totem----
        { "108280", {
                "!player.totem(108280)",
                "player.health < 40"}},
                
        --Healing Surge----
        { "8004", {
                "player.mana >= 30",
                "player.health < 30"}},
                
        --Stone Bulwark Totem
        { "108270", {
                "player.spell(108270).exists",
                "!player.totem(108270)",
                "player.health < 90"}},
                
        }, "toggle.healing"},
        
        --Cleanse Spirit
        --Cleanse Spirit Mouseover
        --Purge
         
        -- Cooldowns
        {{
        --stormlash_totem,if=!active&!buff.stormlash.up&(buff.bloodlust.up|time>=60)
        { "120668", {
                "target.range <= 5",
                "!player.buff(120676)",
                "@mavmins.heroism"}},
                
        --virmens_bite_potion,if=time>60&(pet.primal_fire_elemental.active|pet.greater_fire_elemental.active|target.time_to_die<=60)
        --{"#76089", {
        --        "player.totem(2894)",
        --        "!player.buff(105697",
        --        "@mavmins.virmenPotion"}},
        
        {"!/run UseItemByName(76089)", {
                "player.totem(2894)",
                "!player.buff(105697)",
                "@mavmins.virmenPotion"}},
                
        --{"#76089", "target.ttd <= 60"},
        
        --blood_fury
        { "33697", { 
                "player.spell(33697).exists",
                "!player.buff(33697)"}},
        
        --berserking
        { "26297", { 
                "player.spell(26297).exists",
                "!player.buff(26297)"}},
                
        --elemental_mastery,if=talent.elemental_mastery.enabled&(talent.primal_elementalist.enabled&glyph.fire_elemental_totem.enabled&(cooldown.fire_elemental_totem.remains=0|cooldown.fire_elemental_totem.remains>=80))
        { "16166", { 
                "player.spell(16166).exists",
                "player.spell(117013).exists",
                "player.glyph(217)",
                "player.spell(2894).cooldown = 0"}},
        
        { "16166", { 
                "player.spell(16166).exists",
                "player.spell(117013).exists",
                "player.glyph(217)",
                "player.spell(2894).cooldown > 79"}},
        
        --elemental_mastery,if=talent.elemental_mastery.enabled&(talent.primal_elementalist.enabled&!glyph.fire_elemental_totem.enabled&(cooldown.fire_elemental_totem.remains=0|cooldown.fire_elemental_totem.remains>=50))
        { "16166", { 
                "player.spell(16166).exists",
                "player.spell(117013).exists",
                "!player.glyph(217)",
                "player.spell(2894).cooldown = 0"}},
        
        { "16166", { 
                "player.spell(16166).exists",
                "player.spell(117013).exists",
                "!player.glyph(217)",
                "player.spell(2894).cooldown > 49"}},
        
        --elemental_mastery,if=talent.elemental_mastery.enabled&!talent.primal_elementalist.enabled
        { "16166", {
                "!player.spell(117013).exists",
                "player.spell(16166).exists"}},
        
        --gloves
        {"!/run UseInventoryItem(10)", {
                "@mavmins.Gloves",
                "!player.buff(96228)",
                "!player.totem(2894)",
                "target.exists"}},
                
        --fire_elemental_totem,if=!active
        { "2894", "!player.totem(2894)"},
        
        --ascendance,if=cooldown.strike.remains>=3
        { "114049", {                                 
                "!player.buff(114051)",
                "player.spell(17364).cooldown > 2"
        }},
        
        { "114049", {                                 
                "player.totem(2894)",
                "!player.buff(114051)"
        }},
                
        }, "modifier.cooldowns"},

        -- AoE Rotation
        {{
        --fire_nova,if=active_flame_shock>=4
        { "1535", {
                "!@mavmins.oneTarget",
                "target.debuff(8050)"}},
        
        --magma_totem,if=active_enemies>5&!totem.fire.active
        { "8190", "@mavmins.magmaTotem" },
                
        --searing_totem,if=active_enemies<=5&!totem.fire.active
        { "3599", "@mavmins.SearingTotem" },
        
        --flame_shock,cycle_targets=1,if=!ticking
        { "8050", "!target.debuff(8050)"}, 
        
        --lava_lash,if=dot.flame_shock.ticking
        { "60103", "target.debuff(8050)" }, 
        
        --elemental_blast,if=talent.elemental_blast.enabled&buff.maelstrom_weapon.react>=1
        { "117014", { 
                "player.spell(117014).exists",
                "target.range <= 40",
                "!player.moving",
                "player.buff(53817).count >= 1"}}, 
                        
        -- elemental blast Moving Spiritwalkers Grace        
        { "117014", { 
                "player.spell(117014).exists",
                "target.range <= 40",
                "player.moving",
                "player.buff(79206)",
                "player.buff(53817).count >= 1"}}, 
                
        --elemental blast MOVING 5 Maelstrom so instant cast                
        { "117014", { 
                "player.spell(117014).exists",
                "target.range <= 40",
                "player.moving",
                "player.buff(53817).count = 5"}},
        
        --chain_lightning,if=active_enemies>=2&buff.maelstrom_weapon.react>=3
        
        { "421", { 
                "target.range <= 30",
                "!player.moving",
                "player.buff(53817).count >= 3"}},
                
        { "421", { 
                "target.range <= 30",
                "player.moving",
                "player.buff(79206)",
                "player.buff(53817).count >= 3"}},
                
        { "421", { 
                "target.range <= 30",
                "player.moving",
                "player.buff(53817).count = 5"}},
                
        --unleash_elements
        { "73680", "target.range <= 40"},
        
        --stormblast
        { "115356", {
                "target.range <= 30",
                "player.buff(114049)"}}, 
        
        --chain_lightning,if=active_enemies>=2&buff.maelstrom_weapon.react>=1
        
        { "421", "player.buff(53817).count >= 1"},
        
        { "421", { 
                "target.range <= 30",
                "!player.moving",
                "player.buff(53817).count >= 1"}},
                
        { "421", { 
                "target.range <= 30",
                "player.moving",
                "player.buff(79206)",
                "player.buff(53817).count >= 1"}},
                
        --stormstrike
        { "17364", "target.range <= 30"}, 
        
        --earth_shock,if=active_enemies<4
        { "8042", {
                "target.range <= 25",
                "!@mavmins.sixTarget"}},
                        
        --feral_spirit
        { "51533", "target.range <= 5"}, 
        
        --earth_elemental_totem,if=!active&cooldown.fire_elemental_totem.remains>=50
        { "2062", {
                "target.range <= 25",
                "!player.totem(2062)",
                "!player.totem(2894)",
                "player.spell(2894).cooldown >= 60"}}, 
                
        --spiritwalkers_grace,moving=1
        { "79206", "player.moving"}, 
        
        }, "modifier.multitarget"},
        

    -- Rotation
        {{
                --spirit walk target > 15 yds
                { "58875", "target.range >= 15"}, 
                
                --searing totem
                { "3599", "@mavmins.SearingTotem"},
                
                --Gloves
                --{"#gloves", {
                --        "player.spell(110403).exists",
                --        "target.exists"}},
                        
                --{"!/run UseInventoryItem(10)", {
                --        "@mavmins.Gloves",
                --        "!player.buff(96228)",
                --        "!player.totem(2894)",
                --        "target.exists"}},
                
                --unleash_elements,if=(talent.unleashed_fury.enabled|set_bonus.tier16_2pc_melee=1)
                { "73680", {
                        "target.range <= 40",
                        "player.spell(117012).exists"}},
                        
                { "73680", {
                        "target.range <= 40",
                        "@mavmins.t16_2pc"}},                
                
                --elemental_blast,if=talent.elemental_blast.enabled&buff.maelstrom_weapon.react>=1 - NOT MOVING
                { "117014", { 
                        "player.spell(117014).exists",
                        "target.range <= 40",
                        "!player.moving",
                        "player.buff(53817).count >= 1"}}, 
                        
                 --elemental blast Moving Spiritwalkers Grace        
                { "117014", { 
                        "target.range <= 40",
                        "player.moving",
                        "player.buff(79206)",
                        "player.buff(53817).count >= 1"}}, 
                
                --elemental blast MOVING 5 Maelstrom so instant cast                
                { "117014", { 
                        "target.range <= 40",
                        "player.moving",
                        "player.buff(53817).count = 5"}}, 
                
                --lightning_bolt,if=buff.maelstrom_weapon.react=5                
                { "403", { 
                        "target.range <= 30",
                        "player.buff(53817).count = 5" }}, 
                        
                --feral_spirit,if=set_bonus.tier15_4pc_melee=1        
                { "51533", {
                        "target.range <= 5",
                        "@mavmins.t15_4pc"}}, 
                        
                --Stormblast (stormstrike during ascendence)        
                { "115356", {
                        "target.range <= 30",
                        "player.buff(114049)"}}, 
                                        
                --Stormstrike        
                { "17364", "target.range <= 30"}, 
                
                --flame_shock,if=buff.unleash_flame.up&!ticking                
                { "8050",{  
                        "target.range <= 25",
                        "player.buff(73683)", 
                        "!target.debuff(8050)"}},
                        
                --Lavalash                
                { "60103", "target.range <= 5"}, 
                        
                --lightning_bolt,if=set_bonus.tier15_2pc_melee=1&buff.maelstrom_weapon.react>=4&!buff.ascendance.up                
                { "403", { 
                        "target.range <= 30",
                        "@mavmins.t15_2pc",
                        "player.buff(53817).count >= 4",
                        "!player.buff(114049)"}},
                                
                --flame_shock,if=(buff.unleash_flame.up&(dot.flame_shock.remains<10|set_bonus.tier16_2pc_melee=0))|!ticking
                { "8050",{ 
                        "target.range <= 25",
                        "player.buff(73683)", 
                        "target.debuff(8050).duration < 10"  }}, 
                        
                { "8050",{ 
                        "target.range <= 25",
                        "player.buff(73683)", 
                        "!@mavmins.t16_2pc"  }}, 
                        
                { "8050",{ 
                        "target.range <= 25",
                        "!target.debuff(8050)"  }}, 
                        
                --unleash_elements
                { "73680", "target.range <= 40"},
                
                --frost_shock,if=glyph.frost_shock.enabled&set_bonus.tier14_4pc_melee=0
                { "8056", {
                        "target.range <= 25",
                        "player.spell{8056}.exists",
                        "@mavmins.frostShockglyph"}},
                
                --lightning_bolt,if=buff.maelstrom_weapon.react>=3&!buff.ascendance.up
                { "403", { 
                        "target.range <= 30",
                        "player.buff(53817).count >= 3",
                        "!player.buff(114049)"}},
                        
                --ancestral_swiftness,if=talent.ancestral_swiftness.enabled&buff.maelstrom_weapon.react<2
                { "16188", { 
                        "target.range <= 25",
                        "player.spell(16188).exists",
                        "player.buff(53817).count < 2"}},
                        
                --lightning_bolt,if=buff.ancestral_swiftness.up
                { "403", { 
                        "target.range <= 30",
                        "player.spell(403).exists",
                        "player.buff(16188)" }},
                
                --earth_shock,if=(!glyph.frost_shock.enabled|set_bonus.tier14_4pc_melee=1)
                { "8042", {
                        "target.range <= 25",
                        "!@mavmins.frostShockglyph"}},
                
                --feral_spirit
                { "51533", "target.range <= 5"}, 
                        
                --earth_elemental_totem,if=!active
                { "2062", {
                        "target.range <= 25",
                        "!player.totem(2062)",
                        "!player.totem(2894)",
                        "player.spell(2894).cooldown > 60"}}, 
                
                --spiritwalkers_grace,moving=1
                { "79206", "player.moving"}, 
                
                --lightning_bolt,if=buff.maelstrom_weapon.react>1&!buff.ascendance.up
                { "403", { 
                        "target.range <= 30",
                        "player.buff(53817).count > 1",
                        "!player.spell(403).casting",
                        "!player.spell(117014).casting",
                        "player.spell(73680).cooldown >= 1.5",
                        "player.spell(17364).cooldown >= 1.5",
                        "player.spell(8050).cooldown >= 1.5",
                        "player.spell(60103).cooldown >= 1.5",
                        "!player.buff(114049)"}},
                                
        }, {"!modifier.multitarget", "@mavmins.oneTarget"}},
        

}, {
  -- Buffs
  { "Windfury Weapon", "!player.enchant.mainhand" },
  { "Flametongue Weapon", "!player.enchant.offhand" },
  { "Lightning Shield", "!player.buff(Lightning Shield)" },
  
}, function()
        ProbablyEngine.toggle.create('healing', 'Interface\\Icons\\spell_nature_rejuvenation', 'Healing', 'Toggle Healing')
        end
)