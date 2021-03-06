# -*- encoding : utf-8 -*-

skill = Skill.create(:profession_type => "default",
                     :name => "Akrobatyka",
                      :limitations => "aby korzystać z tej zdolności postać nie może mieć mniej niż 20pkt aktualnej Zręczności",
                     :way_it_works => "Wszystkie testy Zręczności jakie wykona postać mają zmniejszony poziom trudności dzięki czemu adekwatna kara redukowana jest o -10pkt, np.: bohater pędzi po dachach budynków i decyduje się na odległy skok do jednego z okien kamienicy. MG wykonuje test z modyfikatorem -15pkt, dzięki Akrobatyce kara ta zmniejszana jest tylko do -5pkt.
Zręczność postaci podnoszona jest o +1pkt, a Obrona Daleka jak i Zmiana Zasięgu wzrastają o +3pkt.
Umiejętność Pasywna
Dodatkowo, podczas walki bohater może zrezygnować z jednego ataku dzięki czemu zwiększa swoją Obronę o +5pkt (akcja ta nie jest Umiejętnością Pasywną).")

s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 3, :group_name => "Obrona Daleka")
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 3, :group_name => "Zmiana Zasięgu")

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Podstawy Akrobatyki" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )


skill = Skill.create(:profession_type => "default", :name => "Czytanie i Pisanie", :way_it_works => "umiejętność czytania i pisania w wybranym języku (najczęściej będzie to język ojczysty postaci), w niektórych przypadkach MG może nie zgodzić się na wyuczenie danego języka z powodu braku odpowiedniego nauczyciela, np.: postać chce poznać język z odległych archipelagów czy zakazany dialekt demonów.
" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "14" )


skill = Skill.create(:profession_type => "default", :name => "Dworskość", :description => "jest to zbiór umiejętności potrzebnych każdej kulturalnej osobie, zwłaszcza o pochodzeniu szlacheckim, która w elitarnym towarzystwie nie chce wyjść na totalnego ignoranta i chama. Umożliwia nie tylko odpowiednie zachowanie w towarzystwie, przy stole, na balach i innych spotkaniach ale również pozwala kulturalnie zabawić damę.",
 :way_it_works => "Postać zna najmodniejsze tańce oraz potrafi grać na wybranym przez siebie instrumencie. Ponadto zwiększa swoją Ogładę o +2pkt, a brak posiadania tej umiejętności, w niektórych przypadkach może zamknąć przed postacią wiele drzwi, zwłaszcza tych prowadzących do szlachetnie urodzonych." )

s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "O", :value => "14" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "14" )


skill = Skill.create(:profession_type => "default", :name => "Dykcja i Przemawianie", :way_it_works => "Podczas rozmowy, handlowania, wygłaszania mów, itp. działaniach postać zwiększa swą szansę w teście Ogłady o premię z Inteligencji. Ponadto Ogłada bohatera zwiększana jest o +2pkt.",
 :description => "Postać nabyła umiejętność pięknego, płynnego wysławiania się, odpowiednio dobiera ton i styl prowadzenia rozmowy.")

s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "O", :value => "15" )

skill = Skill.create(:profession_type => "default", :name => "Handel", :way_it_works => "Po udanym rzucie na Ogładę bohater może zmodyfikować cenę o +/-10%. Jeżeli chce jeszcze bardziej zaniżyć lub zawyżyć wartość przedmiotu bądź usługi, za każde następne 5% ceny postać otrzymuje karę -2pkt do rzutu. Bohater posiadający przynajmniej dwadzieścia punktów Ogłady może wykonać dwa rzuty i wybrać korzystniejszy wynik. Inteligencja postaci podnoszona jest o +1pkt.",
 :description => "Po udanym rzucie na Ogładę bohater może zmodyfikować cenę o +/-10%. Jeżeli chce jeszcze bardziej zaniżyć lub zawyżyć wartość przedmiotu bądź usługi, za każde następne 5% ceny postać otrzymuje karę -2pkt do rzutu. Postać posiadająca przynajmniej 20pkt Ogłady może wykonać dwa rzuty i wybrać korzystniejszy wynik. Startowy majątek postaci zwiększany jest o 100sztuk złota, a jej Inteligencja podnoszona jest o +1pkt.
Umiejętność Pasywna.")
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "money", :value => 10000, :group_name => "domyślne")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "17" )



