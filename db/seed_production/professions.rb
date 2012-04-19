# -*- encoding : utf-8 -*-
#      t.integer :skill_points
#      t.integer :attack
#      t.integer :defense
#      t.integer :shooting
#      t.integer :starting_weapon_proficiency
#      t.string :available_armors


# ,:skill_points => 0, :attack => 0 ,:defense => 0 , :shooting => 0, :starting_weapon_proficiency => 0, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie"
_profession = Profession.create(:name => "Alchemik", :general_type => "scholar", :skill_points => 1 ,:attack => 2 ,:defense => 17 , :shooting => 10, :starting_weapon_proficiency => 1, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 0, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 8, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 0, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Pozyskanie Komponentu")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Ważenie Mikstur")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Wykształcenie Akademickie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Zielarstwo")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Talenty Alchemiczne")

_profession = Profession.create(:name => "Berzerker", :general_type => "soldier", :skill_points => 3, :attack => 8 ,:defense => 19 , :shooting => 0, :starting_weapon_proficiency => 3, :preferred_weapon_proficiency => "non-ranged" , :available_armors => "Lekkie, Typowe")
_profession.countries << [Country.find_all_by_name(["Wielkie Stepy", "Góry Księżycowe i Niczyje"])]

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 7, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 0, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 6, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 0, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Twardziel")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Berzerk")


_profession = Profession.create(:name => "Czarnoksiężnik", :general_type => "scholar", :skill_points => 0, :attack => 3 ,:defense => 17 , :shooting => 10, :starting_weapon_proficiency => 1, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 0, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 7, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 4, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Język Klasyczny")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Moc Krwi")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Podstawy Medytacji")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Rzucanie Czarów")


_profession = Profession.create(:name => "Dziecię Sirtol", :general_type => "soldier", :skill_points => 2, :attack => 6 ,:defense => 19 , :shooting => 12, :starting_weapon_proficiency => 2, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe, Ciężkie")
_profession.countries << [Country.find_all_by_name(["Wielkie Stepy", "Góry Księżycowe i Niczyje"])]

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 4, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Zakazana Wiedza")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czarne Ostrze")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Przerażenie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Dziecię Ciemności")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Wyssanie Życia")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Służalczy Ton")

_profession = Profession.create(:name => "Dyplomata", :general_type => "scholar", :skill_points => 0, :attack => 5 ,:defense => 18 , :shooting => 13, :starting_weapon_proficiency => 2, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 0, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 6, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 5, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Dworskość")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Dykcja i Przemawianie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Wykształcenie Akademickie")

s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Przyboczny")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Inspiracja")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Złote Usta")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Rozproszenie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Charyzmatyczny Mówca")
#s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Spryt")

_profession = Profession.create(:name => "Fircyk (żołnierz)", :general_type => "soldier",:skill_points => 1, :attack => 9 ,:defense => 20 , :shooting => 12, :starting_weapon_proficiency => 3, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe")
_profession.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Ziemie Sirtol", "Złote Królestwa"])]

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 6, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 4, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Błyskawiczny Atak")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Dworskość")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Oburęczność")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Refleks")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Wino, Śpiew i Kobiety")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Idealny Cios")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")

_profession = Profession.create(:name => "Fircyk (łotr)", :general_type => "rogue",:skill_points => 1, :attack => 9 ,:defense => 20 , :shooting => 12, :starting_weapon_proficiency => 3, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe")
_profession.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Ziemie Sirtol", "Złote Królestwa"])]

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 6, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 4, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Błyskawiczny Atak")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Dworskość")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Oburęczność")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Refleks")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Wino, Śpiew i Kobiety")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Idealny Cios")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")

_profession = Profession.create(:name => "Kapłan", :general_type => "scholar",:skill_points => 0, :attack => 3 ,:defense => 17 , :shooting => 10, :starting_weapon_proficiency => 1, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie")
_profession.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Ziemie Sirtol"])]

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 0, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 0, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 8, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 0, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 4, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Dykcja i Przemawianie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Leczenie Ran i Chorób")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Religioznawstwo")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Słowo Boże")

