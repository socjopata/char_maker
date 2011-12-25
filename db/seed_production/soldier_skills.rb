## -*- encoding : utf-8 -*-
#

skill = Skill.create(:profession_type => "soldier",
                     :name => "Atak i Obrona",
                     :way_it_works => "postać może wykonać jedną z dwóch następujących akcji:
- zwiększyć Trafienie o +3pkt kosztem utraty 3pkt Obrony lub
- zwiększyć o +3pkt Obronę zmniejszając swe Trafienie o 3pkt." )

skill = Skill.create(:profession_type => "soldier",
                     :name => "Błyskawiczny Atak",
                     :way_it_works => "postać sprawdzając swą Inicjatywę może wykonać dwa rzuty k10 i wybrać wyższy wynik. Ponadto jej Inicjatywa zwiększona jest o +1pkt.
Umiejętność Pasywna" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Refleks" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "20" )

skill = Skill.create(:profession_type => "soldier",
                     :name => "Mistrz Walki na Dystans",
                     :way_it_works => "walcząc na Długim zasięgu postać zyskuje +2pkt do Trafienia i zadawanych Obrażeń. Parametr Zmiana Zasięgu wzrasta na stałe o +2pkt.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "experience", :value => "3" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "25" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 2, :group_name => "Zmiana Zasięgu")

skill = Skill.create(:profession_type => "soldier",
                     :name => "Natarcie i Powstrzymanie",
                     :way_it_works => "postać może wykonać jedną z dwóch następujących akcji:
- zwiększyć Trafienie o +5pkt kosztem utraty -5pkt Obrony lub
- zwiększyć o +5pkt Obronę zmniejszając swe Trafienie o +5pkt.
" )

skill.skill_requirements.create(:check_applies_to => "experience", :value => "3" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Atak i Obrona" )


skill = Skill.create(:profession_type => "soldier",
                     :name => "Niewzruszony",
                     :way_it_works => "za każdym razem kiedy przeciwnik próbuje postać: powalić, wysadzić z siodła, (itp. efekty nawet magiczne), bohater otrzymuje premię +10pkt do odpowiedniego testu. Ponadto zawsze doskonale potrafi zachować równowagę co może być pomocne podczas walki w trudnych warunkach (decyzja MG). Bohater zwiększa swoją Wytrzymałość o +1pkt.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "experience", :value => "2")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "OR: WT,S", :value => "25" )

skill = Skill.create(:profession_type => "soldier",
                     :name => "Odbicie Tarczą",
                     :limitations => "tylko  używając tarczy (za wyjątkiem puklerza), zdolność nie może zostać wykorzystana przeciw istotom zdecydowaniem większym od człowieka.",
                     :way_it_works => "bohater zyskuje +2pkt do Obrony. Jeżeli przeciwnik nie trafił go żadnym atakiem w tej rundzie, otrzymuje -5pkt do Obrony na okres następnej rundy (uderzenie tarczą wytrąca go z równowagi).
	Ponadto bohater może wybrać jeden rodzaj tarczy, w której doskonali swe umiejętności dzięki czemu jej Obrona wzrasta na stałe o +1pkt.
" )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Tarczownik" )
#TODO Ponadto bohater może wybrać jeden rodzaj tarczy, w której doskonali swe umiejętności dzięki czemu jej Obrona wzrasta na stałe o +1pkt.
#TODO favorite arment   ^^

skill = Skill.create(:profession_type => "soldier",
                     :name => "Szał Bitewny",
                     :limitations => "postać musiała w tej walce odnieść jakieś rany.",
                     :way_it_works => "skorzystać z tej zdolności można dopiero po odniesieniu ran i po upływie dwóch rund walki. Szał bitewny daje Jeden dodatkowy Atak w każdej broni przeznaczonej do walki wręcz, którą posługuje się bohater. Umiejętność utrzymuje się przez rundę/poziom postaci i nie może być użyta częściej niż raz na walkę/starcie.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "experience", :value => "4")
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Błyskawiczny Atak" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Refleks" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "25" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )


skill = Skill.create(:profession_type => "soldier",
                     :name => "Szybkość Lothmir'a",
                     :limitations => "Posiadanie konia bojowego.",
                     :way_it_works => "za każdym razem kiedy postać Zmienia Zasięg może wykonać dwa rzuty i wybrać korzystniejszy wynik.
Inicjatywa postaci jak i jej Bieg podnoszone są o +1pkt.
Umiejętność Pasywna
" )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "20" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Bieg")

skill = Skill.create(:profession_type => "soldier",
                     :name => "Tarczownik",
                     :limitations => "z tej zdolności nie można korzystać jeżdżąc konno.",
                     :way_it_works => "Obrona tarczy zwiększana jest o +3pkt kosztem zmniejszenia Trafienia o -1pkt. Korzystając z Tarczownika Obrona Dystansowa postaci podnoszona jest o dodatkowe +3pkt (łącznie o +6pkt).
" )

#TODO make sure, you're using the same names across the system'

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 3, :group_name => "Obrona Tarczy")
s_choice.stats_modifiers.create(:modifies => "fighting", :value => -1, :group_name => "Trafienie")


skill = Skill.create(:profession_type => "soldier",
                     :name => "Ulubiona Broń",
                     :way_it_works => "wybrana przez postać broń (np.: espadon, kukri, nadziak, itd.) ma zwiększone parametry Ataku i Obrony o +1pkt, a jej Tempo obniżone jest o -1pkt (do minimum 1pkt). Umiejętność dotyczy jednej, konkretnej broni, a nie całej grupy.
Umiejętność Pasywna" )

#TODO favorite arment

skill = Skill.create(:profession_type => "soldier",
                     :name => "Walka na Dystans",
                     :way_it_works => "wartość parametru „Zmiana Zasięgu” wzrasta o +4pkt. Ponadto za każdym razem kiedy przeciwnikowi nie uda się skrócić zasięgu, bohater zgodnie z zasadami walki zyskuje dodatkowy atak, którego Trafienie i Obrażenia zwiększane są o +5pkt (powyższa premia dotyczy tylko i wyłącznie Ataku uzyskanego po nieudanym przejściu przez zasięg).
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "21" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 4, :group_name => "Zmiana Zasięgu")


skill = Skill.create(:profession_type => "soldier",
                     :name => "Walka w Trudnych Warunkach",
                     :way_it_works => "postaci w mniejszym stopniu przeszkadza padający deszcz, rozmokły grunt i inne warunki utrudniające walkę (tłok, małe pomieszczenie,  itp.). Dzięki czemu nie otrzymuje standardowej kary za ww. utrudnienia (w szczególnych przypadkach np.: walka na bagnach MG przyznaje tylko połowę stosownej kary). Zręczność postaci podnoszona jest o +1pkt.
Umiejętność Pasywna" )


s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 4, :group_name => "Zmiana Zasięgu")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")


skill = Skill.create(:profession_type => "soldier",
                     :name => "Walka z Wieloma Przeciwnikami",
                     :way_it_works => "przeciwnicy walczący w przewadze liczebnej z postacią posiadającą tą umiejętność, zmniejszają premie do Trafienia wynikającą ze swej ilości o 5pkt. Ponadto Fechtunek w Obronie (FwO) bohatera podnoszony jest o +1pkt.
Umiejętność Pasywna" )


skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "22" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Refleks" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Fechtunek w Obronie")

skill = Skill.create(:profession_type => "soldier",
                     :name => "Zaawansowany Tarczownik",
          :limitations => "z tej zdolności nie można korzystać jeżdżąc konno.",
                     :way_it_works => "Obrona tarczy podnoszona jest o +6pkt, kosztem zmniejszenia Trafienia o -2pkt. Korzystając z tej umiejętności Obrona Dystansowa postaci podnoszona jest o dodatkowe +4pkt (czyli łącznie o +10pkt).
" )

skill.skill_requirements.create(:check_applies_to => "experience", :value => "3")
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Tarczownik" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 6, :group_name => "Obrona Tarczy")
s_choice.stats_modifiers.create(:modifies => "fighting", :value => -2, :group_name => "Trafienie")