skill = Skill.create(:profession_type => "default", :name => "Heraldyka i Historia", :way_it_works => "Udany test na Inteligencje pozwala określić historie kryjącą się za danym herbem lub rodem szlacheckim, przypomnieć minione wydarzenia i losy zapisane w starożytnych księgach. Ponadto postać zwiększa swoją Inteligencję o +1pkt.",
 :description => "jest to znajomość rodów szlacheckich, hierarchii w danym państwie, księstwie (linii królewskiej, ważnych osobistości) bądź ziemiach. Postać zgłębiła ogólną historię świata, działań wojennych, poznała najznamienitszych dowódców oraz zapoznała się z podstawową wiedzą dotyczącą podłoża wojen religijnych i innych zbrojnych konfliktów.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")


skill = Skill.create(:profession_type => "default", :name => "Jeździectwo", :way_it_works => "umiejętność doskonałej jazdy konnej, umożliwia prowadzenie walki z konia bronią przeznaczoną do walki wręcz. Ponadto przy wszystkich testach sprawdzających utrzymanie się jeźdźca w siodle otrzymuje on +3pkt. Postać bez „Jeździectwa” walcząc z konia otrzymuje -5pkt do Trafienia i Obrony. Walka z konia może być prowadzona tylko przy użyciu broni jednoręcznej, kopii lub włóczni a przy woltyżerce także i z łuku bądź kuszy chociaż tej ostatniej właściwie nie da się napiąć (można tylko wystrzelić z załadowanej). Dzięki jeździectwu walcząc przeciw pieszemu wrogowi (samemu atakując z konia) postać otrzymuje +3pkt do Trafienia.")

skill = Skill.create(:profession_type => "default", :name => "Leczenie Ran i Chorób", :way_it_works => "w większości przypadków nie wykonuje się żadnego testu, natomiast w bardziej skomplikowanych sprawach MG powinien wykonać test odpowiednio zmodyfikowanej Inteligencji. Ponadto podczas poważnych zabiegów MG musi wykonać dodatkowy test Zręczności lekarza. Kilka słów o chorobach; najczęściej wymagane jest podanie odpowiednich leków, a sama wiedza i dobre chęci po prostu nie wystarczają. Inteligencja postaci wzrasta o +1pkt.",
 :description => "postać zgłębiła podstawy skomplikowanej wiedzy medycznej. Potrafi zaszyć ranę, nastawić skręcone kończyny, wie jakie lekarstwo należy podać, itd. Niestety wiedza ta jest raczej ogólna i w trudniejszych przypadkach tj.: otwarte złamanie, przebite organy wewnętrzne, itp. może liczyć jedynie na łut szczęścia.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")


