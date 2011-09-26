class Skill < ActiveRecord::Base
  has_many :stats_choices, :as => :resource, :dependent => :destroy
  has_many :skill_requirements
end


    #has_and_belongs_to_many :characters

     #
     #post = ...
     #category = ...
     #
     #if category
     #   post.categories.delete(category)
     #end
