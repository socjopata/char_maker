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

  attr_accessor :double_skill_free_assignment

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
    oracle_matrix = []
    oracle_matrix << has_chosen_all_required_social_class_perks?
    oracle_matrix << has_chosen_all_required_origin_perks?
    oracle_matrix.include?(false) ? false : true
  end

  def valid_for_step_fourth?

   statistics.polish >= statistics.initial_dice_roll_set.last.to_i
  end

  def has_chosen_all_required_social_class_perks?
    collection_of_must_choose_stats_modifiers = StatsModifier.must_choose_for_social_class(social_class.id)
    oracle_matrix = []
    if collection_of_must_choose_stats_modifiers.present?
      collection_of_stats_modifiers_ids_choosen_by_user = self.statistics.stats_modifiers.map(&:id)
      collection_of_must_choose_stats_modifiers.collect(&:stats_choice).each do |stats_choice|
        oracle_matrix << stats_choice.stats_modifiers.map(&:id).find_all { |item| collection_of_stats_modifiers_ids_choosen_by_user.include? item }.present?
      end
    else
      true
    end
    oracle_matrix.include?(false) ? false : true
  end


  def has_chosen_all_required_origin_perks?
    collection_of_must_choose_stats_modifiers = StatsModifier.must_choose_for_origin(character_background.country.id)
    oracle_matrix = []
    if collection_of_must_choose_stats_modifiers.present?
      collection_of_stats_modifiers_ids_choosen_by_user = self.statistics.stats_modifiers.map(&:id)
      collection_of_must_choose_stats_modifiers.collect(&:stats_choice).each do |stats_choice|
        oracle_matrix << stats_choice.stats_modifiers.map(&:id).find_all { |item| collection_of_stats_modifiers_ids_choosen_by_user.include? item }.present? if  social_class.send(stats_choice.condition.intern)
      end
    else
      true
    end
    oracle_matrix.include?(false) ? false : true
  end

end


