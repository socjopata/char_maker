class Profession < ActiveRecord::Base
  has_one :stats_modifier, :class_name => "StatsModifier", :dependent => :destroy  #I think we could store modifiers here, like this. We'll see :)'
end
