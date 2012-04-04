## -*- encoding : utf-8 -*-
#

### Weapons ###

item = Weapon.create(
  :group_name => "Sieczna Miecze",
  :name => "Miecz Krótki",
  :weapon_type => "L",
  :range => "B",
  :speed => 3,
  :cutting_dmg => 6,
  :pierce_dmg => 2,
  :crushing_dmg => 0,
  :attack_bonus => 1,
  :defense_bonus => 3,
  :special_rules => "",
  :price => 1300
  )

item = Weapon.create(
  :group_name => "Sieczna Miecze",
  :name => "Miecz Szeroki",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 5,
  :cutting_dmg => 11,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 4,
  :special_rules => "+1pkt Obrony aktywnie używając tarczy",
  :price => 1500
  )

item = Weapon.create(
  :group_name => "Sieczna Miecze",
  :name => "Miecz Długi",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 5,
  :cutting_dmg => 10,
  :pierce_dmg => 5,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 3,
  :special_rules => "",
  :price => 1500
  )

item = Weapon.create(
  :group_name => "Sieczna Miecze",
  :name => "Miecz płomienisty zwany „Flamberg”",
  :weapon_type => "C",
  :range => "D",
  :speed => 8,
  :cutting_dmg => 16,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 5,
  :defense_bonus => 4,
  :special_rules => "Trafienie Krytyczne na 29-30",
  :price => 3400
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "20" )

item = Weapon.create(
  :group_name => "Sieczna Miecze",
  :name => "Miecz Dwuręczny zwany „Claymore”",
  :weapon_type => "C",
  :range => "D",
  :speed => 9,
  :cutting_dmg => 15,
  :pierce_dmg => 9,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 5,
  :special_rules => "Idealne Cięcie/Pchnięcie",
  :price => 3500
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "22" )

item = Weapon.create(
  :group_name => "Sieczna Miecze",
  :name => "Miecz Dwuręczny zwany „Espadon”",
  :weapon_type => "C",
  :range => "D",
  :speed => 10,
  :cutting_dmg => 18,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 4,
  :defense_bonus => 5,
  :special_rules => "Rozłupanie Tarczy",
  :price => 4000
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "24" )

item = Weapon.create(
  :group_name => "Kłuta Puginały i Sztylety",
  :name => "Cinquedea",
  :weapon_type => "L",
  :range => "B",
  :speed => 3,
  :cutting_dmg => 0,
  :pierce_dmg => 6,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 1,
  :special_rules => "Parametr Ochronny Kolczug zmniejszany jest o 5pkt",
  :price => 1200
  )

item = Weapon.create(
  :group_name => "Kłuta Puginały i Sztylety",
  :name => "Uszaty zwany Galkiem",
  :weapon_type => "L",
  :range => "B",
  :speed => 3,
  :cutting_dmg => 0,
  :pierce_dmg => 5,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 2,
  :special_rules => "Idealne Pchnięcie",
  :price => 700
  )

item = Weapon.create(
  :group_name => "Kłuta Puginały i Sztylety",
  :name => "Baselard",
  :weapon_type => "L",
  :range => "B",
  :speed => 2,
  :cutting_dmg => 0,
  :pierce_dmg => 4,
  :crushing_dmg => 0,
  :attack_bonus => 1,
  :defense_bonus => 3,
  :special_rules => "Parametr Ochronny pancerzy skórzanych (futra, itp) zmniejszany jest o 5pkt",
  :price => 1000
  )

item = Weapon.create(
  :group_name => "Sieczno / Kłująca Noże",
  :name => "Nóż Myśliwski",
  :weapon_type => "L",
  :range => "B",
  :speed => 3,
  :cutting_dmg => 4,
  :pierce_dmg => 3,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 2,
  :special_rules => "Parametr Ochronny pancerzy skórzanych (futra, itp) zmniejszany jest o 5pkt",
  :price => 300
  )

item = Weapon.create(
  :group_name => "Sieczno / Kłująca Noże",
  :name => "Kordelas",
  :weapon_type => "L",
  :range => "B",
  :speed => 4,
  :cutting_dmg => 7,
  :pierce_dmg => 2,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 2,
  :special_rules => "Idealne Pchnięcie/Cięcie",
  :price => 600
  )

item = Weapon.create(
  :group_name => "Sieczno / Kłująca Noże",
  :name => "Nóż do Rzucania",
  :weapon_type => "L",
  :range => "B/R-10",
  :speed => 3,
  :cutting_dmg => 0,
  :pierce_dmg => 3,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 1,
  :special_rules => "Idealne Pchnięcie/Cięcie",
  :price => 900
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "dexterity", :value => "20" )

item = Weapon.create(
  :group_name => "Obuchowa Klasyczna",
  :name => "Cep Bojowy",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 5,
  :cutting_dmg => 0,
  :pierce_dmg => 0,
  :crushing_dmg => 9,
  :attack_bonus => 4,
  :defense_bonus => 1,
  :special_rules => "Ogłuszenie, Rozłupanie Tarczy",
  :price => 200
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "20" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )

item = Weapon.create(
  :group_name => "Obuchowa Klasyczna",
  :name => "Pałka",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 4,
  :cutting_dmg => 0,
  :pierce_dmg => 0,
  :crushing_dmg => 5,
  :attack_bonus => 2,
  :defense_bonus => 2,
  :special_rules => "Ogłuszenie",
  :price => 50
  )

item = Weapon.create(
  :group_name => "Obuchowa Klasyczna",
  :name => "Laska",
  :weapon_type => "Dw",
  :range => "D",
  :speed => 5,
  :cutting_dmg => 0,
  :pierce_dmg => 0,
  :crushing_dmg => 5,
  :attack_bonus => 1,
  :defense_bonus => 6,
  :special_rules => "Ogłuszenie",
  :price => 50
  )

