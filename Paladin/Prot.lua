-- SPEC ID 66
ProbablyEngine.rotation.register_custom(66, "Koha's Prot Pally", {
  -------------------
  -- Start Racials --
  -------------------
  
  -- =^*~ Alliance ~*^= --
  -- Dwarves
  { "Stoneform", "player.health <= 65" },
 
  -- Humans
  { "Every Man for Himself", "player.state.charm" },
  { "Every Man for Himself", "player.state.fear" },
  { "Every Man for Himself", "player.state.incapacitate" },
  { "Every Man for Himself", "player.state.sleep" },
  { "Every Man for Himself", "player.state.stun" },
  
  -----------------
  -- End Racials --
  -----------------
  
  --------------------
  -- Start Rotation --
  --------------------
  
  -- Seals
  { "Seal of Righteousness", { "modifier.multitarget", "player.seal != 2" }},

  -- Dynamic Multitarget Seals
  -- Heal after Censure
  { "Seal of Insight", { "target.debuff(Censure).count = 5", "target.debuff(Censure).duration > 5", "player.seal != 3", "!modifier.multitarget" } },
  -- Refresh Censure
  { "Seal of Truth", { "target.debuff(Censure).duration <= 5", "player.seal != 1", "!modifier.multitarget" } },
  -- Apply Censure
  { "Seal of Truth", { "target.debuff(Censure).count < 5", "player.seal != 1", "!modifier.multitarget" }},

  -- Taunts
  { "Reckoning", "modifier.taunt" },

  -- Interrupts
  { "Rebuke", "modifier.interrupts" },
  { "Avenger's Shield", "modifier.interrupts" },
  
  -- Damage Reduction & Healing
  { "Sacred Shield", "!player.buff(Sacred shield)" }, -- T3 Tallent
  { "Eternal Flame", "!player.buff(Eternal Flame)" }, -- T3 Tallent
  { "Hand of Purity" },  -- T4 Tallent
  { "Shield of the Righteous", "player.holypower = 5" },
  { "Shield of the Righteous", "modifier.shift" },
  { "Word of Glory", "modifier.alt" },

  -- Survival
  { "Ardent Defender", "player.health < 15" },
  { "Divine Protection", "player.health < 35" },
  { "Guardian of Ancient Kings", "player.health < 50" },

  --Cooldowns
  { "Holy Avenger", "modifier.cooldowns" },  -- T5 Tallent

  -- T6 Tallents
  { "Holy Prism" },
  { "Light's Hammer" , "modifier.shift", "ground" },
  { "Execution Sentence" },

  -- Multi Target Rotation
  {{
  { "Hammer of the Righteous" },
  { "Concecration", "target.range <= 5" },
  { "Judgment" },
  { "Avenger's Shield" },
  { "Holy Wrath", "target.range <= 5" },
  { "Hammer of Wrath" },
  }, "modifier.multitarget" },
  
  {{
  { "Hammer of the Righteous", "!target.debuff(Weakened Blows)" },
  { "Avenger's Shield" },
  { "Consecration", "target.range <= 5" },
  { "Holy Wrath" },
  { "Hammer of Wrath" },
  { "Judgment" },
  { "Crusader Strike" },
  }, "!modifier.multitarget" }, 
  
  ------------------
  -- End Rotation --
  ------------------
  
  },{
  
  ---------------
  -- OOC Begin --
  ---------------
  
  { "Blessing of Might", "!player.buff(Blessing of Might)" },
  { "Righteous Fury",    "!player.buff(Righteous Fury)" },
  
  -------------
  -- OOC End --
  -------------
  
})