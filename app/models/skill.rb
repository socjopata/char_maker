class Skill < ActiveRecord::Base
  has_many :stats_choices, :as => :resource, :dependent => :destroy
  has_many :skill_requirements
  has_and_belongs_to_many :characters


  scope :basic, where(:profession_type => "default")


  def to_s
    name
  end

end


    #has_and_belongs_to_many :characters

     #
     #post = ...
     #category = ...
     #
     #if category
     #   post.categories.delete(category)
     #end