item = Weapon.create(
  :group_name => "Obuchowa Klasyczna",
  :name => "Morgenstern",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 5,
  :cutting_dmg => 0,
  :pierce_dmg => 0,
  :crushing_dmg => 10,
  :attack_bonus => 2,
  :defense_bonus => 3,
  :special_rules => "Parametr Ochronny Kolczug zmniejszany jest o 3pkt",
  :price => 500
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "20" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )

item = Weapon.create(
  :group_name => "Obuchowa Klasyczna",
  :name => "Młot Pelmirski (lucerneński)",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 6,
  :cutting_dmg => 0,
  :pierce_dmg => 7,
  :crushing_dmg => 8,
  :attack_bonus => 3,
  :defense_bonus => 2,
  :special_rules => "Ogłuszenie",
  :price => 1400
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "20" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )

item = Weapon.create(
  :group_name => "Obuchowa Klasyczna",
  :name => "Obuszek Szlachecki",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 7,
  :cutting_dmg => 0,
  :pierce_dmg => 4,
  :crushing_dmg => 5,
  :attack_bonus => 2,
  :defense_bonus => 4,
  :special_rules => "Ogłuszenie, Krytyk +k10Obrażeń, Ogłada +1pkt",
  :price => 3500
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "18" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )

item = Weapon.create(
  :group_name => "Obuchowa Klasyczna",
  :name => "Młot Bojowy",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 7,
  :cutting_dmg => 0,
  :pierce_dmg => 0,
  :crushing_dmg => 10,
  :attack_bonus => 5,
  :defense_bonus => 0,
  :special_rules => "Ogłuszenie",
  :price => 800
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "22" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )

item = Weapon.create(
  :group_name => "Obuchowa Klasyczna",
  :name => "Nadziak",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 6,
  :cutting_dmg => 0,
  :pierce_dmg => 8,
  :crushing_dmg => 4,
  :attack_bonus => 2,
  :defense_bonus => 3,
  :special_rules => "Parametr Ochronny Ciężkich Zbroi zmniejszany jest o 3pkt",
  :price => 1300
  )

item = Weapon.create(
  :group_name => "Obuchowa Klasyczna",
  :name => "Młot Dwuręczny",
  :weapon_type => "C",
  :range => "D",
  :speed => 10,
  :cutting_dmg => 0,
  :pierce_dmg => 0,
  :crushing_dmg => 15,
  :attack_bonus => 5,
  :defense_bonus => 2,
  :special_rules => "Powalenie, Rozłupanie tarczy",
  :price => 1000
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "27" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )

item = Weapon.create(
  :group_name => "Obuchowa Topory",
  :name => "Topór lekki",
  :weapon_type => "L",
  :range => "B/R-20",
  :speed => 3,
  :cutting_dmg => 7,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 1,
  :special_rules => "",
  :price => 400
  )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )

item = Weapon.create(
  :group_name => "Obuchowa Topory",
  :name => "Topór bojowy",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 6,
  :cutting_dmg => 12,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 4,
  :defense_bonus => 1,
  :special_rules => "",
  :price => 500
  )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )


item = Weapon.create(
  :group_name => "Obuchowa Topory",
  :name => "Topór rycerski",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 5,
  :cutting_dmg => 11,
  :pierce_dmg => 5,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 2,
  :special_rules => "",
  :price => 1200
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "19" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )


item = Weapon.create(
  :group_name => "Obuchowa Topory",
  :name => "Berdysz",
  :weapon_type => "C",
  :range => "Ś",
  :speed => 7,
  :cutting_dmg => 14,
  :pierce_dmg => 9,
  :crushing_dmg => 0,
  :attack_bonus => 5,
  :defense_bonus => 3,
  :special_rules => "",
  :price => 1000
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "21" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )

item = Weapon.create(
  :group_name => "Obuchowa Topory",
  :name => "Księżycowy",
  :weapon_type => "C",
  :range => "D",
  :speed => 8,
  :cutting_dmg => 17,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 4,
  :defense_bonus => 4,
  :special_rules => "Rozłupanie tarczy",
  :price => 1200
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "24" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )

item = Weapon.create(
  :group_name => "Obuchowa Topory",
  :name => "Topór Dwuręczny",
  :weapon_type => "C",
  :range => "D",
  :speed => 9,
  :cutting_dmg => 18,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 5,
  :defense_bonus => 3,
  :special_rules => "Rozłupanie tarczy",
  :price => 1400
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "26" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )


item = Weapon.create(
  :group_name => "Drzewcowa Klasyczna",
  :name => "Kosa bojowa",
  :weapon_type => "C",
  :range => "D",
  :speed => 8,
  :cutting_dmg => 13,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 4,
  :special_rules => "",
  :price => 100
  )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )


item = Weapon.create(
  :group_name => "Drzewcowa Klasyczna",
  :name => "Halabarda",
  :weapon_type => "C",
  :range => "D",
  :speed => 9,
  :cutting_dmg => 16,
  :pierce_dmg => 7,
  :crushing_dmg => 0,
  :attack_bonus => 4,
  :defense_bonus => 4,
  :special_rules => "Rozłupanie tarczy, Walcząc halabardą, partyzaną, gizarmą lub spisą na zasięgu długim przeciw broni o mniejszym zasięgu bohater otrzymuje +5pkt Obrony (nie dotyczy walki przeciw kawalerii). ",
  :price => 1000
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "18" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )

item = Weapon.create(
  :group_name => "Drzewcowa Klasyczna",
  :name => "Partyzana",
  :weapon_type => "C",
  :range => "D",
  :speed => 8,
  :cutting_dmg => 8,
  :pierce_dmg => 10,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 6,
  :special_rules => "Walcząc halabardą, partyzaną, gizarmą lub spisą na zasięgu długim przeciw broni o mniejszym zasięgu bohater otrzymuje +5pkt Obrony (nie dotyczy walki przeciw kawalerii).",
  :price => 1300
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "20" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )

