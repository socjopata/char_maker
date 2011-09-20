# -*- encoding : utf-8 -*-
class Character < ActiveRecord::Base
  belongs_to :user
  has_one :character_background, :dependent => :destroy
  has_one :statistics, :class_name => "Statistics", :dependent => :destroy

  has_one :character_profession
  has_one :profession, :through => :character_profession
  has_one :purse
  has_one :auxiliary_parameter_set

  mount_uploader :avatar, AvatarUploader
  scope :belongs_to_user, lambda { |user| {:conditions => {:user_id => user.id}} }

  validates_presence_of :name, :gender, :user_id


  def pick_a_profession(prof_id)
    self.create_character_profession(:profession_id => prof_id)
  end

  def social_class_stats_choices
    character_background.social_classes.first.stats_choices
  end

  def social_class
    character_background.social_classes.first
  end

  def default_origin_modifiers_set
    character_background.country.stats_choices.find_by_applies_to(profession.general_type)
  end

  def valid_for_step_three?
    all_stats_choices_for_character = social_class_stats_choices + character_background.origin.country.stats_choices.find_all_by_applies_to("special").select { |stats_choice| social_class.send(stats_choice.condition.intern) } + [default_origin_modifiers_set] + profession.stats_choices
    all_stats_choices_made = statistics.stats_modifiers.collect(&:stats_choice).uniq
    (all_stats_choices_made - all_stats_choices_for_character).blank? ? true : false
  end

  def valid_for_step_fourth?
    statistics.polish >= statistics.initial_dice_roll_set.last.to_i
  end

end


