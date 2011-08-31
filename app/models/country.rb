# -*- encoding : utf-8 -*-
class Country < ActiveRecord::Base
    has_and_belongs_to_many :professions
    has_many :origins
    has_many :character_backgrounds, :through => :origins

    #TODO stats modifiers for character origin...
    has_many :stats_choices, :as => :resource, :dependent => :destroy

end


#IMPLEMENTATION IDEA: we have stats_choices sets which apply to "soldier", "rogue" - specified in :applies_to and set as default_for_origin to true.
#they are complete set of choices so there will be some duplication, in a sense of course, but it's ok'
#a named scope will get all stats choices that belong to a country, apply to soldier or rogue and are default

#We will have also stats_choices sets which apply to "special" and set as default_for_origin to false
#and assigned to char given special criteria.
#choices will be grouped by group_name. Packs of two will be made as:
#s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Ulubiona Broń oraz Something Else", :default_for_origin => false)
#s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Język Klasyczny oraz Something Else", :default_for_origin => false)
#while applying it later to a char, I'll split by "oraz" and iterate, searching for instances of Skill mode.l


#EXTRA IDEA - maybe a requirement will be stored as a string which will be evaluated. For example:
# :requirement => "character.social_class == 'bla'"
# display object if eval object.requirement
#TODO explore the idea above, is this elegant/safe?