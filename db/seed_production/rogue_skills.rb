# -*- encoding : utf-8 -*-
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

skill = Skill.create(:profession_type => "rogue",
                     :name => "Kocia Zwinność",
                     :way_it_works => "wszystkie ograniczenia wynikające z noszenia Lekkich i Typowych zbroi oraz używania tarcz zmniejszane są o 5pkt, np.: Kaftan Kolczy posiadający następujące kary i restrykcje -5 / 26 noszony przez postać z Kocią Zwinnością wygląda następująco: - / 31.
Zręczność bohatera podnoszona jest o +2pkt.
Umiejętność Pasywna")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "18" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "4")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "Armor penatly", :value => 5, :group_name => "Lekki, Typowy, Tarcza")   #TODO ...

skill = Skill.create(:profession_type => "rogue",
                     :name => "Kradzież Kieszonkowa i Otwieranie Zamków",
                     :description => "postać potrafi w wyjątkowo skuteczny sposób pozbawiać ludzi naddatku pieniędzy lub innych cennych przedmiotów, które ktoś nieopatrznie miał przy sobie. Ponadto bohater nauczył się otwierać zamki, kłódki, szafki, drzwi, itp., mechanizmy za pomocą kompletu wytrychów, noża i innych pomocnych narzędzi..",
                     :way_it_works => "każda próba kradzieży musi być dokładnie opisana przez MG aby gracz wiedział kogo próbuje pozbawić majątku i jakie potencjalne ryzyko związane jest z taką akcją. Obydwie części tej zdolności sprawdzane są za pomocą testu Zręczności zwiększonego o premię z Inteligencji postaci oraz zmniejszone o modyfikator przyznany przez MG. Postać posiadająca „Krycie się  i Cichy Chód” otrzymuje premię do testu kradzieży kieszonkowej +5pkt.
Inteligencja Postaci wzrasta o +1pkt.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "20" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "rogue",
                     :name => "Krwawe Ostrze",
                     :limitations => "broń Lekka i Typowa",
                     :way_it_works => "każdy trafiony cios, który zadał przeciwnikowi chociaż jedną ranę wywołuje Krwawienie. Od tego momentu ofiara traci 1PŻ na końcu każdej rundy (spowodowane jest to krwawieniem z wrażliwego miejsca; szyi, przegubu ręki, pachwiny, itp.). Tak wywołany Krwotok utrzymuje się przez 1rundę/poziom łotra i może się kumulować.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "30" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "20" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "3")

skill = Skill.create(:profession_type => "rogue",
                     :name => "Krycie się i Cichy Chód",
                     :way_it_works => "postać porusza się w wyjątkowo cichy i bezszelestny sposób. Ponadto jeżeli istnieje taka potrzeba wie jak wykorzystać otoczenie aby stać się niewidzialnym dla swej ofiary. Oznacza to, że osoby, na które łotr czatuje, otrzymują dodatkową karę równą premii ze Zręczności postaci. Analogiczna kara przyznawana jest do testu Spostrzegawczości ofiary podczas skradania się.
Bohater zwiększa parametr Bieg i Spostrzegawczość o +1pkt.
Umiejętność Pasywna.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Spostrzegawczość")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Bieg")

skill = Skill.create(:profession_type => "rogue",
                     :name => "Natarcie i Powstrzymanie",
                     :way_it_works => "postać może wykonać jedną z dwóch następujących akcji:
- zwiększyć Trafienie o +5pkt kosztem utraty -5pkt Obrony lub
- zwiększyć o +5pkt Obronę zmniejszając swe Trafienie o +5pkt.
" )

skill.skill_requirements.create(:check_applies_to => "experience", :value => "3" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Atak i Obrona" )

skill = Skill.create(:profession_type => "rogue",
                     :name => "Niespodziewany Atak",
                     :limitations => "tylko dla broni Lekkiej lub Typowej",
                     :way_it_works => "postać może przemieścić się wykorzystując Parametr Pomocniczy: „Sprint” i wykonać jeden atak." )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Błyskawiczny Atak" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "30" )

skill = Skill.create(:profession_type => "rogue",
                     :name => "Prześlizgnięcie",
                     :limitations => "tylko dla broni Lekkiej lub Typowej",
                     :way_it_works => "parametr „Zmiana Zasięgu” wzrasta o +5pkt, ponadto podczas testów Zręczności wykonywanych przy; zaskoczeniu, unikaniu pułapki, itp. bohater otrzymuje dodatkowe +5pkt.
Zręczność postaci wzrasta o +1pkt." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "21" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 5, :group_name => "Zmiana zasięgu")

skill = Skill.create(:profession_type => "rogue",
                     :name => "Szarlataneria",
                     :way_it_works => "po wykonaniu udanego rzutu na Ogładę odpowiednio zmodyfikowaną przez MG, postać może nakłonić grupę ludzi (lub pojedynczą osobę) do zakupu, ewentualnie sprzedaży danej rzeczy. Odpowiednie kierowanie tą umiejętnością może doprowadzić do przekonania ludzi do własnych przekonań (jest to zdecydowanie trudniejsze dlatego MG musi stosować odpowiednie kary).
Postać zyskuje +2pkt do Ogłady oraz +1pkt do Inteligencji i Spostrzegawczości." )


skill.skill_requirements.create(:check_applies_to => "skill", :name => "Szulerka" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "20" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "O", :value => "20" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Spostrzegawczość")

skill = Skill.create(:profession_type => "rogue",
                     :name => "Ucieczka i Wyzwalanie się z Więzów",
                     :way_it_works => "po wykonaniu udanego rzutu na Ogładę odpowiednio zmodyfikowaną przez MG, postać może nakłonić grupę ludzi (lub pojedynczą osobę) do zakupu, ewentualnie sprzedaży danej rzeczy. Odpowiednie kierowanie tą umiejętnością może doprowadzić do przekonania ludzi do własnych przekonań (jest to zdecydowanie trudniejsze dlatego MG musi stosować odpowiednie kary).
Postać zyskuje +2pkt do Ogłady oraz +1pkt do Inteligencji i Spostrzegawczości." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "20" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 4, :group_name => "Bieg")

skill = Skill.create(:profession_type => "rogue",
                     :name => "Uderzenie Kastora",
                     :way_it_works => "umiejętność działa przez jedną rundę za każdy punkt premii z Wiary i może być użyta raz na starcie/walkę. Kiedy zdolność jest aktywna, w każdej rundzie bohater może przerzucić jeden nietrafiony atak.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WI", :value => "22" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Refleks" )

skill = Skill.create(:profession_type => "rogue",
                     :name => "Ulubiona Broń",
                     :way_it_works => "wybrana przez postać broń (np.: espadon, kukri, nadziak, itd.) ma zwiększone parametry Ataku i Obrony o +1pkt, a jej Tempo obniżone jest o -1pkt (do minimum 1pkt). Umiejętność dotyczy jednej, konkretnej broni, a nie całej grupy.
Umiejętność Pasywna" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Wybrana broń, Atak+1, Obrona+1, Tempo-1")  #This "DSL" can be improved


skill = Skill.create(:profession_type => "rogue",
                     :name => "Walka w Trudnych Warunkach",
                     :way_it_works => "postaci w mniejszym stopniu przeszkadza padający deszcz, rozmokły grunt i inne warunki utrudniające walkę (tłok, małe pomieszczenie,  itp.). Dzięki czemu nie otrzymuje standardowej kary za ww. utrudnienia (w szczególnych przypadkach np.: walka na bagnach MG przyznaje tylko połowę stosownej kary). Zręczność postaci podnoszona jest o +1pkt.
Umiejętność Pasywna" )


s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 4, :group_name => "Zmiana Zasięgu")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")


skill = Skill.create(:profession_type => "rogue",
                     :name => "Walka z Wieloma Przeciwnikami",
                     :way_it_works => "przeciwnicy walczący w przewadze liczebnej z postacią posiadającą tą umiejętność, zmniejszają premie do Trafienia wynikającą ze swej ilości o 5pkt. Ponadto Fechtunek w Obronie (FwO) bohatera podnoszony jest o +1pkt.
Umiejętność Pasywna" )


skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "22" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Refleks" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Fechtunek w Obronie")

skill = Skill.create(:profession_type => "rogue",
                     :name => "Zakładanie i Likwidowanie Pułapek",
                    :limitations => "Otwieranie zamków, odpowiednie materiały i warunki – decyzja MG",
                     :way_it_works => "po wstępnym ustaleniu działania i umiejscowienia pułapki gracz wykonuje test Inteligencji obłożony karą przyznaną przez Mg (w zależności od komplikacji projektu). Czas potrzebny na skonstruowanie pułapki, jakość i dostępność materiałów potrzebnych przy budowie jak i całość projektu ustala MG. Ponadto likwidowanie pułapek sprawdzane jest rzutem na Zręczność postaci zwiększoną o premię z jej Inteligencji oraz zmniejszoną o karę za jakość lub komplikację pułapki.
Postać zyskuje +1pkt do Zręczności i Spostrzegawczości." )



skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "18" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "18" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Kradzież Kieszonkowa i Otwieranie Zamków" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Spostrzegawczość")

skill = Skill.create(:profession_type => "rogue",
                     :name => "Znajomość Półświatka",
                    :description => "wiele lat spędzonych na ulicy, w barach i mrocznych spelunach zaowocowało szerokimi znajomościami, wiedzą i szemranymi układami z marginesem społecznym. ",
                     :way_it_works => "umiejętność dotyczy wybranego regionu, prowincji bądź małego kraju, decyzja MG. Ponadto postać łatwo nawiązuje kontakty z szemranymi typami, wie gdzie i o co pytać, zwłaszcza jeżeli dotyczy to niezbyt legalnych interesów.
Inteligencja bohatera wzrasta o +1pkt.Umiejętność Pasywna." )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")

