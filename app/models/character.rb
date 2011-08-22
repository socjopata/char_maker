# -*- encoding : utf-8 -*-
class Character < ActiveRecord::Base
  belongs_to :user
  has_one :character_background, :dependent => :destroy
  has_one :statistics, :class_name => "Statistics", :dependent => :destroy

  has_one :character_profession
  has_one :profession, :through => :character_profession
  has_one :purse

  mount_uploader :avatar, AvatarUploader
  scope :belongs_to_user, lambda { |user| {:conditions => {:user_id => user.id}} }

  validates_presence_of :name, :gender, :user_id

  def pick_a_profession(prof_id)
    self.create_character_profession(:profession_id => prof_id)
  end

  def stats_choices
    character_background.social_classes.first.stats_choices
  end

end


