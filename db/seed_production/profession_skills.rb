# -*- encoding : utf-8 -*-

skill = Skill.create(:profession_type => "Żołnierz",
                     :name => "Jeden Cios, Jeden Trup",
                    # :limitations => "tylko dla broni Typowej",
                     :way_it_works => "Zasada Działania: Szansa na Trafienie Krytyczne wszystkich ciosów jakie podczas walki wręcz wyprowadza bohater zwiększona jest o +2pkt. Oznacza to, że osiągając wynik na k30 – 28, 29 lub 30 dochodzi do tzw. „Krytyka”.
" )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "OR: S,ZR", :value => "32" )

skill = Skill.create(:profession_type => "Żołnierz",
                     :name => "Nawałnica Ciosów",
                     :way_it_works => "umiejętność może zostać użyta dopiero po dwóch rundach walki, w których Żołnierz korzystał z ofensywnych umiejętności „Atak” lub „Natarcie”. Dzięki czemu otrzymuje on jeden dodatkowy atak ze standardowym Tempem aktualnie używanej broni. Trafienie tego ciosu rośnie o +3pkt lub o +6pkt jeżeli cały czas używana była umiejętność „Natarcie”. Zdolność może być użyta raz na trzy rundy (dwie rundy Ataku lub Natarcia – w trzeciej darmowy cios, itd). Fechtunek postaci w wybranej grupie broni podnoszone jest o +1pkt.
Umiejętność Pasywna" )

#TODO check it
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 2, :group_name => "Fechtunek w Grupie Broni")


skill.skill_requirements.create(:check_applies_to => "skill", :name => "Natarcie i Powstrzymanie" )

skill = Skill.create(:profession_type => "Żołnierz",
                     :name => "Obrona Doskonała",
                     :way_it_works => "umiejętność może zostać zadeklarowana raz na starcie/walkę i działa przez jedną rundę. W przeciwieństwie do wszystkich standardowych zdolności należy i można ją aktywować dopiero po deklaracji przeciwnika (tylko na jednego przeciwnika). Jeżeli wróg zdecydował się na użycie jakiejkolwiek zdolności zwiększającej jego Trafienie (czyli ofensywnej tj; Atak, Natarcie, Kontratak, itp.) postać podnosi swoją Obronę o +3pkt i zyskuje jeden dodatkowy, natychmiastowy atak zaraz po ciosie przeciwnika. Zdolność nie może być łączona z żadną umiejętnością zwiększającą Trafienie. Fechtunek w Obronie postaci podnoszony jest o +2pkt.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Atak i Obrona" )

#TODO check it
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 2, :group_name => "Fechtunek w Obronie")

skill = Skill.create(:profession_type => "Żołnierz",
                     :name => "Szermierz",
                     :way_it_works => "Bohater zyskuje jeden dodatkowy atak w każdej broni przeznaczonej do walki wręcz jaką się posługuje." )


skill.skill_requirements.create(:check_applies_to => "statistics", :name => "OR: S,ZR", :value => "30" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "8" )

#####Alchemik
skill = Skill.create(:profession_type => "Alchemik",
                     :name => "Alchemia",
                     :way_it_works => "postać do perfekcji opanowała tworzenie mikstur i eliksirów dzięki czemu za każdym razem kiedy musi wykonać test sprawdzający poprawność ich wykonania może rzucić dwa razy wybierając korzystniejszy wynik. Ponadto poziom trudności wszystkich znanych receptur, mikstur czy eliksirów obniżony jest o 2pkt.
Zręczność i Inteligencja bohatera podnoszone są o +1pkt.
Umiejętność Pasywna" )


skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "26" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "Alchemik",
                     :name => "Destylacja",
                     :way_it_works => "za każdym razem kiedy Alchemik wytwarza jakąś miksturę, eliksir, truciznę czy też lek może wytworzyć jedną, dodatkową porcję. Np.: kiedy z danych specyfików miałby uzyskać k10porcji zamiast tego wytwarza k10+1porcję.
Inteligencja postaci podnoszona jest o +1pkt.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "30" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "Alchemik",
                     :name => "Wiedza o Lotosach",
                     :way_it_works => "postać zdobyła tajemną wiedzę o legendarnych roślinach zwanych Lotosami. Wie gdzie ich szukać i potrafi je odpowiednio spreparować. Szczegóły w rozdziale: Alchemia.
Inteligencja postaci wzrasta o +1pkt.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Tworzenie Mikstur" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")

