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
