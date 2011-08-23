# -*- encoding : utf-8 -*-
['Niewolnik',
 'Niewolnik barbarzyński',
 'Chłop Ubogi',
 'Chłop Bogaty',
 'Mieszczanin Ubogi',
 'Mieszczanin',
 'Mieszczanin Bogaty',
 'Szlachcic Zaściankowy',
 'Szlachcic',
 'Wielmoża',
 'Wyrzutek',
 'Wojownik',
 'Znany wojownik',
 'Członek rady plemienia',
 'Potomek Wodza'
].each do |s_class|
  SocialClass.create(:name => s_class) unless SocialClass.exists?(:name => s_class)
end

s_class = SocialClass.find_by_name("Niewolnik")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "mordercza praca", :default_for_social_class => false)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 2, :group_name => "mordercza praca", :default_for_social_class => false)
# S and WT or skills
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jedna wolna umiejętność", :default_for_social_class => false) #MG choice


s_class = SocialClass.find_by_name("Chłop Ubogi")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => -1, :group_name => "domyślne", :default_for_social_class => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "domyślne", :default_for_social_class => true)
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne", :default_for_social_class => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "domyślne", :default_for_social_class => true)

s_class = SocialClass.find_by_name("Chłop Bogaty")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => -1, :group_name => "domyślne", :default_for_social_class => true)
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "domyślne", :default_for_social_class => true)
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne", :default_for_social_class => true)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "domyślne", :default_for_social_class => true)

s_class = SocialClass.find_by_name("Mieszczanin Ubogi")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
# O *and* S or WT
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "siła", :default_for_social_class => false)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "wytrzymałość", :default_for_social_class => false)


s_class = SocialClass.find_by_name("Mieszczanin")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "siła", :default_for_social_class => false)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "wytrzymałość", :default_for_social_class => false)
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "inteligencja", :default_for_social_class => false)
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "zręczność", :default_for_social_class => false)

s_class = SocialClass.find_by_name("Mieszczanin Bogaty")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne", :default_for_social_class => true)

s_class = SocialClass.find_by_name("Szlachcic Zaściankowy")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "other", :value => 0, :group_name => "herb i tytuł szlachecki", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jedna wolna umiejętność", :default_for_social_class => true) #free choice

s_class = SocialClass.find_by_name("Szlachcic")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 3, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "other", :value => 0, :group_name => "herb i tytuł szlachecki", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fencing", :value => 3, :group_name => "+3pkt do wszystkich rzutów na Fechtunek (czyli biegłości w wybranej grupie broni)", :default_for_social_class => true)

s_class = SocialClass.find_by_name("Wielmoża")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 5, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Wykształcenie Akademickie", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Dworskość", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fencing", :value => 3, :group_name => "+3pkt do wszystkich rzutów na Biegłość", :default_for_social_class => true)

s_class = SocialClass.find_by_name("Niewolnik barbarzyński")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WT", :value => 2, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "domyślne", :default_for_social_class => true)

s_class = SocialClass.find_by_name("Wyrzutek")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "siła", :default_for_social_class => false)
s_choice.stats_modifiers.create(:modifies => "WT", :value => 2, :group_name => "wytrzymałość", :default_for_social_class => false)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => -1, :group_name => "domyślne", :default_for_social_class => true)

s_class = SocialClass.find_by_name("Wojownik")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "domyślne", :default_for_social_class => true)

s_class = SocialClass.find_by_name("Znany wojownik")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fencing", :value => 1, :group_name => "wszystkie Biegłości jakie postać zdobędzie zwiększone zostają o +1pkt", :default_for_social_class => true)

s_class = SocialClass.find_by_name("Członek rady plemienia")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jedna wolna umiejętność", :default_for_social_class => true) #free choice

s_class = SocialClass.find_by_name("Potomek Wodza")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne", :default_for_social_class => true)
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fencing", :value => 2, :group_name => "wszystkie Biegłości jakie postać zdobędzie zwiększone zostają o +2pkt", :default_for_social_class => true)


#Siła „S”
#Zręczność „ZR”
#Wytrzymałość „WT”
#Inteligencja „INT”
#Wiara „WI”
#Ogłada „O”

