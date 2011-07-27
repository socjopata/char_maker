class Character < ActiveRecord::Base
  belongs_to :user
  has_one :character_background
  has_one :statistics, :class_name => "Statistics"

  mount_uploader :avatar, AvatarUploader
  scope :belongs_to_user, lambda {|user| {:conditions => {:user_id => user.id}}  }

  validates_presence_of :name, :gender, :user_id
end


