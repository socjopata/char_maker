# -*- encoding : utf-8 -*-
class WeaponGroupProficiencySelector

  attr_accessor :weapon_groups

  def initialize(character)
    @character = character
    @statistics = character.calculate_stats_and_store_them_as_a_hash
    @weapon_groups = filter_groups_for_profession.sort
  end

  def filter_groups_for_profession
    case @character.profession.name
      when "Berzerker"
        Weapon.all.select{|weapon| weapon.character_can_use?(@character, @statistics)}.map(&:group_name).uniq
      else
        Weapon.all.select{|weapon| weapon.character_can_use?(@character, @statistics)}.map(&:group_name).uniq + RangedWeapon.all.select{|weapon| weapon.character_can_use?(@character, @statistics)}.map(&:group_name).uniq
    end
  end

end
