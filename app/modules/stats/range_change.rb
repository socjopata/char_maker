# -*- encoding : utf-8 -*-
module Stats
  module RangeChange
    def range_change_base
      (raw_fencing_when_attacking + raw_fencing_when_defending) / 2
    end

    def calculate_range_change_bonus_from_skills
      stats_modifiers.select { |sm| sm.modifies=="fighting" && sm.group_name=="Zmiana Zasięgu" }.collect(&:value).sum
    end

    def total_range_change
      range_change_base + calculate_strength_bonus + calculate_dexterity_bonus + calculate_range_change_bonus_from_skills
    end
  end
end
