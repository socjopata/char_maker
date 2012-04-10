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
#TODO  check Armor penatly

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
                     :name => "Potężny Cios",
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
s_choice.stats_modifiers.create(:modifies => "melee_damage", :value => 3, :group_name => "All")

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
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Punkty Życia")

skill = Skill.create(:profession_type => "brutal",
                     :name => "Weteran",
                     :way_it_works => "Odporność na Strach i Ból Postaci wzrasta o +5pkt. Ponadto pierwszy trafiony w nią cios zadaje jej zawsze minimalne możliwe Obrażenia (rzut przyjmuje wartość 1pkt).
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "experience", :value => "3" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Strach")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Ból")

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


## FINESSE

skill = Skill.create(:profession_type => "finesse",
                     :name => "Celny Cios",
                     :limitations => "tylko dla finezyjnego stylu walki",
                     :way_it_works => "kosztem zwiększenia Tempa broni o +5pkt, trafiony atak obniża parametr ochronny zbroi o jeden za każdy punkt, o który przewyższył Obronę przeciwnika (np.: przy przekroczeniu Obrony o 4pkt, pancerz redukowany jest o 4pkt). Umiejętność nie może być wykorzystana w walce dystansowej.
Umiejętności Pasywna." )


skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "20" )

skill = Skill.create(:profession_type => "finesse",
                     :name => "Finezyjny Atak",
                     :limitations => "tylko przy użyciu selektywnego ciosu",
                     :way_it_works => "przeciwnik, który został trafiony i zraniony w Głowę (w wyniku tego Ataku) musi wykonać udany test Bólu z karą -10pkt. Niepowodzenie oznacza utratę następnego ataku oraz karę -5pkt do Trafienia i Obrony na czas tego starcia (ew. do czasu kiedy wyleczy lub chociażby opatrzy rany). Efekt ten może się kumulować. Kara za celowanie w Głowę zmniejszana jest dodatkowo o 2pkt.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Precyzyjny Cios" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )

