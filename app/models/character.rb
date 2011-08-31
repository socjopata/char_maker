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

  def stats_choices
    character_background.social_classes.first.stats_choices
  end

  def valid_for_step_three?
    m_choose = StatsModifier.must_choose_for_social_class(character_background.social_classes.first.id)
    if m_choose.present?
      choosen_ids = self.statistics.stats_modifiers.map(&:id)
      return m_choose.map(&:id).find_all { |item| choosen_ids.include? item }.present?
    else
      true
    end
  end

end


