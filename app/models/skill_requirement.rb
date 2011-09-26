class SkillRequirement < ActiveRecord::Base
  belongs_to :skill

  #a copy of stats choice I guess    or...
  #... or put it in stats choice condition ??
end
