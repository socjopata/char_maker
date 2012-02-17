## -*- encoding : utf-8 -*-
#

### Weapons ###

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
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

Weapon.create(
  :group_name => "Narodowa",
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

Weapon.create(
  :group_name => "Narodowa",
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

Weapon.create(
  :group_name => "Narodowa",
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

Weapon.create(
  :group_name => "Narodowa",
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

Weapon.create(
  :group_name => "Narodowa",
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

Weapon.create(
  :group_name => "Narodowa",
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
  :price => nil      #TODO
  )

Weapon.create(
  :group_name => "Narodowa",
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

Weapon.create(
  :group_name => "Narodowa",
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


############################### RANGED WEAPON


RangedWeapon.create(
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

RangedWeapon.create(
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

RangedWeapon.create(
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

RangedWeapon.create(
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

RangedWeapon.create(
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

RangedWeapon.create(
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

RangedWeapon.create(
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

RangedWeapon.create(
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

RangedWeapon.create(
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

RangedWeapon.create(
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