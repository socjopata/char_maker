
# -*- encoding : utf-8 -*-



skill = Skill.create(:profession_type => "brutal",
                     :name => "Ciężkozbrojny",
                     :way_it_works => "wszystkie ograniczenia wynikające z noszenia średnich i ciężkich Zbroi oraz Pancerzy oraz używania tarcz zmniejszane są o 5pkt, np.: Kirys Płytowy Miarowy -7/12 prezentuje się w następujący sposób: -2/ 17.
Siła i Wytrzymałość bohatera zwiększane są o +1pkt.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "28" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "domyślne")
#TODO wszystkie ograniczenia wynikające z noszenia średnich i ciężkich Zbroi oraz Pancerzy oraz używania tarcz zmniejszane są o 5pkt,


skill = Skill.create(:profession_type => "brutal",
                     :name => "Cios Śmierci",
                     :limitations => "broń Ciężka",
                     :way_it_works => "po wyuczeniu się tej umiejętności, Bohater korzystając ze zdolności „Potężny Cios” nie otrzymuje kary do Trafienia i Obrony. Dodatkowo raz na starcie/walkę może zwiększyć swoje Trafienie o +5pkt. Tak wyprowadzony cios, jeżeli trafi przeciwnika, traktowany jest jako Trafienie Krytyczne.
Siła bohatera wzrasta o +1pkt." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "32" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Potężny Cios" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "5" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne")


skill = Skill.create(:profession_type => "brutal",
                     :name => "Miażdżący Atak",
                     :limitations => "broń Ciężka",
                     :way_it_works => "raz na rundę po tym jak bohater trafił swego przeciwnika wykorzystując umiejętność „Potężny Cios”, zyskuje jeden dodatkowy atak z Tempem równym 5pkt i karą -5pkt do Trafienia.
Umiejętność Pasywna" )


skill.skill_requirements.create(:check_applies_to => "skill", :name => "Potężny Cios" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Młynek" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "30" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "4" )

skill = Skill.create(:profession_type => "brutal",
                     :name => "Postawa Kalmora",
                     :way_it_works => "za każdym razem kiedy przeciwnik zwiększa swoją Obronę kosztem Trafienia lub rezygnacji z ataków, bohater otrzymuje +5pkt do Trafienia. Premia ta utrzymuje się dopóki wróg walczy defensywnie.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Natarcie i Powstrzymanie" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "23" )

skill = Skill.create(:profession_type => "brutal",
                     :name => "Silny Cios",
                     :way_it_works => "za każdym razem kiedy przeciwnik zwiększa swoją Obronę kosztem Trafienia lub rezygnacji z ataków, bohater otrzymuje +5pkt do Trafienia. Premia ta utrzymuje się dopóki wróg walczy defensywnie.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "27" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "3" )

skill = Skill.create(:profession_type => "brutal",
                     :name => "Powalenie",
                     :limitations => "używając Toporów lub broni Obuchowej Klasycznej",
                     :way_it_works => "polega na zadaniu potężnego ciosu tak aby ofiara straciła równowagę. Trafienie zmniejszone o -3pkt, natomiast Tempo broni rośnie o +3pkt. Każdy Trafiony cios zmusza ofiarę do wykonania udanego, Łatwego testu Zręczności aktualnej (+5pkt) lub powala ją na podłoże. Trafiony cios zadaje standardowe Obrażenia.
	Jeżeli postać posiada umiejętność „Szarża”, może spróbować powalić przeciwnika na ziemie z rozbiegu, otrzymuje wtedy dodatkowe +2pkt do Trafienia.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "22" )

skill = Skill.create(:profession_type => "brutal",
                     :name => "Silny Cios",
                     :limitations => "używając Toporów lub broni Obuchowej Klasycznej",
                     :way_it_works => "postać zwiększa zadawane Obrażenia o +3pkt. Dotyczy walki wręcz (zarówno bronią białą np.: mieczem jak i podczas bijatyki).
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "20" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 3, :group_name => "Melee Damage")

skill = Skill.create(:profession_type => "brutal",
                     :name => "Starcie",
                     :limitations => "Tylko dla broni Typowej, Ciężkiej lub Dwuręcznej.",
                     :way_it_works => "kosztem rezygnacji z wszystkich ataków w tej rundzie postać próbuje wytrącić przeciwnika z równowagi. Bohater wykonuje przeciwstawny test Siły (natychmiast po zadeklarowaniu umiejętności) ze swym przeciwnikiem, jeżeli wygra wróg otrzymuje -3pkt do Trafienia i Obrony do końca następnej rundy.
Siła postaci wzrasta o +1pkt. Uwaga: Jeżeli dwie postacie zadeklarowały przeciw sobie „Starcie”, MG wykonuje tylko jeden test nakładający na przegranego odpowiednie Kary." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "23" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "brutal",
                     :name => "Szarża",
                     :limitations => "Tylko dla broni Typowej, Ciężkiej lub Dwuręcznej.",
                     :way_it_works => "w chwili deklaracji tej umiejętności postać musi być oddalona od swego przeciwnika o minimum pięć metrów (musi nabrać rozpędu). Bohater otrzymuje +4pkt do Trafienia i Obrażeń oraz -4pkt do Obrony. Premie dodawane są tylko do pierwszego ataku, natomiast kara utrzymuje się do końca tej rundy.
Parametr Bieg podnoszony jest o +2pkt.
Umiejętność Pasywna" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 2, :group_name => "Bieg")



skill = Skill.create(:profession_type => "brutal",
                     :name => "Twardy Skurwysyn",

                     :way_it_works => "postać zwiększa PŻ o +5pkt, ponadto za każdym razem kiedy przeciwnik będzie próbował ją Powalić podnosi swoją szansę w teście o +5pkt.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "20" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WT", :value => "20" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Punkty Życia")  #TODO unify the name

skill = Skill.create(:profession_type => "brutal",
                     :name => "Weteran",

                     :way_it_works => "Odporność na Strach i Ból Postaci wzrasta o +5pkt. Ponadto pierwszy trafiony w nią cios zadaje jej zawsze minimalne możliwe Obrażenia (rzut przyjmuje wartość 1pkt).
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "experience", :value => "3" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Strach")  #TODO unify the name
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Ból")  #TODO unify the name

skill = Skill.create(:profession_type => "brutal",
                     :name => "Zaawansowane Powalenie",
                     :limitations => "używając Toporów lub broni Obuchowej Klasycznej",
                     :way_it_works => "Tempo ataku zwiększone jest o +2pkt, a Trafienie spada o -2pkt. Jeżeli cios trafi, ofiara musi wykonać udany rzut na swą Zręczność aktualną lub zostaje przewrócona na ziemię. Atak zadaje normalne Obrażenia.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "26" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Powalenie" )

skill = Skill.create(:profession_type => "brutal",
                     :name => "Zaawansowane Starcie",
                     :limitations => "tylko dla broni Typowej, Ciężkiej lub Dwuręcznej",
                     :way_it_works => "skorzystanie z umiejętności „Starcie” nie odbiera ataków, a zwycięstwo w teście zwiększa zadawane w tej rundzie Obrażenia o +3pkt. Zarówno podstawowa jak i zaawansowana wersja Starcia są od teraz Umiejętnościami Pasywnymi.
Siła postaci wzrasta o +1pkt." )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Starcie" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "25" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "brutal",
                     :name => "Zaawansowana Szarża",
                     :limitations => "tylko dla broni Typowej, Ciężkiej lub Dwuręcznej",
                     :way_it_works => "za każdym razem kiedy postać szarżuje na wroga otrzymuje +5pkt do Trafienia i zadawanych Obrażeń oraz -5pkt do Obrony. Premia i kara dotyczy wszystkich ataków wyprowadzonych w tej rundzie.
Parametr Bieg podnoszony jest o +3pkt.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Szarża" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Bieg")







#s_choice = skill.stats_choices.create
#
#s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
#s_choice.stats_modifiers.create(:modifies => "fighting", :value => 3, :group_name => "Obrona Daleka")
#s_choice.stats_modifiers.create(:modifies => "fighting", :value => 3, :group_name => "Zmiana Zasięgu")
#
#skill.skill_requirements.create(:check_applies_to => "skill", :name => "Podstawy Akrobatyki" )
#skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )
#
##skill
##statistics
##socialclass