item = Weapon.create(
  :group_name => "Drzewcowa Klasyczna",
  :name => "Gizarma",
  :weapon_type => "C",
  :range => "D",
  :speed => 7,
  :cutting_dmg => 0,
  :pierce_dmg => 9,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 6,
  :special_rules => "Walcząc halabardą, partyzaną, gizarmą lub spisą na zasięgu długim przeciw broni o mniejszym zasięgu bohater otrzymuje +5pkt Obrony (nie dotyczy walki przeciw kawalerii). Walcząc z szarżującym wrogiem (kawalerii jak i piechocie) postać otrzymuje +5pkt do Trafienia i zadawanych Obrażeń.",
  :price => 1600
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "16" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )

item = Weapon.create(
  :group_name => "Drzewcowa Klasyczna",
  :name => "Spisa",
  :weapon_type => "C",
  :range => "D",
  :speed => 9,
  :cutting_dmg => 0,
  :pierce_dmg => 13,
  :crushing_dmg => 0,
  :attack_bonus => 1,
  :defense_bonus => 7,
  :special_rules => "Walcząc halabardą, partyzaną, gizarmą lub spisą na zasięgu długim przeciw broni o mniejszym zasięgu bohater otrzymuje +5pkt Obrony (nie dotyczy walki przeciw kawalerii). Walcząc z szarżującym wrogiem (kawalerii jak i piechocie) postać otrzymuje +5pkt do Trafienia i zadawanych Obrażeń.",
  :price => 1200
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "15" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )

item = Weapon.create(
  :group_name => "Drzewcowa Klasyczna",
  :name => "Rohatyna",
  :weapon_type => "C",
  :range => "D",
  :speed => 7,
  :cutting_dmg => 0,
  :pierce_dmg => 11,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 6,
  :special_rules => "Zamiast normalnego ataku postać wykonuje rzut na Trafienie – udany oznacza test Utrzymania się w siodle z karą -10pkt ściągnięcie z wierzchowca. Ponadto: +5pkt do Trafienia i Obrażeń walcząc z szarżującym wrogiem.",
  :price => 800
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "16" )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Brutalny" )


item = Weapon.create(
  :group_name => "Drzewcowa Miotana",
  :name => "Włócznia Lekka",
  :weapon_type => "T",
  :range => "T/R-30",
  :speed => 5,
  :cutting_dmg => 0,
  :pierce_dmg => 7,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 2,
  :special_rules => "",
  :price => 600
  )

item = Weapon.create(
  :group_name => "Drzewcowa Miotana",
  :name => "Włócznia Ciężka",
  :weapon_type => "Dw",
  :range => "D/R-25",
  :speed => 8,
  :cutting_dmg => 0,
  :pierce_dmg => 10,
  :crushing_dmg => 0,
  :attack_bonus => 5,
  :defense_bonus => 5,
  :special_rules => "",
  :price => 1000
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "18" )


item = Weapon.create(
  :group_name => "Drzewcowa Miotana",
  :name => "Oszczep",
  :weapon_type => "L",
  :range => "Ś/R-40",
  :speed => 6,
  :cutting_dmg => 0,
  :pierce_dmg => 9,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 1,
  :special_rules => "Przy trafieniu krytycznym +k10 Obrażeń",
  :price => 500
  )

item = Weapon.create(
  :group_name => "Sieczna Szable",
  :name => "Sejmitar",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 3,
  :cutting_dmg => 8,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 4,
  :special_rules => "+3pkt przy Paradzie",
  :price => 700
  )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Finezyjny" )

item = Weapon.create(
  :group_name => "Sieczna Szable",
  :name => "Kilidż",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 4,
  :cutting_dmg => 9,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 4,
  :special_rules => "Trafienie Krytyczne na 29-30",
  :price => 2000
  )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Finezyjny" )

item = Weapon.create(
  :group_name => "Sieczna Szable",
  :name => "Krzywa",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 4,
  :cutting_dmg => 9,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 5,
  :special_rules => "Korzystając ze Zmyłki lub Nieczystej Zagrywki przeciwnik otrzymuje -2pkt do testu",
  :price => 2400
  )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Finezyjny" )

item = Weapon.create(
  :group_name => "Sieczna Szable",
  :name => "Lwi Ogon zwany Szamszir",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 4,
  :cutting_dmg => 8,
  :pierce_dmg => 2,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 4,
  :special_rules => "Perfekcyjne Pchnięcie/Cięcie",
  :price => 2800
  )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Finezyjny" )

item = Weapon.create(
  :group_name => "Sieczna Szable",
  :name => "Karabela",
  :weapon_type => "T",
  :range => "Ś",
  :speed => 5,
  :cutting_dmg => 9,
  :pierce_dmg => 2,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 5,
  :special_rules => "Trafienie Krytyczne na 29-30",
  :price => 3000
  )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Finezyjny" )

item = Weapon.create(
  :group_name => "Kopie",
  :name => "Lekka",
  :weapon_type => "T",
  :range => "-",
  :speed => 0,
  :cutting_dmg => 0,
  :pierce_dmg => 17,
  :crushing_dmg => 0,
  :attack_bonus => 7,
  :defense_bonus => 0,
  :special_rules => "+6 do Trafienia przeciw pieszemu i innemu konnemu, który nie walczy kopią, Przebicie",
  :price => 800
  )

item = Weapon.create(
  :group_name => "Kopie",
  :name => "Lekka",
  :weapon_type => "T",
  :range => "-",
  :speed => 0,
  :cutting_dmg => 0,
  :pierce_dmg => 22,
  :crushing_dmg => 0,
  :attack_bonus => 5,
  :defense_bonus => 0,
  :special_rules => "+4 do Trafienia przeciw pieszemu i innemu konnemu, który nie walczy kopią, Przebicie",
  :price => 1000
  )

item = Weapon.create(
  :group_name => "Kukri",
  :name => "Kukri",
  :weapon_type => "L",
  :range => "B",
  :speed => 4,
  :cutting_dmg => 5,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 2,
  :special_rules => "Perfekcyjne Cięcie",
  :price => 500
  )