skill = Skill.create(:profession_type => "default", :name => "Mistrzowska Oburęczność", :way_it_works => "walcząc oburącz postać nie otrzymuje kary -5pkt do Trafienia wykonując dodatkowy atak drugą bronią. Zręczność bohatera podnoszona jest o +1pkt.")
s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
skill.skill_requirements.create(:check_applies_to => "experience", :value => "3" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Oburęczność" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "15" )

skill = Skill.create(:profession_type => "default", :name => "Nauczyciel Fechtunku Wielu Broni", :way_it_works => "bohater zyskuje Jedną Biegłość w Broniach, dzięki czemu będzie mógł nauczyć się walczyć dodatkową grupą broni.")
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Biegłość w Grupie Broni")

skill = Skill.create(:profession_type => "default", :name => "Nauczyciel Fechtunku Jednej Broni", :way_it_works => "bohater zyskuje w wybranej Grupie Broni +1pkt Fechtunku (dzięki czemu zwiększa zarówno FwA jak i FwO). Dotyczy to każdej broni zarówno tej do walki wręcz jak i strzeleckiej.")
s_choice = skill.stats_choices.create
#s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Fechtunek w Grupie Broni")
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Wybrana grupa broni(), Atak+1, Obrona+1," )


skill = Skill.create(:profession_type => "default", :name => "Nieustraszony", :way_it_works => "postać zwiększa swoją Wiarę o +1pkt oraz Odporność na Strach o +5pkt. Jeżeli efekt magiczny skierowany w bohatera wywołuje Strach lub Przerażenie premia ta przyznawana jest również w przeciwstawnym teście Przełamania. Zdolność może być wybrana wielokrotnie, analogicznie podnosząc parametr główny jak i samą odporność.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Strach")


skill = Skill.create(:profession_type => "default", :name => "Niezłomność", :way_it_works => "kiedy Punkty Życia postaci spadną poniżej Jednego, bohater nadludzkim wysiłkiem woli może dalej walczyć, ruszać się, i podejmować inne normalne akcje. Dzieje się tak aż do momentu jego śmierci (która następuje kiedy PŻ spadną na -10pkt) lub do chwili gdy zdolność przestanie działać. Umiejętność utrzymuje się przez 3rundy/poziom postaci. Ponadto bohater zwiększa swoją Odporność na Strach i Ból oraz Punkty Życia o +3pkt.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Odporność na Strach")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Odporność na Ból")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Punkty Życia")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WI", :value => "17" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WT", :value => "25" )

skill = Skill.create(:profession_type => "default", :name => "Oburęczność", :way_it_works => "postać udoskonaliła technikę walki dwoma orężami, dzięki czemu zyskuje jeden atak z dodatkowej broni z karą do Trafienia -5pkt. Wyliczając swą Obronę korzysta z obu parametrów broni.")


skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "13" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "20" )

skill = Skill.create(:profession_type => "default", :name => "Odporność", :way_it_works => "postać może dwukrotnie więcej przebiec, przepłynąć, przejść marszem, itp. Dodatkowo dwukrotnie wolniej męczy się w walce a jej Odporność na Ból jak i „Punkty Życia” podnoszone są o +3pkt.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Odporność na Ból")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Punkty Życia")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WT", :value => "22" )



skill = Skill.create(:profession_type => "default", :name => "Pływanie i Nurkowanie", :way_it_works => "postać nauczyła się pływać i nurkować. Jakiekolwiek testy sprawdzające utrzymanie się jej na powierzchni wody, itp. wykonywane są tylko w wyjątkowo trudnych warunkach takich jak: sztorm, duże obciążenie (zbroja) lub poważne rany, testem na Siłę postaci. Postać zyskuje +1pkt do Wytrzymałości.")
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "domyślne")



skill = Skill.create(:profession_type => "default", :name => "Podstawy Akrobatyki", :way_it_works => "postać nabywa podstawowe umiejętności akrobaty takie jak: salto, gwiazda, sprężynka, itp. Dodatkowo może wyjątkowo sprawnie podnieść się z ziemi (np.: kiedy zostanie przewrócona podczas walki), zajmuje jej to tylko 5pkt Tempa zamiast całej rundy (oczywiście nadal musi wykonać normalny test na Zręczność aby powstać). Wszystkie testy sprawdzające Zręczność (nie dotyczy Inicjatywy ani Spostrzegawczości) wykonuje z modyfikatorem +4pkt a sam parametr główny podnoszony jest na stałe o +1pkt. Obrona Daleka oraz Zmiana Zasięgu zwiększone są o +2pkt.",
 :limitations => "aby korzystać z tej zdolności postać nie może mieć mniej niż 15pkt aktualnej Zręczności")

s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 2, :group_name => "Obrona Daleka")
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 2, :group_name => "Zmiana Zasięgu")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "17" )


