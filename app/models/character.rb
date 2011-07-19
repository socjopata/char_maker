class Character < ActiveRecord::Base
  belongs_to :user
  has_one :character_background

  mount_uploader :avatar, AvatarUploader
  scope :belongs_to_user, lambda {|user| {:conditions => {:user_id => user.id}}  }
end