item = Weapon.create(
  :group_name => "Łamacz mieczy",
  :name => "Łamacz mieczy",
  :weapon_type => "L",
  :range => "B",
  :speed => 3,
  :cutting_dmg => 0,
  :pierce_dmg => 3,
  :crushing_dmg => 0,
  :attack_bonus => 1,
  :defense_bonus => 4,
  :special_rules => "korzystając z umiejętności „Parada” postać otrzymuje +3pkt do testu, a Kara wynikająca z typu broni jaką walczy przeciwnik zmniejszana jest o 5pkt np.: próbując wykonać Paradę przeciwko broni Ciężkiej lub Dwuręcznej kara wynosi tylko -5pkt.",
  :price => 1200
  )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Finezyjny" )


item = Weapon.create(
  :group_name => "Kindżał",
  :name => "Kindżał",
  :weapon_type => "L",
  :range => "B",
  :speed => 4,
  :cutting_dmg => 4,
  :pierce_dmg => 2,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 2,
  :special_rules => "",
  :price => 600
  )

item = Weapon.create(
  :group_name => "Jatagan",
  :name => "Jatagan",
  :weapon_type => "L",
  :range => "Ś",
  :speed => 4,
  :cutting_dmg => 6,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 3,
  :special_rules => "Perfekcyjne Cięcie.",
  :price => 700
  )

item = Weapon.create(
  :group_name => "Dagha",
  :name => "Dagha",
  :weapon_type => "L",
  :range => "B",
  :speed => 4,
  :cutting_dmg => 0,
  :pierce_dmg => 4,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 1,
  :special_rules => "Parametr Ochronny Kolczug zmniejszany jest o 2pkt",
  :price => 1000
  )

item = Weapon.create(
  :group_name => "Maczeta",
  :name => "Maczeta",
  :weapon_type => "L",
  :range => "B",
  :speed => 4,
  :cutting_dmg => 8,
  :pierce_dmg => 0,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 2,
  :special_rules => "",
  :price => 100
  )

item = Weapon.create(
  :group_name => "Dmuchawka",
  :name => "Dmuchawka",
  :weapon_type => "Dw",
  :range => "10/15/-",          #TODO this is an exception
  :speed => 4,
  :cutting_dmg => 0,
  :pierce_dmg => 3,
  :crushing_dmg => 0,
  :attack_bonus => 2,
  :defense_bonus => 2,
  :special_rules => "jeżeli wartość pancerza lub zbroi zostanie „przekroczona” ofiara może stracić maksymalnie 1PŻ. Uzasadnione jest to faktem, iż działanie dmuchawki opiera się właściwie wyłącznie na efekcie trucizny, a pozbawienie kogoś życia za pomocą małej strzałki jest raczej nie możliwe.",
  :price => 500
  )

item = Weapon.create(
  :group_name => "Pazur Sirtol",
  :name => "Pazur Sirtol",
  :weapon_type => "Dw",
  :range => "D",
  :speed => 7,
  :cutting_dmg => 13,
  :pierce_dmg => 9,
  :crushing_dmg => 0,
  :attack_bonus => 3,
  :defense_bonus => 6,
  :special_rules => "Krytyk 29-30, Walcząc na zasięgu długim przeciw broni o mniejszym zasięgu postać otrzymuje +5pkt Obrony (nie dotyczy walki przeciw kawalerii).  Dodatkowo broń ta może być stosowana w połączeniu z wszystkimi umiejętnościami stylu finezyjnego na normalnych zasadach np.: Parada.",
  :price => 2500
  )
item.armament_requirements.create(:check_applies_to => "fightstyle", :name => "Finezyjny" )

############################### RANGED WEAPON


item = RangedWeapon.create(
  :group_name => "Miotana Proce",
  :name => "Proca",
  :weapon_type => "L",
  :range => "20",
  :speed => 4,
  :dmg => 6,
  :dmg_type => "o",
  :accuracy_bonus => 1,
  :reload_time => 0,
  :special_rules => "używając procy postać nie zwiększa zadawanych nią Obrażeń o premię z Siły (wyjątek od zasady broni miotanych).",
  :price => 100
  )
item.armament_requirements.create(:check_applies_to => "modified_stat", :name => "actual_dexterity", :value => "15" ) TODO

item = RangedWeapon.create(
  :group_name => "Strzelecka Łuki Proste",
  :name => "Łuk lekki",
  :weapon_type => "Dw",
  :range => "20/50/75",
  :speed => 3,
  :dmg => 7,
  :dmg_type => "k",
  :accuracy_bonus => 3,
  :reload_time => 0,
  :special_rules => "",
  :price => 500
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "12" )

item = RangedWeapon.create(
  :group_name => "Strzelecka Łuki Proste",
  :name => "Łuk typowy",
  :weapon_type => "Dw",
  :range => "20/50/100",
  :speed => 5,
  :dmg => 9,
  :dmg_type => "k",
  :accuracy_bonus => 2,
  :reload_time => 0,
  :special_rules => "",
  :price => 800
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "15" )

item = RangedWeapon.create(
  :group_name => "Strzelecka Łuki Proste",
  :name => "Łuk długi/ciężki",
  :weapon_type => "Dw",
  :range => "20/50/150",
  :speed => 8,
  :dmg => 12,
  :dmg_type => "k",
  :accuracy_bonus => 1,
  :reload_time => 0,
  :special_rules => "Zmniejsza Parametr Ochronny Kolczug o 2pkt",
  :price => 1200
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "18" )

item = RangedWeapon.create(
  :group_name => "Strzelecka Łuki Refleksyjne",
  :name => "Łuk lekki",
  :weapon_type => "Dw",
  :range => "20/50/90",
  :speed => 4,
  :dmg => 8,
  :dmg_type => "k",
  :accuracy_bonus => 2,
  :reload_time => 0,
  :special_rules => "",
  :price => 1400
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "16" )