_profession = Profession.create(:name => "Łotr", :general_type => "rogue",:skill_points => 2, :attack => 6 ,:defense => 20 , :shooting => 14, :starting_weapon_proficiency => 3, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Księżycowe i Niczyje",  "Nimer", "Pelmir", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 0, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 4, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 8, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Ucieczka i Wyzwalanie się z Więzów")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Kradzież Kieszonkowa i Otwieranie Zamków")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Szulerka")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Szczęście Kastora")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Inicjatywa")


_profession = Profession.create(:name => "Mag", :general_type => "scholar", :skill_points => 1, :attack => 2 ,:defense => 17 , :shooting => 10, :starting_weapon_proficiency => 1, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 0, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 8, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 4, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Język Klasyczny")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Podstawy Medytacji")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Rzucanie czarów")

_profession = Profession.create(:name => "Odrzucony", :general_type => "soldier" ,:skill_points => 2, :attack => 5 ,:defense => 20 , :shooting => 12, :starting_weapon_proficiency => 2, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe")
_profession.countries << [Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])]

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 5, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Wykształcenie Akademickie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Wchłonięcie/Odbicie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Ostrze Antymagii")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Niszczenie Magii")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Oczyszczenie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Niewrażliwość na Magię")


_profession = Profession.create(:name => "Rycerz", :general_type => "soldier"  ,:skill_points => 1, :attack => 9 ,:defense => 22 , :shooting => 11, :starting_weapon_proficiency => 3, :preferred_weapon_proficiency => "non-ranged" , :available_armors => "Lekkie, Typowe, Ciężkie")
_profession.countries << [Country.find_all_by_name(["Alantar", "Nimer", "Pelmir", "Złote Królestwa"])]

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 4, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 6, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Dworskość")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Heraldyka i Historia")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Jeździectwo")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Odporność")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Twardziel")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Duma Rycerska")

_profession = Profession.create(:name => "Rycerz Zakonny", :general_type => "soldier" ,:skill_points => 2, :attack => 6 ,:defense => 21 , :shooting => 11, :starting_weapon_proficiency => 2, :preferred_weapon_proficiency => "non-ranged" , :available_armors => "Lekkie, Typowe, Ciężkie")
_profession.countries << Country.find_all_by_name(["Alantar", "Nimer", "Pelmir"])

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 6, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Czytanie i Pisanie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Heraldyka i Historia")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Nieustraszony")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Religioznawstwo")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "W imię Boga")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Oręż Boga")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Aura Świętości")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Słowo Prawdy")

_profession = Profession.create(:name => "Strzelec", :general_type => "soldier", :skill_points => 2, :attack => 5 ,:defense => 19 , :shooting => 18, :starting_weapon_proficiency => 3, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Nimer", "Pelmir", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 6, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Mierzony Strzał")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Sokoli Wzrok")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Zimna Krew")



_profession = Profession.create(:name => "Szaman", :general_type => "scholar",:skill_points => 1, :attack => 4 ,:defense => 18 , :shooting => 10, :starting_weapon_proficiency => 1, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Księżycowe i Niczyje", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 7, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Leczenie Ran i Chorób")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Posłuch i Zastraszenie")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Runy Proste")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Zielarstwo")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Zaklęcia Szamańskie")


_profession = Profession.create(:name => "Zabójca", :general_type => "rogue",:skill_points => 2, :attack => 7 ,:defense => 20 , :shooting => 14, :starting_weapon_proficiency => 2, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 7, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Celny Cios")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Krycie się i Cichy Chód")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Refleks")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Morderczy Cios")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")


_profession = Profession.create(:name => "Żołnierz", :general_type => "soldier"  ,:skill_points => 4, :attack => 7 ,:defense => 21 , :shooting => 13, :starting_weapon_proficiency => 4, :preferred_weapon_proficiency => nil , :available_armors => "Lekkie, Typowe, Ciężkie")
_profession.countries << Country.find_all_by_name(["Alantar", "Archipelag Południowy", "Góry Księżycowe i Niczyje", "Nimer", "Pelmir", "Wielkie Stepy", "Księstwa Wysp Północy", "Ziemie Sirtol", "Złote Królestwa"])

s_choice = _profession.stats_choices.create(:applies_to => nil, :condition => nil )

s_choice.stats_modifiers.create(:modifies => "S", :value => 4, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 4, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WI", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 4, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "skills", :value => 0, :group_name => "Weteran Wojenny")


