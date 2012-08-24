class WeaponGroupProficiencySelector

  attr_accessor :weapon_groups

  def initialize
    @weapon_groups = Weapon.all.map(&:group_name).uniq + RangedWeapon.all.map(&:group_name).uniq
  end


end