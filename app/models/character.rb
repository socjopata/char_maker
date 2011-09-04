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
    character_background.origin.country.stats_choices.find_by_applies_to(profession.general_type)
  end

  def valid_for_step_three?
    oracle_matrix = []
    oracle_matrix << has_chosen_all_required_social_class_perks?
    oracle_matrix << has_chosen_all_required_origin_perks?
    oracle_matrix.include?(false) ? false : true
  end

  def has_chosen_all_required_social_class_perks?
    m_choose = StatsModifier.must_choose_for_social_class(social_class.id)
    if m_choose.present?
      choosen_ids = self.statistics.stats_modifiers.map(&:id)
      return m_choose.map(&:id).find_all { |item| choosen_ids.include? item }.present?
    else
      true
    end
  end

  def has_chosen_all_required_origin_perks?
      true

      #TODO case where scope reeturns ids for a Noble which can be N/A for current char...
  end

end


