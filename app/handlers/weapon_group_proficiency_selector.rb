# -*- encoding : utf-8 -*-
class WeaponGroupProficiencySelector

  attr_accessor :weapon_groups

  def initialize(character)
    @weapon_groups = filter_groups_for_profession(character).sort
  end

  def filter_groups_for_profession(character)
    case character.profession.name
      when "Berzerker"
        Weapon.all.map(&:group_name).uniq
      else
        Weapon.all.map(&:group_name).uniq + RangedWeapon.all.map(&:group_name).uniq
    end
  end

end
