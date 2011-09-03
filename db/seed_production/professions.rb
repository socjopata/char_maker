# -*- encoding : utf-8 -*-
_profession = Profession.create(:name => "Alchemik", :general_type => "scholar")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Berzerker", :general_type => "soldier")
_profession.countries << [Country.find_all_by_name(["Wielkie Stepy", "Góry Księżycowe i Niczyje"])]

_profession = Profession.create(:name => "Czarnoksiężnik", :general_type => "scholar")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Dziecię Sirtol", :general_type => "soldier")
_profession.countries << [Country.find_all_by_name(["Wielkie Stepy", "Góry Księżycowe i Niczyje"])]

_profession = Profession.create(:name => "Dyplomata", :general_type => "scholar")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Fircyk (żołnierz)", :general_type => "soldier")
_profession.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Fircyk (łotr)", :general_type => "rogue")
_profession.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Kapłan", :general_type => "scholar")
_profession.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Ziemie Sirtol"])]

_profession = Profession.create(:name => "Łotr", :general_type => "rogue")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Księżycowe i Niczyje",  "Nimer", "Pelmir", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Mag", :general_type => "scholar")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Odrzucony", :general_type => "soldier")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

_profession = Profession.create(:name => "Rycerz", :general_type => "soldier")
_profession.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Złote Królestwa"])]

_profession = Profession.create(:name => "Rycerz Zakonny", :general_type => "soldier")
_profession.countries << Country.find_all_by_name(["Alantar", "Nimer", "Pelmir"])

_profession = Profession.create(:name => "Strzelec", :general_type => "soldier")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Szaman", :general_type => "scholar")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Księżycowe i Niczyje", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Zabójca", :general_type => "rogue")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Żołnierz", :general_type => "soldier")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Księżycowe i Niczyje", "Nimer", "Pelmir", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])

