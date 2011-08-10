#-*- encoding : utf-8 -*-

_profession = Profession.create(:name => "Alchemik", :type => "scholar")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Wyspy Północy", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Berzerker", :type => "soldier")
_profession.countries << Country.find_all_by_name(["Wielkie Stepy", "Góry Niczyje i Księżycowe"])

_profession = Profession.create(:name => "Czarnoksiężnik", :type => "scholar")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Wyspy Północy", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Dziecię Sirtol", :type => "soldier")
_profession.countries << Country.find_all_by_name(["Wielkie Stepy", "Góry Niczyje i Księżycowe"])

_profession = Profession.create(:name => "Dyplomata", :type => "scholar")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Wielkie Stepy", "Wyspy Północy", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Fircyk (żołnierz)", :type => "soldier")
_profession.countries << Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Fircyk (łotr)", :type => "rogue")
_profession.countries << Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Kapłan", :type => "scholar")
_profession.countries << Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Ziemie Sirtol"])

_profession = Profession.create(:name => "Łotr", :type => "rogue")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Niczyje i Księżycowe",
                                                   "Nimer", "Pelmir", "Wielkie Stepy", "Wyspy Północy", "Ziemie Sirtol", "Złote Królestwa"])


_profession = Profession.create(:name => "Mag", :type => "scholar")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Wyspy Północy", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Odrzucony", :type => "soldier")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Wyspy Północy", "Ziemie Sirtol", "Złote Królestwa"])


_profession = Profession.create(:name => "Rycerz", :type => "soldier")
_profession.countries << Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Złote Królestwa"])


_profession = Profession.create(:name => "Rycerz Zakonny", :type => "soldier")
_profession.countries << Country.find_all_by_name(["Alantar", "Nimer", "Pelmir"])


_profession = Profession.create(:name => "Strzelec", :type => "soldier")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy",
                                                   "Nimer", "Pelmir", "Wyspy Północy", "Ziemie Sirtol", "Złote Królestwa"])


_profession = Profession.create(:name => "Szaman", :type => "scholar")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Niczyje i Księżycowe",
                                                   "Wielkie Stepy", "Wyspy Północy", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Zabójca", :type => "rogue")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Wyspy Północy", "Ziemie Sirtol", "Złote Królestwa"])

_profession = Profession.create(:name => "Żołnierz", :type => "soldier")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Niczyje i Księżycowe",
                                                   "Nimer", "Pelmir", "Wielkie Stepy", "Wyspy Północy", "Ziemie Sirtol", "Złote Królestwa"])

