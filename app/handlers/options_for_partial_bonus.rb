class OptionsForPartialBonus

  attr_accessor :results

  def initialize(sm)
   @results = sm.group_name[/\(.*\)/][1..-2].split(",")
   @results.blank? ? @results= (Weapon.all.map(&:group_name).uniq + RangedWeapon.all.map(&:group_name).uniq) : @results
  end

end