item = RangedWeapon.create(
  :group_name => "Strzelecka Łuki Refleksyjne",
  :name => "Łuk typowy",
  :weapon_type => "Dw",
  :range => "20/50/120",
  :speed => 6,
  :dmg => 11,
  :dmg_type => "k",
  :accuracy_bonus => 1,
  :reload_time => 0,
  :special_rules => "",
  :price => 1800
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "18" )

item = RangedWeapon.create(
  :group_name => "Strzelecka Łuki Refleksyjne",
  :name => "Łuk typowy",
  :weapon_type => "Dw",
  :range => "20/50/180",
  :speed => 6,
  :dmg => 13,
  :dmg_type => "k",
  :accuracy_bonus => 0,
  :reload_time => 0,
  :special_rules => "Zmniejsza wartość pancerzy lekkich i typowych o 2pkt",
  :price => 2500
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "20" )

item = RangedWeapon.create(
  :group_name => "Strzelecka Kusze",
  :name => "Kusza lekka",
  :weapon_type => "Dw",
  :range => "25/70/150",
  :speed => 3,
  :dmg => 9,
  :dmg_type => "k",
  :accuracy_bonus => 0,
  :reload_time => 1,
  :special_rules => "Zmniejsza wartość pancerza o 4pkt. Premia do trafienia na bliskim zasięgu: +3",
  :price => 2500
  )

item = RangedWeapon.create(
  :group_name => "Strzelecka Kusze",
  :name => "Kusza typowa",
  :weapon_type => "Dw",
  :range => "25/70/200",
  :speed => 3,
  :dmg => 11,
  :dmg_type => "k",
  :accuracy_bonus => 0,
  :reload_time => 2,
  :special_rules => "Zmniejsza wartość pancerza o 6pkt. Premia do trafienia na bliskim zasięgu: +3",
  :price => 3000
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "14" )


item = RangedWeapon.create(
  :group_name => "Strzelecka Kusze",
  :name => "Kusza ciężka z korbą",
  :weapon_type => "Dw",
  :range => "25/70/250",
  :speed => 3,
  :dmg => 17,
  :dmg_type => "k",
  :accuracy_bonus => 0,
  :reload_time => 4,
  :special_rules => "Zmniejsza wartość pancerza o 10pkt. Premia do trafienia na bliskim zasięgu: +3",
  :price => 4000
  )
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "13" )

####### Armors


item = Armor.create(
    :group_name => "Pancerze Miękkie",
    :name => "Ubranie, Szaty, itp.",
    :armor_type => "Lekki",
    :dexterity_nerf => 0,
    :dexterity_cap => 0,
    :protection_from_cutting => 3,
    :protection_from_piercing => 2,
    :protection_from_crushing => 3,
    :special_rules => "",
    :price => 0
)

item = Armor.create(
    :group_name => "Pancerze Miękkie",
    :name => "Przeszywanica",
    :armor_type => "Lekki",
    :dexterity_nerf => 0,
    :dexterity_cap => 0,
    :protection_from_cutting => 8,
    :protection_from_piercing => 6,
    :protection_from_crushing => 8,
    :special_rules => "",
    :price => 500
)

item = Armor.create(
    :group_name => "Pancerze Miękkie",
    :name => "Skóra Niedźwiedzia",
    :armor_type => "Typowy",
    :dexterity_nerf => 2,
    :dexterity_cap => 30,
    :protection_from_cutting => 10,
    :protection_from_piercing => 6,
    :protection_from_crushing => 12,
    :special_rules => "",
    :price => 800
)

item = Armor.create(
    :group_name => "Pancerze Miękkie",
    :name => "Pancerz Skórzany",
    :armor_type => "Lekki",
    :dexterity_nerf => 0,
    :dexterity_cap => 40,
    :protection_from_cutting => 11,
    :protection_from_piercing => 8,
    :protection_from_crushing => 10,
    :special_rules => "",
    :price => 1400
)

item = Armor.create(
    :group_name => "Pancerze Kolcze",
    :name => "Koszulka Kolcza",
    :armor_type => "Lekki",
    :dexterity_nerf => 2,
    :dexterity_cap => 34,
    :protection_from_cutting => 14,
    :protection_from_piercing => 10,
    :protection_from_crushing => 8,
    :special_rules => "",
    :price => 3000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "10" )

item = Armor.create(
    :group_name => "Pancerze Kolcze",
    :name => "Kolczuga",
    :armor_type => "Lekki",
    :dexterity_nerf => 3,
    :dexterity_cap => 30,
    :protection_from_cutting => 15,
    :protection_from_piercing => 11,
    :protection_from_crushing => 10,
    :special_rules => "",
    :price => 4000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "12" )

item = Armor.create(
    :group_name => "Pancerze Kolcze",
    :name => "Kaftan Kolczy",
    :armor_type => "Typowy",
    :dexterity_nerf => 5,
    :dexterity_cap => 26,
    :protection_from_cutting => 16,
    :protection_from_piercing => 12,
    :protection_from_crushing => 11,
    :special_rules => "",
    :price => 5000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "14" )

item = Armor.create(
    :group_name => "Pancerze Kolcze",
    :name => "Pancerz Kolczy",
    :armor_type => "Typowy",
    :dexterity_nerf => 6,
    :dexterity_cap => 23,
    :protection_from_cutting => 17,
    :protection_from_piercing => 13,
    :protection_from_crushing => 12,
    :special_rules => "",
    :price => 6000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "16" )

item = Armor.create(
    :group_name => "Pancerze Kolcze",
    :name => "Ciężki Kaftan Kolczy",
    :armor_type => "Ciężki",
    :dexterity_nerf => 6,
    :dexterity_cap => 20,
    :protection_from_cutting => 18,
    :protection_from_piercing => 13,
    :protection_from_crushing => 13,
    :special_rules => "",
    :price => 7000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "18" )

