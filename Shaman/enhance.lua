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

-- Custom Resto Shaman Rotation v0.1

ProbablyEngine.rotation.register_custom(263, "Koha's Enhance Shamen", {

--buffs
{ "Windfury Weapon", "!player.enchant.mainhand" },
{ "Flametongue Weapon", "!player.enchant.offhand" },
{ "Lightning Sheild", "!player.buff" },

--Interupts
{ "Wind Shear", "modifier.interrupt" },

--Totems
{ "Healing Stream Totem", "player.health < 90" },

--Cooldowns
{ "Ascendance", { "!player.buff(Ascendance)", "modifier.cooldowns" }},
{ "Bloodlust", { "modifier.cooldowns","!debuff.any(Sated)" }},
{ "Fire Elemental Totem", "modifier.cooldowns" },
{ "Earth Elemental Totem", "modifier.cooldowns" },
{ "Feral Spirit", "modifier.cooldowns" },

--Auto Target Enemy on DPS Toggle
{ "!/targetenemy [noharm]", { "toggle.dps", "!target.alive", "!target.enemy", "!target.exists", }},

--Combat Totems
{ "Searing Totem", { "!player.totem(Searing Totem)", "!player.totem(Fire Elemental)", "!modifer.cooldowns", "!modifier.multitarget", }},
{ "Magma Totem", { "!player.totem(Magma Totem)", "!player.totem(Fire Elemental)", "!modifer.cooldowns", "modifier.multitarget", }},


--Shared Rotationw
{ "Unleash Elements" },
{ "Flame Shock", { "!target.debuff(Flame Shock)", "player.buff(Unleash Flame)", }},
{ "Flame Shock", "target.debuff(Flame Shock).duration < 7" },
{ "Flame Shock", "!target.debuff(Flame Shock)" },


--AoE Rotation
{{
{ "Lava Lash", "target.debuff(Flame Shock)" },
{ "Fire Nova" },
{ "Chain Lightning", "player.buff(Maelstrom Weapon).count = 5" },
{ "Stormstrike" },
{ "Earth Shock", "target.debuff(Flame Shock)" },
}, "modifier.multitarget" },

--Single Target
{{
{ "Lightning Bolt", "player.buff(Maelstrom Weapon).count = 5" },
{ "Stormstrike" },
{ "Lava Lash" },
{ "Earth Shock", "target.debuff(Flame Shock)" },
}, "!modifier.multitarget" },


},
--Out of Combat
{
{ "Windfury Weapon", "!player.enchant.mainhand" },
{ "Flametongue Weapon", "!player.enchant.offhand" },
{ "Lightning Shield", "!player.buff" },


}, function()
ProbablyEngine.toggle.create('dps', 'Interface\\Icons\\spell_nature_lightning', 'DPS', 'Toggle for Lightning Bolt Mana Return')

end)