skill = Skill.create(:profession_type => "default", :name => "Posłuch i Zastraszanie", :way_it_works => "Obie zdolności sprawdzane są rzutem na Ogładę, a modyfikator testu ustalany jest każdorazowo przez MG (przy Zastraszeniu gracz może zwiększyć swoją szansę o premię z Siły ale tylko jeżeli parametr przekroczył 25pkt). Bohater zyskuje +2pkt do Ogłady.",
 :description => "w zależności od potrzeby postać może próbować kogoś zastraszyć lub wzbudzić wśród słuchających posłuch. Zastraszać można dowolną osobę, a efekt uzyskujemy poprzez wywołanie lęku u „ofiary”. Natomiast Posłuch bazuje na szacunku i ewentualnej lojalności dlatego może być stosowany tylko wobec osób, które znają mówcę." )

s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")


skill = Skill.create(:profession_type => "default", :name => "Refleks", :way_it_works => "dobycie broni z pochwy lub pasa nie zabiera punktów Tempa (normalnie akcja ta kosztuje 1pkt Tempa), a Inicjatywa jak i Zręczność bohatera wzrastają o +1pkt.")

s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "15" )
skill = Skill.create(:profession_type => "default", :name => "Rzemiosło rozwijające siłę", :way_it_works => "postać wyuczyła się wybranego fachu lub rzemiosła. Po kilku latach praktyki, zebrała nieco oszczędności (5k20+100zł), a jej Siła lub Inteligencja podnoszone są o +1pkt. Gracz wraz z MG wybiera rodzaj zawodu jakim para się postać.")

s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "money", :value => 0, :group_name => "5k20g+10000")

skill = Skill.create(:profession_type => "default", :name => "Rzemiosło rozwijające intelekt", :way_it_works => "postać wyuczyła się wybranego fachu lub rzemiosła. Po kilku latach praktyki, zebrała nieco oszczędności (5k20+100zł), a jej Siła lub Inteligencja podnoszone są o +1pkt. Gracz wraz z MG wybiera rodzaj zawodu jakim para się postać.")

s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "money", :value => 0, :group_name => "5k20g+10000")


skill = Skill.create(:profession_type => "default", :name => "Sokoli Wzrok", :way_it_works => "Spostrzegawczość postaci zwiększana jest o +5pkt, ponadto może wykonać dwa rzuty sprawdzając ten parametr i wybrać korzystniejszy wynik.")
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Spostrzegawczość")


skill = Skill.create(:profession_type => "default", :name => "Szulerka", :way_it_works => "podczas dowolnej gry bohater może pomagać swemu szczęściu, dzięki czemu przysługują mu dwa rzuty sprawdzające wynik rozgrywki (wybiera korzystniejszy wynik). Aby sprawdzić jak poszła gra/oszustwo należy wykonać test Sprytu. Ponadto otrzymuje +5pkt przy wykrywaniu oszustwa posiadając umiejętność Spostrzegawczość oraz +5pkt przy oszukiwaniu jeżeli ma zdolność Refleks. Spryt postaci podnoszony jest o +2pkt.",
:description => "postać zna zasady większości gier hazardowych.")


s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "15" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "15" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "O", :value => "14" )


skill = Skill.create(:profession_type => "default", :name => "Śledzenie i Skradanie się", :way_it_works => "umiejętność pozwala śledzić ofiary tak aby pozostać niezauważonym. Sprawdzane jest to rzutem na Spostrzegawczość ofiary, zmniejszonym o premię z Inteligencji i Zręczności śledzącego. Rzut sprawdzający wykonujemy tylko w określonych przypadkach tj.: długi okres śledzenia, brak miejsca do ukrycia się, ofiara spodziewa się „ogona”, itp. Druga część umiejętności czyli Skradanie; umożliwia postaci bezszelestne poruszanie się. Sprawdzane jest to rzutem na jej Zręczność aktualną zmniejszoną o Spostrzegawczość ofiary oraz inne modyfikatory ustalone przez MG w zależności od sytuacji. Spostrzegawczość i Spryt postaci podnoszone są o +1pkt.",
 :description => "postać zna zasady większości gier hazardowych.")

s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 2, :group_name => "Spostrzegawczość")


