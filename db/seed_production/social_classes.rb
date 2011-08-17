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
s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "mordercza praca")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 2, :group_name => "mordercza praca")
# S and WT or skills
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "edukacja") #MG choice


s_class = SocialClass.find_by_name("Chłop Ubogi")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => -1, :group_name => "default")
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "default")
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "default")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "default")

s_class = SocialClass.find_by_name("Chłop Bogaty")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => -1, :group_name => "default")
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "default")
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "default")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "default")

s_class = SocialClass.find_by_name("Mieszczanin Ubogi")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "default")
s_choice = s_class.stats_choices.create
# O *and* S or WT
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "siła")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "wytrzymałość")


s_class = SocialClass.find_by_name("Mieszczanin")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "siła")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "wytrzymałość")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "inteligencja")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "zręczność")

s_class = SocialClass.find_by_name("Mieszczanin Bogaty")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "default")

s_class = SocialClass.find_by_name("Szlachcic Zaściankowy")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "other", :value => 0, :group_name => "herb i tytuł szlachecki")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "edukacja") #free choice

s_class = SocialClass.find_by_name("Szlachcic")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 3, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "other", :value => 0, :group_name => "herb i tytuł szlachecki")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fencing", :value => 3, :group_name => "+3pkt do wszystkich rzutów na Fechtunek (czyli biegłości w wybranej grupie broni)")

s_class = SocialClass.find_by_name("Wielmoża")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 5, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Wykształcenie Akademickie")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Dworskość")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fencing", :value => 3, :group_name => "+3pkt do wszystkich rzutów na Biegłość")

s_class = SocialClass.find_by_name("Niewolnik barbarzyński")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "mordercza praca")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WT", :value => 2, :group_name => "mordercza praca")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "default")

s_class = SocialClass.find_by_name("Wyrzutek")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "siła")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 2, :group_name => "wytrzymałość")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => -1, :group_name => "default")

s_class = SocialClass.find_by_name("Wojownik")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "default")

s_class = SocialClass.find_by_name("Znany wojownik")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fencing", :value => 1, :group_name => "wszystkie Biegłości jakie postać zdobędzie zwiększone zostają o +1pkt")

s_class = SocialClass.find_by_name("Członek rady plemienia")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "edukacja") #free choice

s_class = SocialClass.find_by_name("Potomek Wodza")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => -1, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "default")
s_choice = s_class.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fencing", :value => 2, :group_name => "wszystkie Biegłości jakie postać zdobędzie zwiększone zostają o +2pkt")


#Siła „S”
#Zręczność „ZR”
#Wytrzymałość „WT”
#Inteligencja „INT”
#Wiara „WI”
#Ogłada „O”