item = Armor.create(
    :group_name => "Pancerze Kolcze",
    :name => "Ciężki Pancerz Kolczy",
    :armor_type => "Ciężki",
    :dexterity_nerf => 7,
    :dexterity_cap => 16,
    :protection_from_cutting => 20,
    :protection_from_piercing => 14,
    :protection_from_crushing => 14,
    :special_rules => "",
    :price => 8000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "20" )

item = Armor.create(
    :group_name => "Pancerze Zbrojnikowe",
    :name => "Lekki Pancerz Zbrojnikowy",
    :armor_type => "Lekki",
    :dexterity_nerf => 2,
    :dexterity_cap => 23,
    :protection_from_cutting => 11,
    :protection_from_piercing => 7,
    :protection_from_crushing => 12,
    :special_rules => "",
    :price => 1800
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "10" )

item = Armor.create(
    :group_name => "Pancerze Zbrojnikowe",
    :name => "Typowy Pancerz Zbrojnikowy",
    :armor_type => "Typowy",
    :dexterity_nerf => 5,
    :dexterity_cap => 19,
    :protection_from_cutting => 13,
    :protection_from_piercing => 10,
    :protection_from_crushing => 14,
    :special_rules => "",
    :price => 2500
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "13" )

item = Armor.create(
    :group_name => "Pancerze Zbrojnikowe",
    :name => "Miarowy Pancerz Zbrojnikowy",
    :armor_type => "Typowy",
    :dexterity_nerf => 7,
    :dexterity_cap => 15,
    :protection_from_cutting => 15,
    :protection_from_piercing => 11,
    :protection_from_crushing => 16,
    :special_rules => "",
    :price => 3200
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "16" )

item = Armor.create(
    :group_name => "Pancerze Lamelkowe",
    :name => "Lekki Pancerz Lamelkowy",
    :armor_type => "Lekki",
    :dexterity_nerf => 3,
    :dexterity_cap => 22,
    :protection_from_cutting => 12,
    :protection_from_piercing => 12,
    :protection_from_crushing => 12,
    :special_rules => "",
    :price => 2800
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "15" )

item = Armor.create(
    :group_name => "Pancerze Lamelkowe",
    :name => "Typowy Pancerz Lamelkowy",
    :armor_type => "Typowy",
    :dexterity_nerf => 5,
    :dexterity_cap => 15,
    :protection_from_cutting => 15,
    :protection_from_piercing => 13,
    :protection_from_crushing => 14,
    :special_rules => "",
    :price => 4500
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "16" )

item = Armor.create(
    :group_name => "Pancerze Lamelkowe",
    :name => "Miarowy Pancerz Lamelkowy",
    :armor_type => "Typowy",
    :dexterity_nerf => 7,
    :dexterity_cap => 14,
    :protection_from_cutting => 16,
    :protection_from_piercing => 14,
    :protection_from_crushing => 15,
    :special_rules => "",
    :price => 6000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "17" )

item = Armor.create(
    :group_name => "Kirysy Folgowe Kryte",
    :name => "Typowy Kirys Folgowy Kryte",
    :armor_type => "Typowy",
    :dexterity_nerf => 6,
    :dexterity_cap => 15,
    :protection_from_cutting => 21,
    :protection_from_piercing => 15,
    :protection_from_crushing => 16,
    :special_rules => "",
    :price => 15000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "20" )

item = Armor.create(
    :group_name => "Kirysy Folgowe Kryte",
    :name => "Ciężki Kirys Folgowy Kryte",
    :armor_type => "Ciężki",
    :dexterity_nerf => 7,
    :dexterity_cap => 13,
    :protection_from_cutting => 22,
    :protection_from_piercing => 16,
    :protection_from_crushing => 17,
    :special_rules => "",
    :price => 20000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "22" )

item = Armor.create(
    :group_name => "Kirysy Płytowe",
    :name => "Miarowy Kirys Płytowy",
    :armor_type => "Ciężki",
    :dexterity_nerf => 7,
    :dexterity_cap => 12,
    :protection_from_cutting => 23,
    :protection_from_piercing => 17,
    :protection_from_crushing => 18,
    :special_rules => "",
    :price => 40000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "23" )

item = Armor.create(
    :group_name => "Kirysy Płytowe",
    :name => "Ciężki Kirys Płytowy",
    :armor_type => "Ciężki",
    :dexterity_nerf => 8,
    :dexterity_cap => 11,
    :protection_from_cutting => 24,
    :protection_from_piercing => 18,
    :protection_from_crushing => 19,
    :special_rules => "",
    :price => 50000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "24" )

item = Armor.create(
    :group_name => "Zbroje Karacenowe",
    :name => "Miarowa Zbroja Karacenowa",
    :armor_type => "Ciężki",
    :dexterity_nerf => 8,
    :dexterity_cap => 12,
    :protection_from_cutting => 26,
    :protection_from_piercing => 22,
    :protection_from_crushing => 21,
    :special_rules => "przeciwnicy nie mogą obniżyć jej Parametrów korzystając ze zdolność typu Celny Cios, Mierzony Strzał, itp. zasada ta nie dotyczy kusz, grotów Liściastych i kopii (bronie te nadal modyfikują parametry Zbroi). Ponadto w tej zbroi nie można wykonywać umiejętności bazujących na finezyjnym stylu walki.",
    :price => 220000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "27" )

item = Armor.create(
    :group_name => "Zbroje Karacenowe",
    :name => "Ciężka Zbroja Karacenowa",
    :armor_type => "Ciężki",
    :dexterity_nerf => 10,
    :dexterity_cap => 11,
    :protection_from_cutting => 27,
    :protection_from_piercing => 23,
    :protection_from_crushing => 22,
    :special_rules => "przeciwnicy nie mogą obniżyć jej Parametrów korzystając ze zdolność typu Celny Cios, Mierzony Strzał, itp. zasada ta nie dotyczy kusz, grotów Liściastych i kopii (bronie te nadal modyfikują parametry Zbroi). Ponadto w tej zbroi nie można wykonywać umiejętności bazujących na finezyjnym stylu walki.",
    :price => 250000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "30" )

