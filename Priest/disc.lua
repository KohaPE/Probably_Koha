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

-- Created on Dec 14th 2013 6:21 am
ProbablyEngine.rotation.register_custom(256, "Koha's Disc", {

{ "Power Word: Barrier", { "modifier.cooldowns", "modifier.alt", "ground" }},

--Trinkets/Gloves
{ "#gloves" },
{ "#trinket1" },
{ "#trinket2" },

--Cooldowns
{ "Shadowfiend", { "modifier.cooldowns", "player.mana < 80" }},

--Tank Heals
{{
{ "Power Word: Shield", { "tank.health < 90", "!tank.debuff(Weakend Soul)" }},
{ "Penance", "tank.health < 95" },
{ "Renew", { "!tank.buff(Renew)", "tank.health <= 100" }},
}, "!tank.range < 40" },

--Heals
{{
{ "Prayer of Mending", { "!lowest.buff(Prayer of Mending).count < 1", "lowest.health < 98" }},
{ "Power Word: Shield", { "lowest.health < 85", "!lowest.debuff(Weakend Soul)" }},
{ "Flash Heal", "lowest.health < 50" },
{ "Greater Heal", "lowest.health < 70" },
{ "Prayer of Healing", "@coreHealing.needsHealing(92, 3)" },
{ "Penance", "lowest.health < 90" },
{ "Renew", { "!lowest.buff(Renew)", "lowest.health < 80" }},
{ "Binding Heal", { "lowest.health < 85", "player.health < 85" }},
{ "Heal", "lowest.health < 95" },
{ "Power Word: Shield", { "player.health <= 100", "player.glyph(33202).exists", "!player.debuff(Weakend Soul)" }},
{ "Power Word: Shield", { "player.health < 80", "!player.debuff(Weakend Soul)" }},
}, "!lowest.range < 40" },


--Shared Rotation
{ "Shadow Word: Death" },

--Single Target Rotation
{{
{ "Power Word: Solace" },
{ "Holy Fire" },
{ "Penance" },
{ "Smite" },
}, "toggle.dps" },



},
--Out of Combat
{
-- Shadow Form
{ "Inner Fire", "!player.buff(Inner Fire)" },
{ "Power Word: Shield", { "player.health <= 100", "player.glyph(33202).exists", "!player.debuff(Weakend Soul)" }},
},function()
ProbablyEngine.toggle.create('dps', 'Interface\\Icons\\spell_holy_holysmite', 'DPS', 'Attonment Healing')

end)