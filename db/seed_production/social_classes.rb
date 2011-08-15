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
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "edukacja")

#Siła „S”
#Zręczność „ZR”
#Wytrzymałość „WT”
#Inteligencja „INT”
#Wiara „WI”
#Ogłada „O”

