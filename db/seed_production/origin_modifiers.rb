# -*- encoding : utf-8 -*-
#soldier, scholar, rogue


#ALANTAR
country = Country.find_by_name("Alantar")
s_choice = country.stats_choices.create(:applies_to => "soldier", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Atak i Obrona", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jedna wolna umiejętność", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "rogue", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Atak i Obrona", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jedna wolna umiejętność", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "scholar", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Podstawy Medytacji", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jedna wolna umiejętność", :default_for_origin => true)

# Noble of Alantar special case condition
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "is_noble?" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Wykształcenie Akademickie", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Heraldyka i Historia", :default_for_origin => false)

#Archipelag Południowy
country = Country.find_by_name("Archipelag Południowy")
s_choice = country.stats_choices.create(:applies_to => "soldier", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Odporność na Magię", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "rogue", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Odporność na Magię", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "scholar", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Odporność na Magię", :default_for_origin => true)

#Archipelag Południowy origin special case
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "true" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Tropienie, Polowanie i Kamuflaż", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Pływanie i Nurkowanie", :default_for_origin => false)


#Noble of Archipelag Południowy special case condition
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "is_noble?" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Zakazana wiedza", :default_for_origin => false)

#Góry Księżycowe i Niczyje
country = Country.find_by_name("Góry Księżycowe i Niczyje")
s_choice = country.stats_choices.create(:applies_to => "soldier", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 6, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 6, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Nieustraszony", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Odporność", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "rogue", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 6, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 6, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Nieustraszony", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Odporność", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "scholar", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 6, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 6, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Nieustraszony", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Odporność", :default_for_origin => true)

#Noble of Góry Księżycowe i Niczyje special case condition
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "is_noble?" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Posłuch i Zastraszanie", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Runy Proste", :default_for_origin => false)

#Księstwa Wysp Północy
country = Country.find_by_name("Księstwa Wysp Północy")
s_choice = country.stats_choices.create(:applies_to => "soldier", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Pływanie i Nurkowanie", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Żeglarstwo i Nawigacja", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "rogue", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Pływanie i Nurkowanie", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Żeglarstwo i Nawigacja", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "scholar", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Pływanie i Nurkowanie", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Żeglarstwo i Nawigacja", :default_for_origin => true)


#Noble of Księstwa Wysp Północy special case condition
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "is_noble?" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Astrologia", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Kusznik", :default_for_origin => false)

#Nimer
country = Country.find_by_name("Nimer")
s_choice = country.stats_choices.create(:applies_to => "soldier", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Odporność na Modlitwy", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Nieustraszony", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Fanatyzm", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "rogue", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Odporność na Modlitwy", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Nieustraszony", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Fanatyzm", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "scholar", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Odporność na Modlitwy", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Nieustraszony", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Fanatyzm", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)

#Noble of Nimer special case condition
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "is_noble?" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Wiedza Akademicka", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Religioznawstwo", :default_for_origin => false)

#Pelmir
country = Country.find_by_name("Pelmir")
s_choice = country.stats_choices.create(:applies_to => "soldier", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Fanatyzm", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "rogue", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Fanatyzm", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "scholar", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Fanatyzm", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)

#Pelmir origin special case
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "true" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jeździectwo oraz Żeglarstwo i Nawigacja", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jeździectwo oraz Handel", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jeździectwo oraz Pływanie i Nurkowanie", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Żeglarstwo i Nawigacja oraz Handel", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Żeglarstwo i Nawigacja oraz Pływanie i Nurkowanie", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Handel oraz Pływanie i Nurkowanie", :default_for_origin => false)

#Noble of Pelmir special case condition
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "is_noble?" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Heraldyka i Historia", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Dworskość", :default_for_origin => false)

#Wielkie Stepy
country = Country.find_by_name("Wielkie Stepy")
s_choice = country.stats_choices.create(:applies_to => "soldier", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 6, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jeździectwo", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "rogue", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 6, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jeździectwo", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "scholar", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 6, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 5, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jeździectwo", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)

#Wielkie Stepy origin special case
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "true" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Sokoli Wzrok", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Tropienie, Polowanie i Kamuflaż", :default_for_origin => false)

#Noble of Wielkie Stepy special case condition
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "is_noble?" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Handel", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Woltyżerka", :default_for_origin => false)


#Ziemie Sirtol
country = Country.find_by_name("Ziemie Sirtol")
s_choice = country.stats_choices.create(:applies_to => "soldier", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 6, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 4, :group_name => "Spostrzegawczość", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "rogue", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 6, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 4, :group_name => "Spostrzegawczość", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "scholar", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 6, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 3, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Spostrzegawczość", :default_for_origin => true)

#Sirtol origin special case
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "true" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Szulerka", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Półświatka", :default_for_origin => false)

#Noble of Sirtol special case condition
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "is_noble?" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Wyrób Trucizn", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Zakazana Wiedza", :default_for_origin => false)

#Złote Królestwa
country = Country.find_by_name("Złote Królestwa")
s_choice = country.stats_choices.create(:applies_to => "soldier", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Żeglarstwo i Nawigacja", :default_for_origin => true)

s_choice = country.stats_choices.create(:applies_to => "rogue", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Żeglarstwo i Nawigacja", :default_for_origin => true)


s_choice = country.stats_choices.create(:applies_to => "scholar", :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WI", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Znajomość Regionu Pochodzenia", :default_for_origin => true)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Żeglarstwo i Nawigacja", :default_for_origin => true)

#Złote Królestwa origin special case
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "true" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Pływanie i Nurkowanie", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Handel", :default_for_origin => false)

#Noble of Złote Królestwa special case condition
s_choice = country.stats_choices.create(:applies_to => "special", :condition => "is_noble?" )
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Dykcja i Przemawianie", :default_for_origin => false)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Historia i Heraldyka", :default_for_origin => false)


#System default
s_choice = StatsChoice.create(:applies_to => "free_skill", :resource_id => 0)
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jedna wolna umiejętność", :default_for_social_class => false)