skill = Skill.create(:profession_type => "default", :name => "Torturowanie", :way_it_works => "Aby sprawdzić jak skuteczne są „zabiegi” należy wykonać test Bólu ofiary z karą równą premii ze Zręczności kata. Sukces oznacza, że przesłuchiwana osoba może zachować milczenie i nie została złamana. Kolejna próba (czyli kolejne testy) może być wykonana dopiero następnego dnia ale każdy kolejny dzień tortur zwiększa karę o kolejne 2pkt. W zależności od tortur i ich nasileniach MG powinien o jakiś czas wykonać test Wytrzymałości ofiary. Niepowodzenie oznacza jej śmierć. Ponadto w przypadku stosowania ciężkich metod tj: obdzieranie ze skóry, łamanie kołem, itp. należy sprawdzić Zręczność kata standardowym testem. Niepowodzenie oznacza test na połowę Wytrzymałości ofiary lub jej natychmiastową śmierć. Odporność na Strach i Ból postaci (oprawcy) podnoszona jest o +2pkt.",
 :limitations => "tylko dla postaci o Złym charakterze", :description => "praca kata nie należy do najprzyjemniejszych, zarówno dla ofiary jak i oprawcy. Niestety nie dla wszystkich zadanie to jest tylko obowiązkiem, różni sadyści i zboczeńcy mogą czerpać z niej radość i przyjemność, jednakże tylko najbardziej opanowani i metodyczni fachowcy stają się rzeczywiście skuteczni. Postać wyuczona tego fachu, poznała liczne techniki zadawania bólu, wymuszania odpowiedzi i przyznawania się do winy. Jeżeli ma odpowiednią ilości czasu i specjalne przyrządy, chociaż one nie są aż tak niezbędne, może zmusić do współpracy właściwie każdego.")

s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Odporność na Strach")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Odporność na Ból")


skill = Skill.create(:profession_type => "default", :name => "Tropienie, Polowanie i Kamuflaż", :way_it_works => "W wyjątkowo trudnych bądź groźnych sytuacjach MG musi wykonać test Zręczności postaci, od którego zależy czy bohaterowi udało się np.: podkraść, czy wytropił jakąś rzadką zwierzynę, itp. Natomiast aby zauważyć postać posiadającą kamuflaż należy wykonać udany test Spostrzegawczości zmniejszonej o 5-20pkt decyzja MG. Spostrzegawczość postaci podnoszona jest o +3pkt.",
 :description => "jest to zbiór umiejętności, wiedzy oraz doświadczenia przydatnych każdemu myśliwemu. Postać potrafi tropić oraz polować na dzikie zwierzęta, zacierać za sobą ślady, dobierać odpowiedni kamuflaż potrzebny do pozostania niezauważonym, itd.")

s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Spostrzegawczość")


skill = Skill.create(:profession_type => "default", :name => "Twardziel", :way_it_works => "bohater otrzymuje +5pkt do Odporności na Ból, premia ta przyznawana jest również przy testach Ogłuszenia, torturowaniu, utracie przytomności, itp. przypadkach. Ponadto postać może z niej skorzystać również podczas przeciwstawnych testów wywołanych magią jeżeli efekt dotyczy bólu, utraty przytomności, itd. Bohater podnosi swą Wytrzymałość o +1pkt.")
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Ból")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "domyślne")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "OR: WT,WI", :value => "21" )


skill = Skill.create(:profession_type => "default", :name => "Wino, Śpiew i Kobiety", :way_it_works => "wszystkie kontakty z płcią przeciwną otrzymują premię w wysokości +5pkt do Ogłady. Przy czym test wykonywany jest tylko i wyłącznie w trudnych, niezręcznych bądź niebezpiecznych sytuacjach (standardowo postać potrafi dopasować się do ogółu i jest raczej lubiana). Ponadto Ogłada postaci zwiększana jest o +2pkt.",
 :description => "wieloletnie podboje płci przeciwnej oraz niezliczone zabawy uczyniły z postaci prawdziwego „Casanovę”. Bohater nie tylko umiejętnie potrafi rozkochać w sobie wybrana osobę ale również doskonale prowadzi zabawy za pomocą śpiewu, rozmowy bądź tańca. Innymi słowy z chwilą kiedy bohater zdobędzie tą zdolność należy uznać go za „duszę towarzystwa”. Doskonałe efekty zapewnia połączenie tej umiejętności z „Dykcją/Przemawianiem”.")
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "O", :value => "17" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "17" )


