## -*- encoding : utf-8 -*-
#

skill = Skill.create(:profession_type => "rogue",
                     :name => "Atak i Obrona",
                     :way_it_works => "postać może wykonać jedną z dwóch następujących akcji:
- zwiększyć Trafienie o +3pkt kosztem utraty 3pkt Obrony lub
- zwiększyć o +3pkt Obronę zmniejszając swe Trafienie o 3pkt." )

skill = Skill.create(:profession_type => "rogue",
                     :name => "Blef",
                     :way_it_works => "za każdym razem kiedy postać chce kogoś oszukać, naciągnąć lub jest przesłuchiwana zyskuje +5pkt do odpowiedniego testu (Zręczności, Ogłady lub Inteligencji): np.: korzystając z Szulerki, Negocjacji, Zmyłki, itp. decyzja MG.
#Inteligencja i Ogłada łotra zwiększany jest o +1pkt." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "14" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")


skill = Skill.create(:profession_type => "rogue",
                     :name => "Błyskawiczny Atak",
                     :way_it_works => "postać sprawdzając swą Inicjatywę może wykonać dwa rzuty k10 i wybrać wyższy wynik. Ponadto jej Inicjatywa zwiększona jest o +1pkt.
Umiejętność Pasywna" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")

skill = Skill.create(:profession_type => "rogue",
                     :name => "Charakteryzacja",
                     :way_it_works => "postać może zmienić wygląd tak aby pozostać nie rozpoznanym. MG wykonuje rzut k30, którego wynik  zwiększa o dwukrotną wartość premii z Inteligencji i Zręczności oraz o 2pkt/poziom postaci. Za każde 2pkt osiągnięte powyżej 20-stu istota, która miała zostać zmylona lub oszukana (lub zwykły przechodzień, itp.) otrzymuje karę -1pkt do Spostrzegawczości. Wyrzucenie „Trzydziestki” oznacza automatyczny sukces, dzięki, któremu postać może zostać rozpoznana tylko i wyłącznie przy wyrzuceniu przez osobę postronną automatycznego sukcesu. Ucharakteryzowanie się w celu podszycia się pod konkretną postać jest niezmiernie trudne. O tym czy w ogóle istnieje taka możliwość decyduje MG i ustala odpowiedni poziom trudności.
Spostrzegawczość i Zręczność bohatera zwiększane są o +1pkt." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "19" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Spostrzegawczość")

skill = Skill.create(:profession_type => "rogue",
                     :name => "Cios w Odkryte",
                      :limitations => "tylko dla broni zadającej obrażenia kłute",
                     :way_it_works => "Trafiony przeciwnik zmniejsza wartość swego pancerza lub zbroi o -5pkt. Jeżeli w wyniku tego ataku wróg stracił chociaż 1PŻ, otrzymuje karę do Obrony do końca następnej rundy w wysokości -5pkt. Umiejętność nie może być łączona ze zdolnością „Celny Cios”." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )

skill = Skill.create(:profession_type => "rogue",
                     :name => "Fałszerstwo",
                      :limitations => "odpowiednie materiał i przyrządy – decyzja MG",
                     :way_it_works => "postać wykonuje test Inteligencji z karą ustaloną przez MG. Sukces oznacza umiejętne podrobienie wybranej rzeczy co może zostać wykryte tylko jeżeli ofiara wykona udany test Spostrzegawczości zmniejszonej o 15pkt. Nieudany rzut oznacza mizerną kopię, którą ofiara oszustwa można rozpoznać po wykonaniu udanego rzutu na swą Spostrzegawczość. Koszt i czas potrzebny na wytworzenie falsyfikatu zawsze określa MG. Postać wykonuje tylko jeden test sprawdzający jakość podróbki. Jeżeli będzie niekorzystny wszystkie kolejne próby skazane są na niepowodzenie, chyba, że fałszerz poznał nowe technik lub otrzymał dostęp do doskonalszych narzędzi.
Spostrzegawczość postaci wzrasta o +2pkt, a jej Inteligencja o +1pkt.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "18" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "21" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Czytanie i Pisanie" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 2, :group_name => "Spostrzegawczość")

