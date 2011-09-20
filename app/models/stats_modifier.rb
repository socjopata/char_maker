# -*- encoding : utf-8 -*-
class StatsModifier < ActiveRecord::Base

  belongs_to :stats_choice
  has_and_belongs_to_many :statistics, :class_name => "Statistics"

  scope :belongs_to_social_class, lambda { |social_class_id|
    {
        :select => "stats_modifiers.*",
        :from => "stats_modifiers, stats_choices, social_classes",
        :conditions => "
        stats_modifiers.stats_choice_id = stats_choices.id AND
        stats_choices.resource_id = social_classes.id AND
        stats_choices.resource_type = 'SocialClass' AND
        social_classes.id = #{social_class_id.to_i}"
    }
  }

  scope :default_for_social_class, lambda { |social_class_id|
    {
        :select => "stats_modifiers.*",
        :from => "stats_modifiers, stats_choices, social_classes",
        :conditions => "
        stats_modifiers.stats_choice_id = stats_choices.id AND
        stats_modifiers.default_for_social_class is TRUE AND
        stats_choices.resource_id = social_classes.id AND
        stats_choices.resource_type = 'SocialClass' AND
        social_classes.id = #{social_class_id.to_i}"
    }
  }

  scope :must_choose_for_social_class, lambda { |social_class_id|
    {
        :select => "stats_modifiers.*",
        :from => "stats_modifiers, stats_choices, social_classes",
        :conditions => "
        stats_modifiers.stats_choice_id = stats_choices.id AND
        stats_modifiers.default_for_social_class is FALSE AND
        stats_choices.resource_id = social_classes.id AND
        stats_choices.resource_type = 'SocialClass' AND
        social_classes.id = #{social_class_id.to_i}"
    }
  }

  scope :must_choose_for_origin , lambda { |country_id|
    {
        :select => "stats_modifiers.*",
        :from => "stats_modifiers",
        :joins => "
        join stats_choices on stats_modifiers.stats_choice_id = stats_choices.id
        join countries on stats_choices.resource_id = countries.id" ,
        :conditions =>
        "stats_modifiers.default_for_origin is FALSE AND
        stats_choices.resource_type = 'Country' AND
        countries.id = #{country_id.to_i}"
    }
  }
  scope :of_group, lambda { |group_name| where(:group_name => group_name ) }

  def self.default
    StatsChoice.default.stats_modifiers.first
  end

#TODO implement this requirement:
#"Jeśli gracz podczas tworzenia postaci miałby automatycznie dostać dwa takie same skille, np jeden z kraju pochodzenia, a drugi z profesji, to zamień dubel na 1WU".

end


