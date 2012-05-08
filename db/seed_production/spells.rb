# -*- encoding : utf-8 -*-

profession = Profession.find_by_name("Mag")
["Mistrz Oręża", "Zaklęcie Hakona", "Moc Światła", "Tarcza Qira", "Władca Mrozu", "Zbroja Gorlanda", "Głosy", "Zaklęcie Jagor'a", "Grzmot", "Iluzja Nathaniela", "Animacja Darghula", "Zaklęcie Talhiora", "Wola Umysłu", "Mistrz Umysłu", "Upokorzenie Altanidasa", "Amulet Saldarski ", "Kula Wejrzenia", "Wzrok Calhora", "Sztuczka Waldarisa", "Golem"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1)
end

profession = Profession.find_by_name("Czarnoksiężnik")

["Oczy Strachu", "Ciemność Gallarda", "Maska", "Postarzenie", "Aura Cierpienia", "Abominacja", "Lalka", "Pochwycenie", "Przyzwanie", "Kontakty z Umarłymi", "Sługa Prawdy", "Wyssanie Życia", "Wyssanie Duszy", "Uścisk Xargosa", "Moc Księżyca", "Zmrocz", "Dance Macabre", "Przemiana", "Mgły Śmierci", "Aura Sirtol"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1)
end


profession = Profession.find_by_name("Kapłan")
deity = Deity.find_by_name!("Sirtol")
["Głos Sirtol",
 "Ceremoniał",
 "Sługa",
 "Klątwy",
 "Relikwia Sirtol",
 "Aura Wiary",
 "Księżycowy Rytuał",
 "Dominacja",
 "Księżycowy Pierścień",
 "Oręż Melchiora",
 "Dotyk Pierworodnej",
 "Oblicza Strachu",
 "Gniew Boży",
 "Ciernie Zmierzchu",
 "Opętanie",
 "Trucizna",
 "Zatajenie",
 "Aura Strachu",
 "Ostrza Śmierci",
 "Klątwa Halimmara"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Kastor")

["Szept Kastora",
 "Aura Strachu",
 "Aureola Świętości",
 "Ciernie Zmierzchu",
 "Gniew Boży",
 "Gorzkie Szepty",
 "Księżycowy Pierścień",
 "Oręż Melchiora",
 "Oblicza Strachu",
 "Relikwia Kastora",
 "Oblicze Kastora",
 "Opętanie",
 "Cienie Zdrady",
 "Szaleństwo Tarnhila",
 "Trucizna",
 "Umarlak",
 "Zamiana Kastora",
 "Zbroja Św. Aureliusza",
 "Dominacja",
 "Przyzwanie Terraki"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Smoczy Bóg")

["Potęga Przedwiecznego",
 "Relikwia Smoczego Boga",
 "Porażenie",
 "Ciernie Zmierzchu",
 "Gniew Boży",
 "Aura Wiary",
 "Ostatnie Namaszczenie",
 "Oręż Przedwiecznego",
 "Oblicza Strachu",
 "Znak Gorlanda",
 "Namaszczenie",
 "W Imię Boga",
 "Czarny Ogień",
 "Ogień Wiary",
 "Aura Strachu",
 "Gorzkie Szepty",
 "Smoczy Pancerz",
 "Amulet z Gargarot",
 "Ziemia Przedwiecznego",
 "Więzy Krwi"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Kalastra")

["Relikwia Kalastry",
 "Oratorium",
 "Dominacja",
 "Księżycowy Pierścień",
 "Szaleństwo Tarnhila",
 "Oczyszczenie",
 "Oręż Melchiora",
 "Gniew Kalastry",
 "Męczennik",
 "Zatajenie",
 "Ciernie Zmierzchu",
 "Tchnienie Kalastry",
 "Zbroja Boża",
 "Opętanie",
 "Umarlak",
 "Klątwy",
 "Sługa",
 "Aura Strachu",
 "Trucizna",
 "Gorzkie Szepty"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Syrion")

["Relikwia Syriońska",
 "Namaszczenie",
 "Oratorium",
 "Porażenie",
 "W Imię Boga",
 "Aureola Syriona",
 "Słoneczny Pierścień",
 "Aura Wiary",
 "Zbroja Boża",
 "Krew za Krew",
 "Sakrament Wiary",
 "Ostatnie Namaszczenie",
 "Aureola Świętości",
 "Boska Przemiana",
 "Pieśń do świętego Gredona",
 "Pieśń Walki",
 "Gniew Pana",
 "Stróż",
 "Słoneczny Blask",
 "Wola Syriona"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Alai")

["Relikwia Alaja",
 "Poświęcenie",
 "Porażenie",
 "Balsam",
 "Aureola Syriona",
 "Słoneczny Pierścień",
 "Oczyszczenie",
 "Męczennik",
 "Łzy Pana",
 "Sakrament Wiary",
 "Drugi Policzek",
 "Boska Przemiana",
 "Zbroja Boża",
 "Aureola Świętości",
 "Ofiara",
 "Oratorium",
 "Pokora Alaja",
 "Stróż",
 "Klątwa Halimmara",
 "Miłosierdzie Zbawcy"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Calisto")

["Relikwia Calisto",
 "Poświęcenie",
 "Porażenie",
 "Balsam",
 "Aureola Syriona",
 "Słoneczny Pierścień",
 "Oczyszczenie",
 "Ochrona Niebios",
 "Moc Zwierząt",
 "Sakrament Wiary",
 "Gniew Calisto",
 "Kamuflaż",
 "Matka Ziemia",
 "Kontrola Pogody",
 "Harmonia z Naturą",
 "Moc Natury",
 "Rytuał Odporności",
 "Kontrola Zwierząt",
 "Duchy Natury",
 "Siła Natury"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Durgil")

["Relikwia Durgila",
 "Namaszczenie",
 "Oratorium",
 "Porażenie",
 "W Imię Boga",
 "Aureola Syriona",
 "Słoneczny Pierścień",
 "Aura Wiary",
 "Zbroja Boża",
 "Krew za Krew",
 "Sakrament Wiary",
 "Ostatnie Namaszczenie",
 "Aureola Świętości",
 "Oczyszczenie",
 "Gniew Durgila",
 "Męczennik",
 "Znak Gorlanda",
 "Prawdziwe Męstwo",
 "Klątwy",
 "Amulet Dolmira"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end


#Magni

["Duchy Ognia",
 "Duchy Ziemi",
 "Duchy Nieba",
 "Totemiczna Przemiana Magniego",
 "Totem Pancernika",
 "Chwała Bitewna",
 "Furia Magniego",
 "Moc Zwierząt",
 "Rytuał Krwi",
 "Znaki Runiczne",
 "Matka Ziemia",
 "Kamuflaż",
 "Dary Gór",
 "Kontrola Pogody",
 "Harmonia Natury",
 "Moc Natury",
 "Rytuał Odporności",
 "Kontrola Zwierząt",
 "Przyzwanie Ducha",
 "Duchy Przodków"]

#Stepy

["Duchy Piasku i Pyłu",
 "Duchy Ziemi",
 "Duchy Powietrza",
 "Totemiczna Przemiana Stepów",
 "Totem Psa",
 "Władca Ognia",
 "Moc Kal-Kalar",
 "Światło Gwiazd",
 "Władca Wiatru",
 "Widmowi Wojownicy",
 "Matka Ziemia",
 "Kamuflaż",
 "Dary Stepów",
 "Kontrola Pogody",
 "Harmonia Natury",
 "Moc Natury",
 "Rytuał Odporności",
 "Kontrola Zwierząt",
 "Przyzwanie Ducha",
 "Duchy Przodków"]

#Północ

["Duchy Wody",
 "Duchy Nieba",
 "Duchy Powietrza",
 "Totemiczna Przemiana Północy",
 "Totem Żółwia",
 "blank",
 "Potęga Braci",
 "blank",
 "Tatuaże Malosa",
 "Duchy Zimy",
 "Matka Ziemia",
 "Kamuflaż",
 "Dary Mórz",
 "Kontrola Pogody",
 "Harmonia Natury",
 "Moc Natury",
 "Rytuał Odporności",
 "Kontrola Zwierząt",
 "Przyzwanie Ducha",
 "Duchy Przodków"]

#Archipelag Południowy

["Oblicza Xargosa",
 "Słońce/upał",
 "blank",
 "blank",
 "blank",
 "blank",
 "blank",
 "blank",
 "blank",
 "blank",
 "Matka Ziemia",
 "Kamuflaż",
 "Dary Południa",
 "Kontrola Pogody",
 "Harmonia Natury",
 "Moc Natury",
 "Rytuał Odporności",
 "Kontrola Zwierząt",
 "Przyzwanie Ducha",
 "Duchy Przodków"]