skill = Skill.create(:profession_type => "default", :name => "Woltyżerka", :way_it_works => "każda z powyższych akcji sprawdzana jest rzutem na Zręczność postaci ale tylko wtedy kiedy wykonywane będzie to w wyjątkowo stresującej sytuacji tj: walka, ucieczka, itp. W normalnych warunkach nie ma potrzeby wykonywania żadnego testu. Zręczność postaci zwiększana jest o +1pkt.",
 :description => "umiejętność perfekcyjnej jazdy konnej, daje możliwość prowadzenia walki z konia nawet za pomocą łuku czy kuszy. Przy wszystkich testach sprawdzających utrzymanie się jeźdźca w siodle otrzymuje on dodatkowe +5pkt. Podczas jazdy postać może wykonać następujące akcje: zeskok z konia, zasłonięcie się koniem, położenie/postawienie konia wraz z jeźdźcem, stanie w siodle, przerzucenie się na wybrany bok konia (trudniej jest taką postać zauważyć bądź trafić), itp.")
s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Jeździectwo" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Podstawy Akrobatyki" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "19" )

skill = Skill.create(:profession_type => "default", :name => "Wykształcenie Akademickie", :way_it_works => "postać zdobyła ogólne wykształcenie, dzięki któremu zna podstawy wszystkich dziedzin nauki. Ponadto zwiększa swój Spryt o +2pkt a wszystkie testy (nie magiczne) związane z wiedzą ułatwione są o 5pkt. Inteligencja postaci wzrasta o +1pkt.",
:limitations => "zakazane dla chłopstwa oraz większości barbarzyńców" )
s_choice = skill.stats_choices.create
skill.skill_requirements.create(:check_applies_to => "social_class", :name => "non_peasant")
skill.skill_requirements.create(:check_applies_to => "social_class", :name => "non_barbarian")

s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")


skill = Skill.create(:profession_type => "default", :name => "Zabijaka", :way_it_works => "wiele lat spędzonych na ulicy, w portach i knajpach, nie tylko zahartowało postać ale również udoskonaliło jej techniki walki. Bohater otrzymuje +2pkt do „Fechtunku” w Bijatyce oraz podnosi swą Siłę jak i Odporność na Ból o +2pkt.",
 )
s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "fighting", :value => 2, :group_name => "Bijatyka")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 2, :group_name => "Odporność na Ból")
s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "domyślne")

skill = Skill.create(:profession_type => "default", :name => "Zielarstwo", :way_it_works => "postać posiada rozległą wiedzę dotyczącą roślin, dzięki czemu wie gdzie i co występuje, jak należy to zbierać, suszyć, preparować, itd. Umiejętność ta daje również możliwość wykonywania lub przyrządzania Prostych mikstur, leków bądź eliksirów. Poprawne wykonanie preparatu określone jest zawsze w jego przepisie. Postać zyskuje +1pkt Inteligencji."
)
s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "default", :name => "Znajomość Regionu Pochodzenia", :way_it_works => "umiejętność zapewnia znajomość wybranego rejonu geograficznego, dróg, ewentualnych niebezpieczeństw: lawiny, rwące rzeki, mielizny, rafy, itp., topografii oraz obyczajności tubylców."
)

skill = Skill.create(:profession_type => "default", :name => "Żeglarstwo i Nawigacja", :way_it_works => "Bohater potrafi określić pozycję/kierunek oraz wyznaczyć kurs za pomocą gwiazd. Testy zdolności wykonujemy tylko i wyłącznie w wyjątkowo ciężkich warunkach tj.: sztorm, burza, mgła bądź silne opady, sprawdzając Inteligencję postaci. Inteligencja postaci podnoszona jest o +1pkt.",
 :description => "jest to zbiór umiejętności potrzebnych do sprawnego prowadzenia jachtu, żaglowca czy okrętu; oczywiście zapewniwszy wcześniej odpowiednią ilość załogi." )
s_choice = skill.stats_choices.create

s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")