skill = Skill.create(:profession_type => "finesse",
                     :name => "Finta",
                     :limitations => "zdolność może być wykorzystana tylko podczas walki z pieszym przeciwnikiem o ludzkich gabarytach.",
                     :way_it_works => "wybrany atak, w walce wręcz, nie trafia bohatera. Umiejętność musi zostać zadeklarowana przed sprawdzeniem Trafienia przeciwnika.
Umiejętność Pasywna" )


#TODO implement the check
skill.skill_requirements.create(:check_applies_to => "fighting", :name => "Fechtunek w Obronie", :value => "25" )

skill = Skill.create(:profession_type => "finesse",
                     :name => "Kontratak",
                     :limitations => "tylko przy użyciu broni Typowej",
                     :way_it_works => "po udanym wykorzystaniu umiejętności „Parada” w następnym, jednym ataku wyprowadzonym w postać przeciwko, której wykorzystano paradę bohater otrzymuje +5pkt do Trafienia.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Parada" )

skill = Skill.create(:profession_type => "finesse",
                     :name => "Mistrzowski Kontratak",
                     :limitations => "tylko przy użyciu broni Typowej",
                     :way_it_works => "po udanym wykorzystaniu umiejętności „Parada”, postać otrzymuje jeden natychmiastowy atak, który może być wyprowadzony w postać przeciwko, której wykorzystano paradę.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Refleks" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Kontratak" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "30" )

skill = Skill.create(:profession_type => "finesse",
                     :name => "Najszybszy Wygrywa",
                     :limitations => "zdolność może zostać wykonana tylko w pierwszej rundzie walki i tylko jeżeli bohater okazał się szybszy od swego przeciwnika (osiągnął wyższy wynik podczas rzutu na Inicjatywę).",
                     :way_it_works => "postać otrzymuje jeden, dodatkowy, natychmiastowy atak, którego Trafienie i zadawane Obrażenia zwiększane są o +5pkt.
Inicjatywa i Spostrzegawczość bohatera podnoszone są o +1pkt.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "auxiliary", :name => "Inicjatywa", :value => "25" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Spostrzegawczość")


skill = Skill.create(:profession_type => "finesse",
                     :name => "Nieczysta Zagrywka",
                     :limitations => "zdolność może zostać wykonana tylko w pierwszej rundzie walki i tylko jeżeli bohater okazał się szybszy od swego przeciwnika (osiągnął wyższy wynik podczas rzutu na Inicjatywę).",
                     :way_it_works => "przeciwnik wykonuje test Spostrzegawczości z karą -5pkt. Niepowodzenie oznacza zmniejszenie jego Obrony o podwójną premię z Inteligencji postaci, która wykorzystała Nieczystą Zagrywkę. Kara ta utrzymuje się do końca następnej rundy. Sukces ofiary oznacza karę -3pkt do Trafienia na okres tej rundy. Jeżeli postać posiada umiejętność: Finezyjny Atak, Blef i/lub Oburęczność przeciwnik otrzymuje dodatkową karę do testu w wysokości -3pkt, -6pkt jeżeli posiada obie lub -9pkt jeżeli poznała je wszystkie.
Przeciwnik, który zdał test Spostrzegawczości, nie może zostać drugi raz zaatakowany za pomocą tej umiejętności (poznał sztuczkę i wie jak się przed nią obronić)." )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Zmyłka" )

skill = Skill.create(:profession_type => "finesse",
                     :name => "Parada",
                     :limitations => "tylko przy użyciu broni Typowej lub lekkiej.",
                     :way_it_works => "w zamian za poświęcenie wszystkich ataków, w odpowiedzi na pierwszy cios przeciwnika, postać może wykonać przeciwstawny test Trafienia z wrogiem. Jeżeli bohater odniósł w nim sukces atak jest automatycznie nietrafiony, a jego przeciwnik traci wszystkie pozostałe w tej rundzie ataki. Parady nie można wykonać bronią improwizowaną. Ponadto każda inna broń lekka użyta do Parady otrzymuje następujące kary do testu: w przypadku walki z przeciwnikiem posiadającym broń typową -5pkt, a w przypadku broni ciężkiej, dwuręcznej lub drzewcowej -10pkt. Kiedy parada wykonywana jest bronią typową przeciwko broni ciężkiej, dwuręcznej lub drzewcowej postać otrzymuje karę -5pkt. " )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Zmyłka" )

skill = Skill.create(:profession_type => "finesse",
                     :name => "Precyzyjny Cios",
                     :limitations => "tylko przy użyciu selektywnego ciosu",
                     :way_it_works => "kara za celowanie w głowę lub inną kończynę zmniejszana jest o 1pkt/poziom postaci.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Celny cios" )

skill = Skill.create(:profession_type => "finesse",
                     :name => "Responsa",
                     :way_it_works => "raz na rundę po tym jak przeciwnik nie trafił w walce wręcz, bohater otrzymuje jeden dodatkowy, natychmiastowy atak, wyprowadzany zaraz po ciosie wroga z karą -5pkt do Trafienia.
Umiejętność Pasywna." )


skill.skill_requirements.create(:check_applies_to => "skill", :name => "Natarcie i Powstrzymanie" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Refleks" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Finezyjny Atak" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "30" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "19" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "5" )

skill = Skill.create(:profession_type => "finesse",
                     :name => "Riposta",
                     :limitations => "tylko dla broni Typowej",
                     :way_it_works => "raz na rundę po tym jak przeciwnik nie trafił w walce wręcz, bohater otrzymuje jeden dodatkowy, natychmiastowy atak, wyprowadzany zaraz po ciosie wroga z karą -5pkt do Trafienia.
Umiejętność Pasywna." )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Błyskawiczny Atak" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Zmyłka" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )

skill = Skill.create(:profession_type => "finesse",
                     :name => "Technika Defensywna",
                     :way_it_works => "bohater podnosi w wybranej grupie broni swój Fechtunek w Obronie (FwO) o +2pkt.
Umiejętność Pasywna." )

#TODO check it
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 2, :group_name => "Fechtunek w Obronie")

skill = Skill.create(:profession_type => "finesse",
                     :name => "Technika Ofensywna",
                     :way_it_works => "postać zwiększa w wybranej grupie broni swój Fechtunek w Ataku (FwA) o +2pkt.
Umiejętność Pasywna." )


s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 2, :group_name => "Fechtunek w Ataku")

skill = Skill.create(:profession_type => "finesse",
                     :name => "Zmyłka",
                     :way_it_works => "przeciwnik wykonuje test Spostrzegawczości, nieudany zmniejsza jego Obronę o dwukrotną wartość premii z Inteligencji postaci. Jeżeli ofiara obroni się przed tą umiejętnością wszystkie ataki, które postać wykona w tej rundzie otrzymują karę -3pkt do Trafienia. Jeżeli postać posiada umiejętność: Finezyjny Atak, Blef i/lub Oburęczność przeciwnik otrzymuje karę do testu w wysokości -3pkt, -6pkt jeżeli posiada obie lub  -9pkt jeżeli poznała je wszystkie.
    " )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "18" )




