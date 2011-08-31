# -*- encoding : utf-8 -*-
#soldier, scholar, rogue


#ALANTAR
country = Country.find_by_name("Alantar")
s_choice = country.stats_choices.create(:applies_to => "soldier", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 4, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu: Alantar", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Atak i Obrona", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Spryt", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "rogue", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 4, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu: Alantar", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Atak i Obrona", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Spryt", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "scholar", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 4, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "mordercza praca", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu: Alantar", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Wykształcenie Akademickie", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Spryt", :default_for_origin => true)

#TODO Noble of Alantar special case condition
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Ulubiona Broń", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Język Klasyczny", :default_for_origin => false)


#TODO do the rest
