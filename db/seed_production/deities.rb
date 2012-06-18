# -*- encoding : utf-8 -*-

deity = Deity.create(:name => "Brak/Ateizm")
deity = Deity.create(:name => "Magni")
deity.countries << [Country.find_all_by_name(["Alantar", "Góry Księżycowe i Niczyje", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol"  ])]
deity = Deity.create(:name => "Sirtol")
deity.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa" ])]
deity = Deity.create(:name => "Smoczy Bóg")
deity.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol"])]
deity = Deity.create(:name => "Syrion")
#TODO fix Syrion
deity = Deity.create(:name => "Durgil")
deity.countries << [Country.find_all_by_name(["Nimer", "Pelmir"])]
deity = Deity.create(:name => "Alaj")
deity.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Złote Królestwa" ])]
deity = Deity.create(:name => "Fortuna")
deity.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Księżycowe i Niczyje", "Nimer", "Pelmir", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa" ])]
deity = Deity.create(:name => "Kalastra")
deity.countries << [Country.find_all_by_name(["Archipelag Południowy"])]
deity = Deity.create(:name => "Galos i Malos")
deity.countries << [Country.find_all_by_name(["Alantar", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]
deity = Deity.create(:name => "Calisto")
deity.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Księżycowe i Niczyje", "Nimer", "Pelmir", "Wielkie Stepy", "Ziemie Sirtol", "Złote Królestwa"])]
deity = Deity.create(:name => "Kal-Kalar")
deity.countries << [Country.find_all_by_name(["Alantar",  "Góry Księżycowe i Niczyje", "Wielkie Stepy",  "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]
deity = Deity.create(:name => "Kastor")
deity.countries << [Country.find_all_by_name(["Archipelag Południowy"])]
deity = Deity.create(:name => "Samotnik")

deity = Deity.create(:name => "Xargos")
deity.countries << [Country.find_all_by_name(["Archipelag Południowy"])]












