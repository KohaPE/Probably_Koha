-- Released under Modified BSD

mistweaverLastSoothingTarget = nil

local function getHealth(unit, percent)
  local incHeals = UnitGetIncomingHeals(unit) or 0
  local absorbs = UnitGetTotalHealAbsorbs(unit) or 0

  if percent then
    return (UnitHealth(unit) + incHeals - absorbs) / UnitHealthMax(unit)
  end

  return UnitHealthMax(unit) - UnitHealth(unit) + incHeals - absorbs
end

local ignoreDebuffs = {
  'Mark of Arrogance',
  'Displaced Energy'
}

ProbablyEngine.library.register('mistweaver', {
  detox = function(spell)
    local prefix = (IsInRaid() and 'raid') or 'party'
    for i = -1, GetNumGroupMembers() - 1 do
      local unit = (i == -1 and 'target') or (i == 0 and 'player') or prefix .. i
      if IsSpellInRange('Detox', unit) then
        for j = 1, 40 do
          local debuffName, _, _, _, dispelType, duration, expires, _, _, _, spellID, _, isBossDebuff, _, _, _ = UnitDebuff(unit, j)
            
          if dispelType and dispelType == 'Magic' or dispelType == 'Poison' or dispelType == 'Disease' then
            local ignore = false
            for k = 1, #ignoreDebuffs do
              if debuffName == ignoreDebuffs[k] then
                ignore = true
                break
              end
            end

            if not ignore then
              ProbablyEngine.dsl.parsedTarget = unit
              return true
            end
          end
            
          if not debuffName then
            break
          end
        end
      end
    end

    return false
  end,

  soothingMist = function (threshold, stopThreshold, emergencyThreshold)
    local minHeal = 1.2 * (GetSpellBonusDamage(2) * 1.4336 + 20552)

    if UnitChannelInfo('player') == 'Soothing Mist' then
      local focusPercentage = getHealth(mistweaverLastSoothingTarget, true)
      if focusPercentage > stopThreshold / 100 then
        SpellStopCasting()
        return false
      end

      if focusPercentage < (stopThreshold - emergencyThreshold) / 100 then
        return false
      end
      
      -- Expr
      local prefix = (IsInRaid() and 'raid') or 'party'
      for i = -1, GetNumGroupMembers() - 1 do
        local unit = (i == -1 and 'target') or (i == 0 and 'player') or prefix .. i
        if IsSpellInRange('Soothing Mist', unit) then
          local percentage = getHealth(unit, true)
          if percentage < emergencyThreshold / 100 then
            ProbablyEngine.dsl.parsedTarget = unit
            mistweaverLastSoothingTarget = unit
            return true
          end
        end
      end
      -- Expr

      return false
    end

    local missingHealth = 0

    local prefix = (IsInRaid() and 'raid') or 'party'
    for i = -1, GetNumGroupMembers() - 1 do
      local unit = (i == -1 and 'target') or (i == 0 and 'player') or prefix .. i
      if IsSpellInRange('Soothing Mist', unit) then
        local percentage = getHealth(unit, true)
        local diff = getHealth(unit)
        if percentage < threshold / 100 and diff > missingHealth then
          missingHealth = diff
          ProbablyEngine.dsl.parsedTarget = unit
        end
      end
    end

    if ProbablyEngine.dsl.parsedTarget ~= nil and missingHealth > minHeal then
      mistweaverLastSoothingTarget = ProbablyEngine.dsl.parsedTarget
      return true
    end

    return false
  end,

  soothingTarget = function (threshold)
    if UnitChannelInfo('player') ~= 'Soothing Mist' then
      return false
    end

    local percentage = getHealth(mistweaverLastSoothingTarget, true)

    if percentage < threshold / 100 then
      ProbablyEngine.dsl.parsedTarget = mistweaverLastSoothingTarget
      return true
    end

    return false
  end,

  renewingMist = function ()
    local minHeal = 1.2 * (GetSpellBonusDamage(2) * 0.107 + 2266)

    if not IsUsableSpell('Renewing Mist') then
      return false
    end

    local prefix = (IsInRaid() and 'raid') or 'party'
    for i = -2, GetNumGroupMembers() do
      local unit = (i == -2 and 'focus') or (i == -1 and 'target') or (i == 0 and 'player') or prefix .. i
      if not UnitAura(unit, 'Renewing Mist') then
        if IsSpellInRange('Renewing Mist', unit) then
          if ProbablyEngine.toggle.states['generatechi'] then
            ProbablyEngine.dsl.parsedTarget = unit
            return true
          end

          local diff = getHealth(unit)

          if diff > minHeal then
            ProbablyEngine.dsl.parsedTarget = unit
            return true
          end
        end
      end
    end

    return false
  end,

  uplift = function (threshold)
    local minHeal = 1.2 * (GetSpellBonusDamage(2) * 0.68 + 7210)

    local missingHealth = 0
    if IsInGroup() then
      local prefix = (IsInRaid() and 'raid') or 'party'
      for i = 0, GetNumGroupMembers() do
        local unit = (i == 0 and 'player') or prefix .. i
        if UnitAura(unit, 'Renewing Mist') then
          local diff = getHealth(unit)
          missingHealth = missingHealth + math.min(diff, minHeal)
        end
      end
    end

    return missingHealth > threshold
  end,

  surgingMist = function ()
    local minHeal = 1.2 * (GetSpellBonusDamage(2) * 1.80 + 15949)

    local lowestHealth = 0
    local prefix = (IsInRaid() and 'raid') or 'party'
    for i = -1, GetNumGroupMembers() - 1 do
      local unit = (i == -1 and 'target') or (i == 0 and 'player') or prefix .. i
      if IsSpellInRange('Soothing Mist', unit) == 1 then
        local diff = getHealth(unit)
        if diff > minHeal then
          if lowestHealth == 0 or diff > lowestHealth then
            lowestHealth = diff
            ProbablyEngine.dsl.parsedTarget = unit
          end
        end
      end
    end

    return lowestHealth > 0
  end,

  spinningCraneKick = function (threshold)
    -- Couldn't really figure this one out...
    local minHeal = 1.2 * (GetSpellBonusDamage(2) * 0.097 + 2809)
 
    local inRange = 0
    local prefix = (IsInRaid() and 'raid') or 'party'
    for i = -1, GetNumGroupMembers() - 1 do
      local unit = (i == -1 and 'target') or (i == 0 and 'player') or prefix .. i
      if IsItemInRange(33278, unit) or unit == 'player' then
        local diff = getHealth(unit)
        if diff > minHeal then
          inRange = inRange + 1
        end
      end
    end
    
    return inRange > threshold
  end,

  interrupt = function ()
    if not ProbablyEngine.condition['modifier.toggle']('interrupt') then
      return false
    end

    local prefix = (IsInRaid() and 'raid') or 'party'
    for i = -1, GetNumGroupMembers() - 1 do
      local unit = (i == -1 and 'target') or (i == 0 and 'player') or prefix .. i .. 'target'

      -- local stop = ProbablyEngine.condition['casting.delta'](unit)
      -- if stop and stop < 0.2 then
      local stop = ProbablyEngine.condition['casting'](unit)
      if stop then
        ProbablyEngine.dsl.parsedTarget = unit
        return true
      end
    end

    return false
  end,

  grappleWeapon = function (unitLevel)
    local prefix = (IsInRaid() and 'raid') or 'party'
    for i = -1, GetNumGroupMembers() - 1 do
      local unit = (i == -1 and 'target') or (i == 0 and 'player') or prefix .. i .. 'target'

      if UnitLevel(unit) >= unitLevel then
        ProbablyEngine.dsl.parsedTarget = unit
        return true
      end
    end

    return false
  end,
})