item = Armor.create(
    :group_name => "Zbroje Płytowe",
    :name => "Typowa Zbroja Płytowa",
    :armor_type => "Ciężki",
    :dexterity_nerf => 11,
    :dexterity_cap => 7,
    :protection_from_cutting => 25,
    :protection_from_piercing => 20,
    :protection_from_crushing => 20,
    :special_rules => "przeciwnicy nie mogą obniżyć jej Parametrów korzystając ze zdolność typu Celny Cios, Mierzony Strzał, itp. zasada ta nie dotyczy kusz, grotów Liściastych i kopii (bronie te nadal modyfikują parametry Zbroi). Ponadto w tej zbroi nie można wykonywać umiejętności bazujących na finezyjnym stylu walki.",
    :price => 120000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "27" )

item = Armor.create(
    :group_name => "Zbroje Płytowe",
    :name => "Miarowa Zbroja Płytowa",
    :armor_type => "Ciężki",
    :dexterity_nerf => 10,
    :dexterity_cap => 10,
    :protection_from_cutting => 26,
    :protection_from_piercing => 20,
    :protection_from_crushing => 21,
    :special_rules => "przeciwnicy nie mogą obniżyć jej Parametrów korzystając ze zdolność typu Celny Cios, Mierzony Strzał, itp. zasada ta nie dotyczy kusz, grotów Liściastych i kopii (bronie te nadal modyfikują parametry Zbroi). Ponadto w tej zbroi nie można wykonywać umiejętności bazujących na finezyjnym stylu walki.",
    :price => 160000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "26" )

item = Armor.create(
    :group_name => "Zbroje Płytowe",
    :name => "„Strzelcza” Zbroja Płytowa",
    :armor_type => "Ciężki",
    :dexterity_nerf => 9,
    :dexterity_cap => 11,
    :protection_from_cutting => 28,
    :protection_from_piercing => 23,
    :protection_from_crushing => 23,
    :special_rules => "przeciwnicy nie mogą obniżyć jej Parametrów korzystając ze zdolność typu Celny Cios, Mierzony Strzał, itp. zasada ta nie dotyczy kusz, grotów Liściastych i kopii (bronie te nadal modyfikują parametry Zbroi). Ponadto w tej zbroi nie można wykonywać umiejętności bazujących na finezyjnym stylu walki.",
    :price => 350000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "24" )

item = Armor.create(
    :group_name => "Zbroje Płytowe",
    :name => "Pełna, „Kopijnicza” Zbroja Płytowa",
    :armor_type => "Ciężki",
    :dexterity_nerf => 11,
    :dexterity_cap => 10,
    :protection_from_cutting => 31,
    :protection_from_piercing => 25,
    :protection_from_crushing => 24,
    :special_rules => "przeciwnicy nie mogą obniżyć jej Parametrów korzystając ze zdolność typu Celny Cios, Mierzony Strzał, itp. zasada ta nie dotyczy kusz, grotów Liściastych i kopii (bronie te nadal modyfikują parametry Zbroi). Ponadto w tej zbroi nie można wykonywać umiejętności bazujących na finezyjnym stylu walki.",
    :price => 400000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "28" )

item = Armor.create(
    :group_name => "Pancerze i Zbroje Egzotyczne",
    :name => "Pancerz Reptilioński",
    :armor_type => "Lekki",
    :dexterity_nerf => 5,
    :dexterity_cap => 35,
    :protection_from_cutting => 18,
    :protection_from_piercing => 18,
    :protection_from_crushing => 11,
    :special_rules => "+3pkt do Obrony Dystansowej",
    :price => 140000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "17" )
item.armament_requirements.create(:check_applies_to => "social_class", :name => "is_elite?")

item = Armor.create(
    :group_name => "Pancerze i Zbroje Egzotyczne",
    :name => "Pancerz z Bazyliszka",
    :armor_type => "Typowy",
    :dexterity_nerf => 6,
    :dexterity_cap => 28,
    :protection_from_cutting => 22,
    :protection_from_piercing => 23,
    :protection_from_crushing => 15,
    :special_rules => "Odporności na Magię +4pkt",
    :price => 200000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "15" )
item.armament_requirements.create(:check_applies_to => "social_class", :name => "is_elite?")

item = Armor.create(
    :group_name => "Pancerze i Zbroje Egzotyczne",
    :name => "Pancerz Wężowy",
    :armor_type => "Typowy",
    :dexterity_nerf => 8,
    :dexterity_cap => 15,
    :protection_from_cutting => 14,
    :protection_from_piercing => 23,
    :protection_from_crushing => 23,
    :special_rules => "+2pkt do Obrony w Walce",
    :price => 250000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "14" )
item.armament_requirements.create(:check_applies_to => "social_class", :name => "is_elite?")


item = Armor.create(
    :group_name => "Pancerze i Zbroje Egzotyczne",
    :name => "Pancerz Smoczy",
    :armor_type => "Typowy",
    :dexterity_nerf => 4,
    :dexterity_cap => 25,
    :protection_from_cutting => 23,
    :protection_from_piercing => 19,
    :protection_from_crushing => 19,
    :special_rules => "+4pkt do Obrony Dystansowej, Odporności na Magię +3pkt.",
    :price => 450000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "15" )
item.armament_requirements.create(:check_applies_to => "social_class", :name => "is_elite?")
item.armament_requirements.create(:check_applies_to => "origin", :name => "Alantar")

item = Armor.create(
    :group_name => "Pancerze i Zbroje Egzotyczne",
    :name => "Pełna Zbroja Smocza",
    :armor_type => "Ciężki",
    :dexterity_nerf => 8,
    :dexterity_cap => 19,
    :protection_from_cutting => 29,
    :protection_from_piercing => 24,
    :protection_from_crushing => 29,
    :special_rules => "+5pkt do Obrony Dystansowej, Odporności na Magię +3pkt",
    :price => 600000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "23" )
