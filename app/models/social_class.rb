class SocialClass < ActiveRecord::Base
 #TODO ask Artur if he wants description of a social class presented somewhere

  has_and_belongs_to_many :character_backgrounds
end