##### Berzerker

skill = Skill.create(:profession_type => "Berzerker",
                     :name => "Siła mego Wroga",
                     :way_it_works => "za każdym razem kiedy bohater zabił podczas walki człowieka, otrzymuje premię +2pkt do Trafienia i Obrony Bliskiej na okres tego starcia/walki. Wiara postaci zwiększana jest o +1pkt.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WI", :value => "18" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "Berzerker",
                     :name => "Skała",
                     :way_it_works => "dzięki „Skale”, wszystkie otrzymane przez Berzerkera rany, zmniejszane są o 4pkt do minimum 0pkt. Tortury fizyczne nie działają na postać, jedynie męki psychiczne lub inne efekty magiczne mają nikłe szanse powodzenia. Dlatego też, bohater otrzymuje premię +5pkt do Odporności na Ból i Strach. Krwawienie spowodowane odniesionymi ranami następuje dopiero w chwili kiedy Punkty Życia osiągną wartość poniżej 1pkt, a nie jak ma to normalnie miejsce w momencie spadku do lub poniżej 5pkt.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "31" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WT", :value => "31" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Niezłomność" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Strach")  #TODO unify the name
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Ból")  #TODO unify the name

skill = Skill.create(:profession_type => "Berzerker",
                     :name => "Tatuaż Magniego",
                     :way_it_works => "Berzerker przechodzi tajemny rytuał, w którym Szaman naznacza jego ciało ochronnymi symbolami. Postać zyskuje Odporność na Magię +5pkt, a jej Wiara podnoszona jest o +1pkt.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WI", :value => "20" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Magię")

skill = Skill.create(:profession_type => "Berzerker",
                     :name => "Syn Gór",
                     :way_it_works => "postać zwiększa swoją Siłę i Wytrzymałość o +2pkt.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "26" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WT", :value => "26" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "WT", :value => 2, :group_name => "domyślne")

#CZARNOKSIEZNIK

skill = Skill.create(:profession_type => "Czarnoksiężnik",
                     :name => "Martwe Oczy",
                     :way_it_works => "oczy Czarnoksiężnika stają się ciemne niczym smoła, białka i źrenice całkowicie zanikają a z daleka człowiek mógłby przysiąc, że postać posiada jedynie same puste oczodoły. Z bliska efekt ten ulega zmianie uzmysławiając obserwatorowi, iż oczy postaci stały się nienaturalnie ciemne co dla niektórych, niewykształconych, zabobonnych ludzi może być przerażające (test strachu – brak zaufania, ewentualnie ucieczka, itd.). Umiejętność zanika kiedy na oczy postaci padną promienie słoneczne (np.: stanie w świetle słonecznym, itp. – decyzja MG) lub po upływie dwóch godziny/poziom od chwili aktywacji. Zdolność może być aktywowana raz na dzień chyba, że bohater osiągnął Piąty Poziom Doświadczenia od kiedy to będzie mógł aktywować ją na dowolny okres czasu kiedy tylko zechce.
Zasada działania: Korzystając z „Martwych Oczu” postać widzi w ciemnościach tak dobrze jak za dnia, ponadto jest w stanie rozróżnić istoty żywe od martwych (ujawnia to obecność niektórych umarłych, którzy schowali się pod ludzkim obliczem). Jeżeli Czarnoksiężnik posiada Chowańca, Impa, Sługę, spętaną Duszę lub Abominację za pomocą tej umiejętności może widzieć wybranymi oczami dowolnego sługi – wymaga to jednak pełnego skupienia.
." )

skill = Skill.create(:profession_type => "Czarnoksiężnik",
                     :name => "Martwe Oczy",
                     :way_it_works => "czary przyzywające/tworzące Martwiaki i Demony mają zmniejszony Poziom Trudności o -3pkt. Jakiekolwiek testy konfrontujące Moc Nekromanty z mocą przyzwanej istoty otrzymują premię w wysokości +3pkt. Ponadto za każdym razem kiedy Czarnoksiężnik, za pomocą znanego sobie czaru, przywołuje martwiaki może zawezwać jednego więcej.
Inteligencja postaci podnoszona jest o +1pkt, a jej Odporność na Strach o +3pkt.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Zakazana Wiedza" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Odporność na Strach")

skill = Skill.create(:profession_type => "Czarnoksiężnik",
                     :name => "Krwawa Ofiara",
                     :way_it_works => "za każdym razem kiedy Czarnoksiężnik rzuca czar odbierający PŻ lub zadający Obrażenia może zwiększyć jego moc tracąc k10PŻ. Dzięki temu zasięg zaklęcia podnoszony jest dwukrotnie, a Obrażenia jakie wywołuje zwiększane są o k10pkt.
Odporność na Ból postaci podnoszona jest o +5pkt.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "30" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "4")
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Ból")

skill = Skill.create(:profession_type => "Czarnoksiężnik",
                     :name => "Potęga Poświęcenia",
                     :way_it_works => "za każdym razem kiedy Czarnoksiężnik rzuca czar odbierający PŻ lub zadający Obrażenia może zwiększyć jego moc tracąc k10PŻ. Dzięki temu zasięg zaklęcia podnoszony jest dwukrotnie, a Obrażenia jakie wywołuje zwiększane są o k10pkt.
Odporność na Ból postaci podnoszona jest o +5pkt.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WI", :value => "20" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 2, :group_name => "Odporność na Ból")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 2, :group_name => "Odporność na Strach")

#####FIRCYK
#Fircyk (żołnierz)
#Fircyk (łotr)

skill = Skill.create(:profession_type => "Fircyk (żołnierz)",
                     :name => "„Bliźniak”",
                     :way_it_works => "raz na walkę z danym przeciwnikiem po udanym Trafieniu, Fircyk zyskuje jeden dodatkowy, natychmiastowy atak wybraną przez siebie bronią.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "28" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "20" )

skill = Skill.create(:profession_type => "Fircyk (żołnierz)",
                     :name => "Tancerz",
                     :way_it_works => "postać poznała większość tańców i jest w tym zawodowcem. Ponadto bohater zwiększa swoją Zręczność, Ogładę i Inicjatywę o +1pkt oraz zawsze pomija wyrzucenie „Jedynki” podczas testu Trafienia. Dzięki temu nigdy nie będzie miał Krytycznego Pecha w trakcie walki wręcz." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "30" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "3" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")

skill = Skill.create(:profession_type => "Fircyk (żołnierz)",
                     :name => "Tancerz Cesarskiego Dworu",
                     :way_it_works => "postać zwiększa swoją Zręczność, Ogładę i Inicjatywę o +1pkt. Dodatkowo każdy cios przeciwnika wymierzony w Fircyka nigdy nie może stać się Trafieniem Krytycznym. Oznacza to, że wróg trafia ale nie otrzymuje rzutu w odpowiedniej tabelce.")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "36" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "7" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Tancerz" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")

skill = Skill.create(:profession_type => "Fircyk (żołnierz)",
                     :name => "Uwodziciel",
                     :way_it_works => "postać zwiększa swoją Zręczność, Ogładę i Inicjatywę o +1pkt. Dodatkowo każdy cios przeciwnika wymierzony w Fircyka nigdy nie może stać się Trafieniem Krytycznym. Oznacza to, że wróg trafia ale nie otrzymuje rzutu w odpowiedniej tabelce.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "O", :value => "20" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")


##

skill = Skill.create(:profession_type => "Fircyk (łotr)",
                     :name => "„Bliźniak”",
                     :way_it_works => "raz na walkę z danym przeciwnikiem po udanym Trafieniu, Fircyk zyskuje jeden dodatkowy, natychmiastowy atak wybraną przez siebie bronią.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "28" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "20" )

skill = Skill.create(:profession_type => "Fircyk (łotr)",
                     :name => "Tancerz",
                     :way_it_works => "postać poznała większość tańców i jest w tym zawodowcem. Ponadto bohater zwiększa swoją Zręczność, Ogładę i Inicjatywę o +1pkt oraz zawsze pomija wyrzucenie „Jedynki” podczas testu Trafienia. Dzięki temu nigdy nie będzie miał Krytycznego Pecha w trakcie walki wręcz." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "30" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "3" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")

skill = Skill.create(:profession_type => "Fircyk (łotr)",
                     :name => "Tancerz Cesarskiego Dworu",
                     :way_it_works => "postać zwiększa swoją Zręczność, Ogładę i Inicjatywę o +1pkt. Dodatkowo każdy cios przeciwnika wymierzony w Fircyka nigdy nie może stać się Trafieniem Krytycznym. Oznacza to, że wróg trafia ale nie otrzymuje rzutu w odpowiedniej tabelce.")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "36" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "7" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Tancerz" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "O", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")

skill = Skill.create(:profession_type => "Fircyk (łotr)",
                     :name => "Uwodziciel",
                     :way_it_works => "postać zwiększa swoją Zręczność, Ogładę i Inicjatywę o +1pkt. Dodatkowo każdy cios przeciwnika wymierzony w Fircyka nigdy nie może stać się Trafieniem Krytycznym. Oznacza to, że wróg trafia ale nie otrzymuje rzutu w odpowiedniej tabelce.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "O", :value => "20" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")

####MAG

skill = Skill.create(:profession_type => "Mag",
                     :name => "Mistrz Aur",
                     :way_it_works => "postać potrafi doskonale zsynchronizować działanie magicznych aur dzięki czemu w tym samym czasie może posiadać na sobie dwa takie zaklęcia (dwie wybrane aury).." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "35" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "8" )

 skill = Skill.create(:profession_type => "Mag",
                     :name => "Starożytna Potęga",
                     :way_it_works => "postać potrafi doskonale zsynchronizować działanie magicznych aur dzięki czemu w tym samym czasie może posiadać na sobie dwa takie zaklęcia (dwie wybrane aury).." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "35" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "power level", :value => 0, :group_name => "2k10") #TODO ...     if 0 then parse group name


### Kapłan

skill = Skill.create(:profession_type => "Kapłan",
                     :name => "Egzorcysta",
                     :way_it_works => "postać wykonuje przeciwstawny test Wiary z przyzwanym Demonem lub przyzwanym Martwiakiem. Sukces odsyła potwora w miejsce, z którego został zawezwany. Niepowodzenie oznacza, iż Kapłan już nigdy nie będzie mógł odesłać tej (konkretnej) istoty. Umiejętność może być aktywowana raz na dobę, zajmuje 2rundy i działa na odległość 20metrów.
Wiara Kapłana podnoszona jest o +1pkt, natomiast jego Odporność na Strach wzrasta o +3pkt.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WI", :value => "30" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Odporność na Strach")

skill = Skill.create(:profession_type => "Kapłan",
                     :name => "Kazania",
                     :way_it_works => "Kapłan do perfekcji opanował sztukę prawienia kazań. Przemawia pewnym głosem cytując wolę boską prosto ze świętych ksiąg.
Postać podnosi swą Ogładę o +3pkt oraz Rzucanie Modlitw o +2pkt.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "22" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 3, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "casting", :value => 2, :group_name => "Rzucanie czarów")  #TODO unified name?

skill = Skill.create(:profession_type => "Kapłan",
                     :name => "Wiara mą Tarczą",
                     :way_it_works => "zmniejsza Obrażenia wywołane przez magię (nie dotyczy ciosów zadanych umagicznioną bronią) o premię z Wiary.
Wiara postaci podnoszona jest o +1pkt.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WI", :value => "30" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")


###Łotr

skill = Skill.create(:profession_type => "Łotr",
                     :name => "Bystrzak",
                     :way_it_works => "za każdym razem kiedy przeciwnik skieruje na Łotra magię oddziałującą na umysł, postać otrzymuje Odporność na Magię +5pkt.
Ogłada bohatera podnoszona jest o +2pkt, a Inteligencja i Spostrzegawczość o +1pkt.
Umiejętność Pasywna.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Spostrzegawczość")

skill = Skill.create(:profession_type => "Łotr",
                     :name => "Cios w Plecy",
                     :way_it_works => "raz na starcie/walkę z danym przeciwnikiem, po trafionym przez Łotra ciosie może on zwiększyć zadawane Obrażenia o premię ze swej Zręczności.
Bohater podnosi swoją Siłę i Zręczność o +1pkt.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "27" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "Łotr",
                     :name => "Unik",
                     :way_it_works => "raz na starcie/walkę po tym jak przeciwnik trafił w walce (nie dotyczy strzelania) Łotr może zadeklarować unik dzięki czemu cios automatycznie nie trafia (nie dotyczy trafienia krytycznego). Obrona Bliska i Daleka jest podnoszona o +1pkt/2poziomy postaci.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "31" )

skill = Skill.create(:profession_type => "Łotr",
                     :name => "Nieuchwytny",
                     :way_it_works => "Obrona Bliska, Dystansową oraz parametr Bieg podnoszone są o +2pkt.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "28" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 2, :group_name => "Bieg")
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 2, :group_name => "Obrona Bliska")
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 2, :group_name => "Obrona Daleka")

###RYCERZ

skill = Skill.create(:profession_type => "Rycerz",
                     :name => "Doskonałość Szermiercza",
                     :way_it_works => "raz na walkę z danym przeciwnikiem, postać może anulować cios, który właśnie ją dosięgnął (deklaracja następuje po trafionym przez wroga ciosie ale przed zadaniem Obrażeń). Następnie rycerz wykonuje jeden darmowy, natychmiastowy atak. Zdolność można użyć tylko w walce wręcz, przy dowolnym ciosie, którego bohater jest świadom i nie jest to atak krytyczny. Fechtunek Rycerza podnoszony jest o +1pkt (w każdej broni, którą włada).")

skill.skill_requirements.create(:check_applies_to => "experience", :value => "7" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Fechtunek w Ataku")

skill = Skill.create(:profession_type => "Rycerz",
                     :name => "Hardy",
                     :way_it_works => "postać zwiększa ilość Punktów Życia o premię ze swej Wytrzymałości.
Umiejętność Pasywna.")

#TODO Implement it !!!

skill = Skill.create(:profession_type => "Rycerz",
                     :name => "Nieustępliwy",
                     :way_it_works => "postać zwiększa swoją Odporność na Strach i Ból o +5pkt. Ponadto otrzymuje +1pkt do Siły.
Umiejętność Pasywna.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Strach")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Ból")
s_choice.stats_modifiers.create(:modifies => "S", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "Rycerz",
                     :name => "Znamienite Pochodzenie",
                     :way_it_works => "postać dziedziczy po zmarłym krewnym spory spadek, a jej imię nabiera na znaczeniu. Dzięki temu podnosi swoją Ogładę o +2pkt i zyskuje 500sztuk złota, które może wykorzystać od razu podczas tworzenia postaci na zakup ekwipunku lub zostawić na później.
")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "O", :value => 2, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "money", :value => 50000, :group_name => "domyślne")    #TODO implement it !

#Rycerz Zakonny

skill = Skill.create(:profession_type => "Rycerz Zakonny",
                     :name => "Modlitwa",
                     :way_it_works => "podnosząca morale pieśń modlitewna, najczęściej śpiewana jest przed lub podczas walki. Postać musi wykonać udany rzut na Ogładę aby jej sojusznicy (nie działa na samego Rycerza Zakonnego) otrzymali premię +1pkt do Trafienia i Obrony oraz +5pkt do Odporności na Strach. Wszystkie postacie wierzące w to samo bóstwo co inkantujący podwajają tą premię. Efekt utrzymuje się przez 5rund/poziom śpiewającego począwszy od pierwszej rundy starcia/inkantacji. Śpiewając, postać nadal może skutecznie walczyć wykorzystując swe umiejętności bitewne, dlatego też zdolność ta traktowana jest po części jako;
Umiejętność Pasywna
Wiara bohatera podnoszona jest o +2pkt.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 2, :group_name => "domyślne")

skill = Skill.create(:profession_type => "Rycerz Zakonny",
                     :name => "Nieskazitelny",
                     :way_it_works => "raz na dzień postać może powstrzymać wszystkie wrogie martwiaki bądź demony i sprawić, iż nie będą wstanie go zaatakować. Niestety umiejętność ta zapewnia skuteczną ochronę jedynie przeciw najsłabszym istotom. Czyli tym, które nie posiadają Inteligencji (dotyczy części martwiaków i demonów) lub o Wierze/Instynkcie poniżej 20pkt. Raz aktywowany efekt utrzymuje się przez k10minut +minutę/poziom Rycerza. Istoty potężniejsze mogą zaatakować postać jeżeli wygrają z nią przeciwstawny test Wiary/Instynktu, który wykonują na początku każdej rundy. Dodatkowo wszystkie czary i zdolności, które wywołują Strach nie działają na Rycerza Zakonnego.
Wiara postaci zostaje zwiększona o +1pkt.
Umiejętność Pasywna")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "Rycerz Zakonny",
                     :name => "Siła Wiary",
                     :way_it_works => "dotknięta przez Rycerza Zakonnego ranna postać zostaje uleczona, jej rany się zasklepiają, krwawienie ustaje, a zmęczenie pryska niczym zły sen. Wybrana istota odzyskuje 1PŻ/poziom świętego plus wartość premii z jego Wiary. Zdolność może być użyta raz na dzień i nie działa na samego Rycerza. Efekt leczenia następuje na końcu danej rundy czyli właściwie natychmiast.
Wiara postaci zostaje zwiększona o +1pkt.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "Rycerz Zakonny",
                     :name => "Błogosławieństwo Boże",
                     :way_it_works => "Rycerz Zakonny może wybrać jedną Modlitwę spośród tych, którymi dysponują Kapłani jego Wyznania. Dzięki czemu będzie mógł przyzwać jej moc raz na dzień, a sam nie musi posiadać ani wydawać żadnych Punktów Magii. Aktywacja zajmuje standardową ilość punktów Tempa, a splecenie Modlitwy zawsze się udaje. Zakonnik potrafi sformułować ją tylko z 1poziomu przy czym w danej rundzie musi wybrać czy walczy czy czaruje. Należy założyć, że Przełamanie Rycerza Zakonnego równe jest jego premii z Wiary. Umiejętność ta może zostać wybrana wielokrotnie każdorazowo dając nową Modlitwę. Jeżeli Modlitwa posiada jakieś dodatkowe koszty wyrażone w PM, postać nie może jej skutecznie używać – decyzja MG..")

skill.skill_requirements.create(:check_applies_to => "experience", :value => "8" )

#Strzelec

skill = Skill.create(:profession_type => "Strzelec",
                     :name => "Im bliżej tym lepiej",
                     :way_it_works => "wszystkie strzały/bełty wystrzelone na Bliski zasięg zadają ofierze dodatkowe 3pkt Obrażeń.
Umiejętność Pasywna.")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )


skill = Skill.create(:profession_type => "Strzelec",
                     :name => "Odległość nie ma Znaczenia",
                     :way_it_works => "kara wynikająca ze strzelania na zasięg inny niż Bliski zmniejszana jest o premię ze Zręczności Strzelca. Dodatkowo Daleki zasięg broni strzeleckiej używanej przez postać zwiększony jest o 25metrów a jej Trafienie wzrasta o +2pkt.
Umiejętność Pasywna.")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )

#TODO Implement it !

skill = Skill.create(:profession_type => "Strzelec",
                     :name => "Wyśmienity Naciąg",
                     :way_it_works => "kara wynikająca ze strzelania na zasięg inny niż Bliski zmniejszana jest o premię ze Zręczności Strzelca. Dodatkowo Daleki zasięg broni strzeleckiej używanej przez postać zwiększony jest o 25metrów a jej Trafienie wzrasta o +2pkt.
Umiejętność Pasywna.")
skill.skill_requirements.create(:check_applies_to => "experience", :value => "5" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
#TODO Implement it ! along with other dmg perks

skill = Skill.create(:profession_type => "Strzelec",
                     :name => "Mistrz Kuszników",
                     :way_it_works => "Tempo ładowania kuszy zmniejszone jest o 1rundę. Jeżeli ilość rund potrzebnych do załadowania broni spadnie do zera, postać może strzelić i napiąć kuszę w tej samej rundzie. W przypadku oddania strzału na początku rundy, Strzelec może naładować broń ale zajmie mu to całą rundę. W chwili kiedy nie ma przygotowanej do strzału kuszy napięcie zajmuje całą rundę i z jej końcem oddaje strzał (identycznie jak w przypadku czarów całorundowych).
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "experience", :value => "3" )
#TODO Implement it ! along with other dmg perks


###SZAMAN

skill = Skill.create(:profession_type => "Szaman",
                     :name => "Siła Przodków",
                     :way_it_works => "Zasada działania: wszystkie zaklęcia oparte na duchach natury lub przywołujące duchy mają obniżony koszt Mocy i Poziom Trudności o 2pkt oraz zmniejszone Tempo o 1pkt.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WI", :value => "29" )


skill = Skill.create(:profession_type => "Szaman",
    :description => "w chwili narodzin dusza Szamana łączy się ze zwierzęciem, które jest mu najbardziej przychylne. Wraz z biegiem czasu bohater przejmuje coraz więcej jego cech nie tylko tych fizycznych ale również psychicznych. Dzieje się tak, aż do chwili kiedy łączy się on ze swoim patronem w jedną istotę. Scalenie następuje wcześniej lub później ale zawsze oznacza wkroczenie na ścieżkę dorosłych. ",
                     :name => "Totem: Wytrzymałość Niedźwiedzia",
                     :way_it_works => "na początku nauki lub w chwili kiedy postać wybiera tę zdolność, wyznaczone przez nią zwierzę staje się jego Totemem. Od tego momentu będzie go symbolizowało i zawsze mu towarzyszyło. Oto Totemy i profity z nich wynikające:
- Wytrzymałość Niedźwiedzia; +8pkt do „Odporności na Ból”
- Wilcze Spojrzenie; +8pkt do „Spostrzegawczości”
- Serce Lwa; +8pkt do „Odporności na Strach”
Wiara Szaman podnoszona jest o +1pkt.
Umiejętność Pasywna.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 8, :group_name => "Odporność na Ból")

skill = Skill.create(:profession_type => "Szaman",
    :description => "w chwili narodzin dusza Szamana łączy się ze zwierzęciem, które jest mu najbardziej przychylne. Wraz z biegiem czasu bohater przejmuje coraz więcej jego cech nie tylko tych fizycznych ale również psychicznych. Dzieje się tak, aż do chwili kiedy łączy się on ze swoim patronem w jedną istotę. Scalenie następuje wcześniej lub później ale zawsze oznacza wkroczenie na ścieżkę dorosłych. ",
                     :name => "Totem: Wilcze Spojrzenie",
                     :way_it_works => "na początku nauki lub w chwili kiedy postać wybiera tę zdolność, wyznaczone przez nią zwierzę staje się jego Totemem. Od tego momentu będzie go symbolizowało i zawsze mu towarzyszyło. Oto Totemy i profity z nich wynikające:
- Wytrzymałość Niedźwiedzia; +8pkt do „Odporności na Ból”
- Wilcze Spojrzenie; +8pkt do „Spostrzegawczości”
- Serce Lwa; +8pkt do „Odporności na Strach”
Wiara Szaman podnoszona jest o +1pkt.
Umiejętność Pasywna.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 8, :group_name => "Spostrzegawczość")

skill = Skill.create(:profession_type => "Szaman",
    :description => "w chwili narodzin dusza Szamana łączy się ze zwierzęciem, które jest mu najbardziej przychylne. Wraz z biegiem czasu bohater przejmuje coraz więcej jego cech nie tylko tych fizycznych ale również psychicznych. Dzieje się tak, aż do chwili kiedy łączy się on ze swoim patronem w jedną istotę. Scalenie następuje wcześniej lub później ale zawsze oznacza wkroczenie na ścieżkę dorosłych. ",
                     :name => "Totem: Serce Lwa",
                     :way_it_works => "na początku nauki lub w chwili kiedy postać wybiera tę zdolność, wyznaczone przez nią zwierzę staje się jego Totemem. Od tego momentu będzie go symbolizowało i zawsze mu towarzyszyło. Oto Totemy i profity z nich wynikające:
- Wytrzymałość Niedźwiedzia; +8pkt do „Odporności na Ból”
- Wilcze Spojrzenie; +8pkt do „Spostrzegawczości”
- Serce Lwa; +8pkt do „Odporności na Strach”
Wiara Szaman podnoszona jest o +1pkt.
Umiejętność Pasywna.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 8, :group_name => "Odporność na Strach")

##Zabójca


skill = Skill.create(:profession_type => "Zabójca",
                     :name => "Nożownik",
                     :way_it_works => "Fechtunek w Nożach, Sztyletach i Łamaczach Mieczy podnoszony jest o +1pkt a Obrażenia jakie postać nimi zadaje wzrastają o +1pkt/3poziomy Zabójcy (4poz. +2pkt, 7poz. +3pkt, itd.) Umiejętność wpływa również na Trafienie i Obrażenia zadane podczas rzutu nożami.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )
#TODO Implement it !

 skill = Skill.create(:profession_type => "Zabójca",
                     :name => "Haniebny Cios",
                     :way_it_works => "zdolność może być wykorzystana raz na walkę z danym przeciwnikiem. Po pierwszym zranieniu wroga w walce wręcz, dany przeciwnik automatycznie nie trafia Zabójcy kolejnym ciosem (rzut na Trafienie nie jest wykonywany).
Spostrzegawczość postaci podnoszona jest o +2pkt.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Precyzyjny Cios" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 2, :group_name => "Spostrzegawczość")

 skill = Skill.create(:profession_type => "Zabójca",
                     :name => "Mistrz Oręża",
                     :way_it_works => "Fechtunek w wybranej Grupie Broni podnoszony jest o +1pkt, ponadto bohater zwiększa zadawane w walce wręcz Obrażenia o +3pkt.
Umiejętność Pasywna")

#TODO Implement it !    Fechtunek w wybranej Grupie Broni
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "33" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "20" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "3" )

 skill = Skill.create(:profession_type => "Zabójca",
                     :name => "Skrytobójca",
                     :way_it_works => "postać potrafi doskonale ukrywać posiadaną broń, wie jak ją przemycić tak aby nikt jej nie wykrył (decyzja MG). Stosowny test na Spostrzegawczość wykonywany jest z karą od -5pkt do -20pkt. Ponadto za każdym razem kiedy bohater deklaruje atak z zaskoczenia lub wyprowadza cios, którego przeciwnik się nie spodziewa, zyskuje jeden, natychmiastowy atak. Cios rozpatrywany jest przed rundą, a jego Obrażenia zwiększane są o +1pkt/poziom.
Korzystając z umiejętności Krycie się i Cichy Chód osoby które mają być zaskoczone/zwiedzione przez Zabójcę otrzymują dodatkową karę do Spostrzegawczości w wysokości -5pkt.
Inicjatywa postaci wzrasta o +1pkt.
Umiejętność Pasywna.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")

