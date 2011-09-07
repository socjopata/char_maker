# -*- encoding : utf-8 -*-
#      t.integer :skill_points
#      t.integer :attack
#      t.integer :defense
#      t.integer :shooting
#      t.integer :starting_weapon_proficiency
#      t.string :available_armors


# ,:skill_points => 0, :attack => 0 ,:defense => 0 , :shooting => 0, :starting_weapon_proficiency => 0, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie"
_profession = Profession.create(:name => "Alchemik", :general_type => "scholar", :skill_points => 1 ,:attack => 2 ,:defense => 10 , :shooting => 10, :starting_weapon_proficiency => 1, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Berzerker", :general_type => "soldier", :skill_points => 3, :attack => 8 ,:defense => 19 , :shooting => 10, :starting_weapon_proficiency => 3, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe")
_profession.countries << [Country.find_all_by_name(["Wielkie Stepy", "Góry Księżycowe i Niczyje"])]

_profession = Profession.create(:name => "Czarnoksiężnik", :general_type => "scholar", :skill_points => 0, :attack => 3 ,:defense => 17 , :shooting => 10, :starting_weapon_proficiency => 1, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Dziecię Sirtol", :general_type => "soldier", :skill_points => 2, :attack => 6 ,:defense => 19 , :shooting => 12, :starting_weapon_proficiency => 2, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe, Ciężkie")
_profession.countries << [Country.find_all_by_name(["Wielkie Stepy", "Góry Księżycowe i Niczyje"])]

_profession = Profession.create(:name => "Dyplomata", :general_type => "scholar", :skill_points => 0, :attack => 5 ,:defense => 18 , :shooting => 13, :starting_weapon_proficiency => 2, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Fircyk (żołnierz)", :general_type => "soldier",:skill_points => 1, :attack => 9 ,:defense => 20 , :shooting => 12, :starting_weapon_proficiency => 3, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe")
_profession.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Fircyk (łotr)", :general_type => "rogue",:skill_points => 1, :attack => 9 ,:defense => 20 , :shooting => 12, :starting_weapon_proficiency => 3, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe")
_profession.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Kapłan", :general_type => "scholar",:skill_points => 0, :attack => 3 ,:defense => 17 , :shooting => 10, :starting_weapon_proficiency => 1, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie")
_profession.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Ziemie Sirtol"])]

_profession = Profession.create(:name => "Łotr", :general_type => "rogue",:skill_points => 2, :attack => 6 ,:defense => 20 , :shooting => 14, :starting_weapon_proficiency => 3, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Księżycowe i Niczyje",  "Nimer", "Pelmir", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Mag", :general_type => "scholar", :skill_points => 1, :attack => 2 ,:defense => 17 , :shooting => 10, :starting_weapon_proficiency => 1, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Odrzucony", :general_type => "soldier" ,:skill_points => 2, :attack => 5 ,:defense => 20 , :shooting => 12, :starting_weapon_proficiency => 2, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Rycerz", :general_type => "soldier"  ,:skill_points => 1, :attack => 9 ,:defense => 22 , :shooting => 11, :starting_weapon_proficiency => 3, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe, Ciężkie")
_profession.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Złote Królestwa"])]

_profession = Profession.create(:name => "Rycerz Zakonny", :general_type => "soldier" ,:skill_points => 2, :attack => 6 ,:defense => 21 , :shooting => 11, :starting_weapon_proficiency => 2, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe, Ciężkie")
_profession.countries << Country.find_all_by_name(["Alantar", "Nimer", "Pelmir"])

_profession = Profession.create(:name => "Strzelec", :general_type => "soldier", :skill_points => 2, :attack => 5 ,:defense => 19 , :shooting => 18, :starting_weapon_proficiency => 3, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Szaman", :general_type => "scholar",:skill_points => 1, :attack => 4 ,:defense => 18 , :shooting => 10, :starting_weapon_proficiency => 1, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Księżycowe i Niczyje", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Zabójca", :general_type => "rogue",:skill_points => 2, :attack => 7 ,:defense => 20 , :shooting => 14, :starting_weapon_proficiency => 2, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Żołnierz", :general_type => "soldier"  ,:skill_points => 4, :attack => 7 ,:defense => 21 , :shooting => 13, :starting_weapon_proficiency => 4, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe, Ciężkie")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Księżycowe i Niczyje", "Nimer", "Pelmir", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])