item.armament_requirements.create(:check_applies_to => "social_class", :name => "is_elite?")
item.armament_requirements.create(:check_applies_to => "origin", :name => "Alantar")

item = Shield.create(
    :group_name => "Tarcze Piechoty",
    :name => "Puklerz",
    :defense_bonus => 3,
    :dexterity_nerf => 0,
    :dexterity_cap => 33,
    :special_rules => "",
    :price => 700
)

item = Shield.create(
    :group_name => "Tarcze Piechoty",
    :name => "Okrągła z żelaznym umbrem",
    :defense_bonus => 5,
    :dexterity_nerf => 3,
    :dexterity_cap => 29,
    :special_rules => "+2pkt do Obrony Dystansowej",
    :price => 500
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "11" )

item = Shield.create(
    :group_name => "Tarcze Piechoty",
    :name => "Migdałowa",
    :defense_bonus => 6,
    :dexterity_nerf => 4,
    :dexterity_cap => 23,
    :special_rules => "+3pkt do Obrony Dystansowej",
    :price => 700
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "13" )

item = Shield.create(
    :group_name => "Tarcze Piechoty",
    :name => "Trójkątna",
    :defense_bonus => 7,
    :dexterity_nerf => 6,
    :dexterity_cap => 17,
    :special_rules => "+4pkt do Obrony Dystansowej",
    :price => 800
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "15" )

item = Shield.create(
    :group_name => "Tarcze Piechoty",
    :name => "Pawęż Typowa",
    :defense_bonus => 8,
    :dexterity_nerf => 8,
    :dexterity_cap => 13,
    :special_rules => "+5pkt do Obrony Dystansowej",
    :price => 900
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "19" )

item = Shield.create(
    :group_name => "Tarcze Piechoty",
    :name => "Ciężka Pawęż",
    :defense_bonus => 0,  #TODO special case
    :dexterity_nerf => 10,
    :dexterity_cap => 5,
    :special_rules => "Ciężka pawęż z kolcami i otworem strzelniczym używana jest głównie podczas oblężeń i ukierunkowanemu, spodziewanemu ostrzałowi na polu bitwy. Ponieważ, niektóre okazy mogą ważyć nawet ponad 20kg transportuje się je na wozach. Walka przy ich użyciu, poza sztywnym szykiem, jest właściwie nie możliwa. Postać schowana za taką zasłoną jest doskonale chroniona przed ostrzałem z broni dystansowych, a przeciwnik może ją Trafić tylko i wyłącznie uzyskując Trafienie Krytyczne. Podczas walki wręcz szyk wykorzystujący pawęże najlepiej rozbić za pomocą szarży kawaleryjskiej, potężnej magii lub ciężkich machin bitewnych.",
    :price => 1000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "18" )

item = Shield.create(
    :group_name => "Tarcze Piechoty",
    :name => "Łuskowa, Migdałowa Reptiliońska",
    :defense_bonus => 9,
    :dexterity_nerf => 6,
    :dexterity_cap => 22,
    :special_rules => "+6pkt do Obrony Dystansowej.",
    :price => 25000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "21" )
item.armament_requirements.create(:check_applies_to => "social_class", :name => "is_elite?")


item = Shield.create(
    :group_name => "Tarcze Piechoty",
    :name => "Łuskowa, Okrągła Smocza",
    :defense_bonus => 7,
    :dexterity_nerf => 4,
    :dexterity_cap => 26,
    :special_rules => "+5pkt do Obrony Dystansowej, +3pkt do Odporność na Magię. Wyjątkowo rzadka tarcza, dostępna tylko w Alantarze dla zasłużonych sług Cesarza oraz najbogatszych obywateli państwa.",
    :price => 50000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "20" )
item.armament_requirements.create(:check_applies_to => "social_class", :name => "is_elite?")
item.armament_requirements.create(:check_applies_to => "origin", :name => "Alantar")

item = Shield.create(
    :group_name => "Tarcze Jazdy",
    :name => "Okrągła",
    :defense_bonus => 5,
    :dexterity_nerf => 4,
    :dexterity_cap => 25,
    :special_rules => "+3pkt do Obrony Dystansowej.",
    :price => 600
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "10" )

item = Shield.create(
    :group_name => "Tarcze Jazdy",
    :name => "Trójkątna, zaokrąglona",
    :defense_bonus => 6,
    :dexterity_nerf => 7,
    :dexterity_cap => 20,
    :special_rules => "+4pkt do Obrony Dystansowej",
    :price => 900
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "14" )

item = Shield.create(
    :group_name => "Tarcze Jazdy",
    :name => "„Rnedio clipeo”",
    :defense_bonus => 4,
    :dexterity_nerf => 3,
    :dexterity_cap => 19,
    :special_rules => "Używając w połączeniu z Kopią +2pkt do Trafienia, +3pkt do Obrony Dystansowej.",
    :price => 1000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "16" )

item = Shield.create(
    :group_name => "Tarcze Jazdy",
    :name => "Pawężki",
    :defense_bonus => 6,
    :dexterity_nerf => 5,
    :dexterity_cap => 18,
    :special_rules => "+5pkt do Obrony Dystansowej",
    :price => 800
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "15" )

item = Shield.create(
    :group_name => "Tarcze Jazdy",
    :name => "Łuskowa smocza, migdałowa",
    :defense_bonus => 7,
    :dexterity_nerf => 4,
    :dexterity_cap => 22,
    :special_rules => "+4pkt do Obrony Dystansowej, Wyjątkowo rzadka tarcza, dostępna tylko w Alantarze dla zasłużonych sług Cesarza oraz najbogatszych obywateli państwa.",
    :price => 45000
)
item.armament_requirements.create(:check_applies_to => "statistics", :name => "strength", :value => "19" )
item.armament_requirements.create(:check_applies_to => "social_class", :name => "is_elite?")
item.armament_requirements.create(:check_applies_to => "origin", :name => "Alantar")




