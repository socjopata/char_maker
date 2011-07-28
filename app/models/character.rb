class Character < ActiveRecord::Base
  belongs_to :user
  has_one :character_background,  :dependent => :destroy
  has_one :statistics, :class_name => "Statistics", :dependent => :destroy

  mount_uploader :avatar, AvatarUploader
  scope :belongs_to_user, lambda {|user| {:conditions => {:user_id => user.id}}  }

  validates_presence_of :name, :gender, :user_id
end


