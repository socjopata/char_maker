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
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Fechtunek w Grupie Broni")


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

skill = Skill.create(:profession_type => "Żołnierz",
                     :name => "Weteran Wojenny",
                     :way_it_works => "raz na dzień za każdy punkt premii z Inteligencji, postać może zwiększyć na okres jednej rundy swoje Trafienie, Obronę i zadawane Obrażenia o wartość premii ze swej Siły lub Zręczności (decyzja gracza)." )


#####Alchemik
skill = Skill.create(:profession_type => "Alchemik",
                     :name => "Alchemia",
                     :way_it_works => "koszt Mocy potrzebny podczas wytworzenia Zaawansowanej mikstury zmniejszany jest o połowę. Wszystkie zaawansowane eliksiry przygotowane przez Alchemika mają dwukrotnie dłuższy czas działania.
Postać posiadającą Alchemię niezwykle trudno jest oszukać przy sprzedaży i zakupie ziół/mikstur.
Zręczność i Inteligencja bohatera podnoszone są o +1pkt.
Umiejętność Pasywna." )


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
                     :way_it_works => "postać zdobyła tajemną wiedzę o legendarnych roślinach zwanych Lotosami. Wie gdzie ich szukać i potrafi je odpowiednio spreparować. Szczegóły w rozdziale: Alchemia. Bohater otrzymuje jedną sztukę wybranego przez siebie Lotosu.
Inteligencja postaci wzrasta o +1pkt.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Tworzenie Mikstur" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "Alchemik",
                     :name => "Lata Praktyki",
                     :way_it_works => "lata spędzone na wytwarzaniu i testowaniu najgroźniejszych specyfików uodporniły postać na wszelkie niepożądane efekty. Przy wykonywaniu dowolnego testu wywołanego miksturą, narkotykiem, trucizną czy lotosem Alchemik otrzymuje premię w wysokości 10pkt +1pkt/poziom. Dotyczy to również testów związanych z alkoholem." )

skill.skill_requirements.create(:check_applies_to => "experience", :value => "2")
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WT", :value => 1, :group_name => "domyślne")


skill = Skill.create(:profession_type => "Alchemik",
                     :name => "Talenty Alchemiczne",
                     :way_it_works => "zamiana żelaza w złoto, bądź stworzenie kamienia filozoficznego… tak trzeba posiadać liczne talenty i tajemną wiedzę aby próbować szczęścia z takimi eksperymentami. Alchemik jest specyficznym czarodziejem, jako jedyny opanował wyjątkową sztukę łączenia specyfików z czarami dzięki czemu potrafi wywoływać efekty zwane Talentami Alchemicznymi (szczegóły w rozdziale Magia: Talenty Alchemika)." )



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
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Strach")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 5, :group_name => "Odporność na Ból")

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

skill = Skill.create(:profession_type => "Berzerker",
                     :name => "Berzerk",
                     :way_it_works => "po otrzymaniu poważnej rany (która sprowadziła PŻ poniżej połowy górnej wartości lub po jednorazowej utracie przynajmniej 10PŻ) Berzerker wpada w szał, który trwa przez 5rund +2rundy/poziom. Na czas trwania furii zwiększa swoje Trafienie i zadawane Obrażenia o premię z Siły, a wszystkie testy Strachu i Bólu zdaje automatycznie. Ponadto w szale nie krwawi ani nie odczuwa zmęczenia. Zdolność może być aktywowana również w kilku innych przypadkach – walka z odwiecznym wrogiem, szał po śmierci najbliższego towarzysza, itp. Decyzja MG." )

#CZARNOKSIEZNIK

skill = Skill.create(:profession_type => "Czarnoksiężnik",
                     :name => "Martwe Oczy",
                     :way_it_works => "oczy Czarnoksiężnika stają się ciemne niczym smoła, białka i źrenice całkowicie zanikają a z daleka człowiek mógłby przysiąc, że postać posiada jedynie same puste oczodoły. Z bliska efekt ten ulega zmianie uzmysławiając obserwatorowi, iż oczy postaci stały się nienaturalnie ciemne co dla niektórych, niewykształconych, zabobonnych ludzi może być przerażające (test strachu – brak zaufania, ewentualnie ucieczka, itd.). Umiejętność zanika kiedy na oczy postaci padną promienie słoneczne (np.: stanie w świetle słonecznym, itp. – decyzja MG) lub po upływie dwóch godziny/poziom od chwili aktywacji. Zdolność może być aktywowana raz na dzień chyba, że bohater osiągnął Piąty Poziom Doświadczenia od kiedy to będzie mógł aktywować ją na dowolny okres czasu kiedy tylko zechce.
Zasada działania: Korzystając z „Martwych Oczu” postać widzi w ciemnościach tak dobrze jak za dnia, ponadto jest w stanie rozróżnić istoty żywe od martwych (ujawnia to obecność niektórych umarłych, którzy schowali się pod ludzkim obliczem). Jeżeli Czarnoksiężnik posiada Chowańca, Impa, Sługę, spętaną Duszę lub Abominację za pomocą tej umiejętności może widzieć wybranymi oczami dowolnego sługi – wymaga to jednak pełnego skupienia.
." )

skill = Skill.create(:profession_type => "Czarnoksiężnik",
                     :name => "Pakty",
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

skill = Skill.create(:profession_type => "Czarnoksiężnik",
                     :name => "Rzucanie Czarów",
                     :way_it_works => "postać jako jedna z nielicznych posiadła tajemne moce i umiejętności dzięki, którym potrafi rzucać zakazane Czary Czarnoksięskie (szczegóły w rozdziale Magia: Czary Czarnoksięskie)." )

#####Dziecię Sirtol

skill = Skill.create(:profession_type => "Dziecię Sirtol",
                     :name => "Czarne Ostrze",
                     :way_it_works => "aby skorzystać z tej umiejętność postać musi zbroczyć swój oręż własną krwią. Zdolność można aktywować dowolną ilość razy na dzień dopóki postać będzie mogła ustać na nogach, a efekt utrzymuje się przez k10rund +2rundy/poziom. Tak nasączona broń posiada dodatkowe cechy tylko w rękach właściciela.
                     I Stopień: zbroczona broń nabiera niezwykłej, choć ulotnej mocy. Każdy trafiony cios zadaje o 2pkt Obrażeń więcej a sam oręż tymczasowo traktowany jest jako magiczny.
                     II Stopień: każdy cios zadany tak nasączoną bronią ma zwiększone Obrażenia o 1pkt+1pkt/poziom Dziecka Sirtol. Wszystkie rany powstałe w wyniku Czarnego Ostrza można wyleczyć jedynie za pomocą magii, lub po upływie k30dni (wcześniej rany cały czas krwawią, jątrzą się, a jeżeli stan taki utrzyma się przez ponad 10dni ofiara musi wykonać test na połowę swej Wytrzymałości lub umiera). Oręż chwilowo traktowany jest jako magiczny.
                     III Stopień: jw. dodatkowo żywe istoty zranione tą bronią muszą wykonać test Bólu zmniejszony o 1pkt/poziom postaci. Niepowodzenie nakłada na nie karę do Trafienia, Obrony oraz innych czynności jakich się podejmą w wysokości -5pkt. Efekt ten może się kumulować (pierwszy -5, drugi -10, itd), a utrzymuje się przez 1rundę/poziom Dziecka Sirtol.")

skill = Skill.create(:profession_type => "Dziecię Sirtol",
                     :name => "Przerażenie",
                     :way_it_works => "na mgnienie oka postać ukazuje swym wrogom prawdziwą naturę, obliczę tak przerażające, iż nawet najbardziej odważni mogą rzucić się do panicznej ucieczki. Ofiary muszą wykonać udany test Strachu zmniejszonego o premię z Inteligencji Dziecka Sirtol lub jego moc poparta przerażającym wyglądem zmusza je do natychmiastowej ucieczki, która trwa przez k10rund. Postacie będące pod wpływem paniki, które nie mogą uciec (np.: znajdują się w zamkniętym pokoju, itp.) starają się unikać postaci jak ognia ale doprowadzone do ostateczności muszą wykonać jeszcze jeden test Strachu, sukces wyzwala je spod jego mocy a niepowodzenie oznacza natychmiastową utratę przytomności. Oczywiście kiedy rzucają się do ucieczki porzucają cały dobytek, broń, tarczę lub inne przedmioty, które mogłyby im przeszkadzać w ewakuacji. Umiejętność działa tylko i wyłącznie na istoty żywe.
                     I Stopień: zdolność może być użyta raz na 24godziny i działa na wybraną przez rycerza istotę, którą musi widzieć i być przez nią widziany.
                     II Stopień: umiejętność może być aktywowana raz na 6godzin a ofiara nie musi widzieć swego oprawcy wystarczy, że on ją widzi i zsyła na jej umysł przerażające wizje swego oblicza.
                     III Stopień: jw. a Przerażenie działa na tylu nieszczęśników ile wynosi premia z jego Inteligencji i może być aktywowane raz na 3godziny")

skill = Skill.create(:profession_type => "Dziecię Sirtol",
                     :name => "Dziecię Ciemności",
                     :way_it_works => "oczy postaci zasnuwa ciemna półprzeźroczysta powieka a z ich kącików sączy się delikatna strużka ciemnej, wyjątkowo rzadkiej krwi.
                     I Stopień: bohater widzi w ciemnościach prawie tak dobrze jak w świetle dziennym a moc tej zdolności utrzymuje się przez 10minut/poziom doświadczenia. Ostre światło niszczy ten efekt (natychmiast zakańcza działanie tej umiejętności), a postać do końca tej rundy otrzymuje karę -5pkt do Trafienia i Obrony.
                     II Stopień: umiejętność działa przez godzinę/poziom postaci a światło słoneczne lub inne intensywne źródła nie kończą tego efektu. Ponadto w powyższym stanie dziecię zwiększa swoją Spostrzegawczość o +5pkt.
                     III Stopień: ponad działanie opisane na drugim Stopniu, postać za pomocą tej umiejętności widzi również demony, które opanowały ludzkie ciała lub przybrały wygląd człowieka. Dodatkowo rozpoznaje magię (tzn. ją widzi), widzi aury, magiczne przedmioty, runy, itp.")

skill = Skill.create(:profession_type => "Dziecię Sirtol",
                     :name => "Wyssanie Życia",
                     :way_it_works => "postać musi pochwycić swą ofiarę (wystarczy ją dotykać), z której powoli lecz nieubłaganie zaczyna wysysać życie. Nieszczęśnik zdaje sobie z tego sprawę odczuwając narastający ból i paraliżujący chłód. Ziąb, który wysysa życie ofiary, sączący się przez dłonie Dziecka i nie może być zatrzymany przez żadną zbroję czy też ubranie a jedynym sposobem jest wyrwanie się z jego objęć. Jeżeli ofiara nie jest nieprzytomna lub związana może co rundę wykonać przeciwstawny test Siły lub Zręczności kontra Siła Dziecka (użycie przedmiotów decyzja MG) aby wyrwać się z uścisku. Każdorazowe aktywowanie tej umiejętności powoduje utratę 1pkt PŻ, która odzwierciedlona jest poprzez drobne pęknięcia na jej dłoniach. Wyssanie Życia odbiera ofierze jej PŻ właściwie na zawsze, dlatego też odzyskać można je tylko i wyłącznie za pomocą magii.
                     I Stopień: zdolność przywraca utracone PŻ w proporcji 4PŻ ofiary za jeden uleczony PŻ Dziecka Sirtol. Czerpać można aż do śmierci nieszczęśnika (na bieżąco sprawdzając czy nie umarł) zabierając 4PŻ na rundę.
                     II Stopień: w ciągu jednej rundy postać może wyssać 9PŻ, dzięki czemu odzyskuje 1PŻ za każde 3PŻ, które wyssała.
                     III Stopień: jw. a za każdym razem kiedy postać dotknie ofiarę, musi ona wykonać udany test Bólu lub pada Nieprzytomna na k10rund.")

skill = Skill.create(:profession_type => "Dziecię Sirtol",
                     :name => "Służalczy Ton",
                     :way_it_works => "postać po odpowiedniej przemowie, gestach lub czynach, sprawdzane jest to rzutem przeciwstawnym na Inteligencję, zapobiega atakowi ze strony demona, niestety w niektórych sytuacjach może się to okazać niemożliwe (decyzja MG). Dodatkowo może próbować przekonać Nienazwanego do wykonania określonych czynności lub akcji, które będą z korzyścią dla nich obu (lub samego demona). Umiejętność ta polega głównie na użyciu swych nadprzyrodzonych mocy, które oddziałują na wybrane istoty.
                     I Stopień: zdolność ta chroni tylko postać a jej towarzysze nadal narażeni są na działania Nienazwanego.
                     II Stopień: moc postaci wzrasta dzięki czemu potrafi tak zbałamucić demona (oczywiście nadal na powyższych zasadach), iż ten nie zaatakuje jej ani jej towarzyszy. Dodatkowo podczas przeciwstawnego testu Inteligencji postać może dodać premię ze swej Ogłady.
                     III Stopień: umiejętność może zostać skierowana również przeciw ludziom lub raczej w trakcie rozmowy z nimi. Po wygraniu przeciwstawnego testu na Inteligencję (z wybranym rozmówcą) może zmienić jego nastawienie wobec siebie lub danej sprawy, o której rozmawiali. Sztuczka ta wpływa na nastawienie zmieniając je w dowolny sposób. Na korzystniejsze lub wręcz przeciwnie często służyć będzie aby wywołać negatywne emocji u słuchacza. Niestety efekt ten jest chwilowy i utrzymuje przez: k30minut +5minut/poziom. Warto również nadmienić o tym, że postać nie jest wstanie zmieniać nastawienia osób o bardzo silnych przekonaniach. Dotyczy to nie tylko fanatyków religijnych, oddanych służących, wiernych rycerzy ale spraw, które dla wybranej postaci mogą być wielce kontrowersyjne lub całkowicie amoralne, w takich sytuacjach i wielu innych tu nie opisanych decyzję zawsze podejmuje MG (czy można taką osobę do czegoś przekonać czy też jest to nie możliwe).")



#####DYPLOMATA

skill = Skill.create(:profession_type => "Dyplomata",
                     :name => "Przyboczny",
                     :way_it_works => "gracz wybiera jedną z trzech profesji: zabójca, łotr lub żołnierz a MG tworzy Npc'a, który staje się jego towarzyszem/ochroniarzem. Razem służą (na zasadzie partnerstwa) wybranemu państwu lub jakiejś potężnej organizacji. Postać ta nie awansuje, a za jej rozwój odpowiedzialna jest ta umiejętność. Przyboczny sterowany jest przez MG i w ekstremalnych sytuacjach może nawet zabić/zdradzić dyplomatę kiedy on postąpi niezgodnie z interesami państwa/organizacji.
                     I Stopień: Przyboczny posiada unikalną zdolność „Poświęcenie”: jeżeli jest w bliskim kontakcie z Dyplomatą lub w porę spostrzeże zagrożenie może przyjąć wybrany atak skierowany w Dyplomatę na siebie. W tym momencie cios lub strzał sprawdzany jest względem jego Obrony. Jest to Umiejętność Pasywna i zazwyczaj nie zajmuje punktów Tempa (ewentualnie czas potrzebny na przebiegnięcie dystansu) i może być wykorzystana tylko raz na sesję w wybranym przez Dyplomatę momencie. Jeżeli Przyboczny zginie kolejny zostaje przydzielony dopiero po wykupieniu następnego poziomu tej umiejętności. Za każdym razem kiedy Dyplomata zostanie wyzwany na pojedynek lub zmuszony do walki na sądzie bożym może wystawić swego Przybocznego. Pochodzenie Npc'a jest zawsze takie samo jak Dyplomaty.
                     II Stopień: jw. umiejętność „Poświęcenie” może być aktywowana dwa razy na sesję a Przyboczny posiada 3poziom doświadczenia. Ponadto może ukończyć wybraną przez Dyplomatę szkołę fechtunku na poziomie ucznia.
                     III Stopień: jw. natomiast poziom Przybocznego równy jest poziomowi postaci (oczywiście należy go odpowiednio rozwijać, szkolenia, umiejętności, ekwipunek, itp.). Ponadto za każdym razem kiedy wykorzysta umiejętność „Poświęcenie” zmniejsza ilość otrzymanych ran o 5pkt. Jeżeli ochroniarz zginie Państwo lub Organizacja będą starać się przydzielić kolejnego Przybocznego, chyba, że zachowanie lub uczynki Dyplomaty były niezgodne z interesem państwa/organizacji. Decyzja o tym zawsze podejmowana jest przez MG.")

skill = Skill.create(:profession_type => "Dyplomata",
                     :name => "Inspiracja",
                     :way_it_works => "zajmuje 1pkt Tempa, wszyscy sojusznicy słyszący Dyplomatę zostają zainspirowani do walki wiedząc, iż walczą za słuszną sprawę (lub za dobrze opłacone zadanie). Zasięg głosu, decyzja MG. Zdolność może być aktywowana tylko raz na daną walkę, a jej efekty nigdy się nie kumulują (nawet jeżeli jest dwóch lub więcej Dyplomatów w tym samym miejscu). Każdy stopień umiejętności może być wykorzystywany osobno. Dzięki czemu w trakcie jednej walki posiadając drugi stopień tej zdolności, bohater może dać premię zarówno z pierwszego poziomu jak i z drugiego, przy czym premię nie sumują się.
                     Umiejętność Pasywna
                     I Stopień: +1pkt do Trafienia i Obrony oraz zwiększają swoją Odporność na Strach o +5pkt, efekt utrzymuje się do końca starcia/walki.
                     II Stopień: raz na starcie/walkę wszyscy sojusznicy otrzymują tyle do Trafienia, Obrony i zadawanych Obrażeń ile wynosi premia z Ogłady Dyplomaty. Efekt ten utrzymuje się przez jedną rundę.
                     III Stopień: raz na starcie/walkę wybrany sojusznik Dyplomaty może wykonać jeden darmowy atak, którego Trafienie i Obrażenia zwiększane są o premię z Ogłady Dyplomaty. Zdolność może być aktywowana w dowolnym momencie walki i traktowana jest przez wybrańca jako Umiejętność Pasywna.")

skill = Skill.create(:profession_type => "Dyplomata",
                     :name => "Złote Usta",
                     :way_it_works => "niepowodzenie lub wyjątkowy pech podczas testu może spowodować, że postać popadnie w tarapaty (decyzja MG).
                     I Stopień: w zależności od sytuacji, postać może ułatwić wykonanie jednej z następujących akcji wybranemu sojusznikowi (dyplomata tylko odwraca uwagę); dodanie trucizny, okradzenie ofiary, umożliwienie ucieczki, itp. działania, poprzez obniżenie Spostrzegawczości ofiary. Aby się to udało należy wygrać przeciwstawny test Inteligencji (między Dyplomatą a ofiarą), w którym Dyplomata zwiększa szansę o premię ze swej Ogłady. Umiejętnie zbałamucona ofiara staje się łatwiejszym celem otrzymując -10pkt do testu Spostrzegawczości.
                     II Stopień: wybrana postać o niższym statusie społecznym, która przegrała w przeciwstawnym teście Ogłady musi wykonać polecenie Dyplomaty. Zdolność nie działa podczas walki i może być użyta tylko względem ludzi. Ponadto rozkaz nie może zagrażać życiu ofiary ani być sprzeczny z jej moralnością, wiarą bądź innym ważnym czynnikiem (decyzja MG). Niepowodzenie podczas testu oznacza, iż Dyplomata nie będzie mógł próbować wykorzystać „Złotych Ust” na ofierze w przeciągu najbliższej doby. Ponadto osoba, która obroniła się w teście otrzymuje kumulatywną premię +5pkt do wszystkich innych testów tej zdolności inicjowanych przez Dyplomatę (oczywiście nie zawsze będzie to możliwe, decyzja MG).
                     III Stopień: jw. przy czym działa na każdą klasę społeczną. Modyfikatory przyznawane podczas przekonywania innych osób to: -10pkt podczas rozmowy z innym dyplomatą, -5pkt ze Szlachcicem, -10pkt z wielmożą i -15pkt z księciem, lordem protektorem lub samym królem.")

skill = Skill.create(:profession_type => "Dyplomata",
                     :name => "Rozproszenie",
                     :way_it_works => "zdolność działa tylko i wyłącznie na ludzkich przeciwników, może być aktywowana raz na każde starcie/walkę i tylko podczas potyczki z samym Dyplomatą. Osoby ogarnięte szałem lub fanatyzmem stają się całkowicie odporne na „Rozproszenie”.
                     Umiejętność Pasywna
                     I Stopień: wybrany przeciwnik otrzymuje karę do Trafienia i zadawanych Obrażeń w walce z Dyplomatą równą premii z jego Ogłady. Zdolność utrzymuje się przez jedną rundę.
                     II Stopień: wybrany przeciwnik otrzymuje karę do Trafienia, Obrony i Obrażeń, równą premii z jego Ogłady, która utrzymuje się przez dwie rundy.
                     III Stopień: wybrany przeciwnik otrzymuje karę do Trafienia, Obrony i Obrażeń przez ilość rund równą premii z Ogłady Dyplomaty.")

skill = Skill.create(:profession_type => "Dyplomata",
                     :name => "Charyzmatyczny Mówca",
                     :way_it_works => "podczas dyskusji Dyplomata może próbować zmienić nastawienie rozmówcy wobec siebie lub sprawy, którą reprezentuje. Efekt ten rzadko będzie działał na innych graczy (decyzja MG).
                     Umiejętność Pasywna
                     I Stopień: raz na sesję Dyplomata może przerzucić dowolny test związany z Ogładą jeżeli pierwszy wynik nie był satysfakcjonujący (zdolność ta nie może być użyta aby wspomóc innego Wpływu Dyplomaty).
                     II Stopień: raz na dzień Dyplomata może wyciągnąć potrzebną informację od wybranej osoby. Pozyskanie wiadomości odbywa się na zasadzie zwyczajnej rozmowy, zastraszenia lub przeprowadzając przesłuchanie. Zdolności tej nie można użyć więcej niż raz względem tej samej osoby jeżeli poruszany jest wciąż ten sam temat. Całość testu sprawdzana jest na zasadzie przeciwstawnego rzutu na Ogładę, który należy odpowiednio zmodyfikować. MG ustala poziom trudności, szef gildii nie podzieli się z nim tak po prostu informacjami, dlatego kara powinna być wysoka np.: -10pkt. Ponadto Dyplomata nigdy nie będzie w stanie za pomocą niniejszej umiejętności zmusić kogoś do podjęcia tragicznych bądź niezwykle niebezpiecznych decyzji. MG decyduje ile czasu zajmuje wykorzystanie tej umiejętności i jakie są jej skutki.
                     III Stopień: raz na sesję Dyplomata może użyć swych wpływów, glejtu, immunitetu lub powiązań aby uniknąć wyjątkowo niebezpiecznej sytuacji np.: aresztowania, przesłuchania lub zaatakowania. Decyzja należy do MG i okoliczności towarzyszących temu wydarzeniu. Ciężko będzie przekonać atakujących barbarzyńców aby go nie zabili, itp. Aby skutecznie użyć tej zdolności musi wykonać udany test Ogłady obłożony karą przyznaną przez MG w zależności od problemu/sytuacji w wysokości od -5pkt do -25pkt.")


#####FIRCYK
#Fircyk (żołnierz)
#Fircyk (łotr)

skill = Skill.create(:profession_type => "Fircyk (żołnierz)",
                     :name => "Idealny Cios",
                     :way_it_works => "raz na starcie/walkę, pierwszy Trafiony atak w tej rundzie traktowany jest jako „Trafienie Krytyczne”. Zdolność nie może być wykorzystana podczas strzelania.")


skill = Skill.create(:profession_type => "Fircyk (żołnierz)",
                     :name => "„Bliźniak”",
                     :way_it_works => "raz na walkę z danym przeciwnikiem po udanym Trafieniu, Fircyk zyskuje jeden dodatkowy, natychmiastowy atak wybraną przez siebie bronią.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "28" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "15" )

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
                     :name => "Idealny Cios",
                     :way_it_works => "raz na starcie/walkę, pierwszy Trafiony atak w tej rundzie traktowany jest jako „Trafienie Krytyczne”. Zdolność nie może być wykorzystana podczas strzelania.")



skill = Skill.create(:profession_type => "Fircyk (łotr)",
                     :name => "„Bliźniak”",
                     :way_it_works => "raz na walkę z danym przeciwnikiem po udanym Trafieniu, Fircyk zyskuje jeden dodatkowy, natychmiastowy atak wybraną przez siebie bronią.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "28" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "15" )

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
                     :name => "Rzucanie czarów",
                     :way_it_works => "postać jako jedna z nielicznych na świecie posiadła tajemne moce i umiejętności dzięki, którym potrafi rzucać Czary Maga (szczegóły w dziale Magia).")

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
s_choice.stats_modifiers.create(:modifies => "power level", :value => 0, :group_name => "3k10") #TODO ...     if 0 then parse group name

skill = Skill.create(:profession_type => "Mag",
                     :name => "Grimuar",
                     :way_it_works => "postać zdobyła starożytną księgę, w której może odnaleźć niezwykłą wiedzę. Za każdym razem kiedy zdobywa nowy poziom wykonuje rzut k10, jeżeli uzyska rezultat w przedziale 1-3 otrzymuje jeden, dodatkowy, wybrany przez siebie czar (z dostępnej dla swojej profesji listy). Ponadto za każdym razem kiedy wykonuje test wiedzy związanej z magią, religią, mitycznymi stworami, itp. otrzymuje premię +5pkt.
Umiejętność Pasywna." )

skill = Skill.create(:profession_type => "Mag",
                     :name => "Doskonała Rytmika",
                     :way_it_works => "Inicjatywa postaci zwiększana jest o +2pkt. Ponadto za każdym razem kiedy bohater ma otrzymać karę do testu Splecenia Magii (podwyższony poziom trudności) wartość ta zmniejszona jest o 5pkt, np.: mag rzuca czar, w trakcie splatania otrzymał cios i stracił 10PŻ. Oznacza to podwyższenie poziomu trudności zaklęcia o 10pkt, dzięki tej umiejętności kara zmniejszana jest do 5pkt.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "23" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Blitz" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 2, :group_name => "Inicjatywa")


### Kapłan

skill = Skill.create(:profession_type => "Kapłan",
                     :name => "Słowo Boże",
                     :way_it_works => "człowiek wiary, przedstawiciel Boga na Ziemi, obdarzony przez niego niezwykłą mocą, potrafi przemawiać Słowem Bożym. Za jego pomocą może zmieniać świat i ludzi. Postać otrzymała od samego Boga lub jego Apostoła Modlitwy, które należy odszukać w rozdziale Magia.")



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
s_choice.stats_modifiers.create(:modifies => "casting", :value => 2, :group_name => "Rzucanie czarów")

skill = Skill.create(:profession_type => "Kapłan",
                     :name => "Wiara mą Tarczą",
                     :way_it_works => "zmniejsza Obrażenia wywołane przez magię (nie dotyczy ciosów zadanych umagicznioną bronią) o premię z Wiary.
Wiara postaci podnoszona jest o +1pkt.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WI", :value => "30" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "Kapłan",
                     :name => "Wiedza Niebios",
                     :way_it_works => "raz na sesję Kapłan może zaczerpnąć boskiej mocy i rzucić znaną sobie Modlitwę z Poziomu wyżej, np.: Kapłan na Poziomie 3 może rzucić Modlitwę tak jakby był na Poziomie 5.
Umiejętność Pasywna.")

###Łotr

skill = Skill.create(:profession_type => "Łotr",
                     :name => "Szczęście Kastora",
                     :way_it_works => "postać udoskonaliła swoje techniki dzięki czemu korzystanie z następujących umiejętności: „Kradzież kieszonkowa”, „Otwieranie zamków”, „Wykrywanie i Niszczenie pułapek”, „Szulerka”, „Szarlataneria”, „Ucieczka i Wyzwalanie się z Więzów” ułatwione jest o +2pkt/poziom Łotra. Oznacza to, że każdy test sprawdzający jedną z powyższych zdolności jest jej łatwiej wykonać, np.: postać próbuje okraść beztroskiego kupca, jej Zręczność wynosi 26pkt, a kara przyznana przez MG równa jest 5pkt (poziom przeciętny), następnie bohater otrzymuje premię +2pkt za poziom. W takim przypadku udaje mu się okraść ofiarę na rzucie 23pkt lub niżej.
                     Ponadto jeżeli jakiś efekt ma w losowy sposób wybrać na cel Łotra, MG rzuca ponownie. Dotyczy to wszystkich negatywnych zdarzeń losowych tj: pułapki, zasadzki, strzały, itp., w których ślepy los wybiera swój cel. Oczywiście jeżeli przy drugim rzucie ponownie wypadnie na Łotra nic na to nie można już poradzić.")


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


### ODRZUCONY

skill = Skill.create(:profession_type => "Odrzucony",
                     :name => "Wchłonięcie/Odbicie",
                     :way_it_works => "zdolność może zostać użyta przeciw dowolnemu zaklęciu, które zostało skierowane na postać, przed rzutem obronnym (dotyczy też czarów obszarowych, które skierowane są lub dosięgną Odrzuconego). Aby sprawdzić czy udało się wchłonąć lub zniszczyć czar, postać wykonuje rzut k30 zwiększony o premię ze swojej Inteligencji. Wynik musi być wyższy niż poziom trudności czaru uzyskany przez wrogiego maga, który dodatkowo zwiększony jest o wartość jego „Przełamania”. Przed sprawdzeniem wyniku, gracz musi zdecydować się czy próbuje wchłonąć energię czaru czy go odbija. W pierwszym przypadku otrzymuje +5pkt do testu, albowiem łatwiej jest mu wchłonąć moc aniżeli ją odbić a udany wynik oznacza całkowite zniszczenie czaru i wszystkich jego efektów. Druga umiejętność odbija czar w dowolny, wybrany przez Odrzuconego cel – nawet w samego czarodzieja.
                     II Stopień: jw. a Odrzucony otrzymuje dodatkowe +5pkt do testów Wchłonięcia/Odbicia.
                     III Stopień: Odrzucony może wykonać dwa rzuty związane z konfrontacją mocy i wybiera korzystniejszy wynik, ponadto otrzymuje premię do wyniku równą +10pkt.
                     Umiejętność Pasywna.")

skill = Skill.create(:profession_type => "Odrzucony",
                     :name => "Ostrze Antymagii",
                     :way_it_works => "raz na dzień postać może „nasączyć” broń, którą włada (oręż przeznaczony do walki wręcz) dzięki czemu przebija nią wszystkie magiczne aury (ich wartość wynosi wtedy zero), zapory i bariery magiczne, po prostu je rozcina, dzięki czemu trwale je niszczy. Ostrze Antymagii aktywne jest przez 10rund a wszystkie istoty, które zranić można tylko za pomocą magii lub magicznej broni, stają się całkowicie podatne na ataki tak nasączonego oręża. Akcja ta zajmuje 1pkt Tempa i traktowana jest na zasadach Umiejętności Pasywnej.
                     II Stopień: jw. a broń otrzymuje dodatkową moc: za każdym razem kiedy Odrzucony za jej pomocą zabije lub zniszczy istotę posiadającą punkty Mocy broń przejmuje część jej esencji i na stałe zwiększa zadawane Obrażenia o +1pkt. Efekt ten jest trwały tak więc nie trzeba go aktywować, po prostu oręż jest „ostrzejszy” i zadaje coraz więcej ran (maksymalnie można zwiększyć ilość zadawanych Obrażeń o wartość premii z Inteligencji Odrzuconego). Ponadto standardowa moc „Ostrza Antymagii” utrzymuje się do końca starcia/walki Odrzuconego.
                     III Stopień: jw. ponadto jeżeli Odrzucony zadał tak nasączoną bronią chociaż jedną ranę istocie posiadającej punkty Mocy zmusza ją do wykonania testu Inteligencji zmniejszonego o 2pkt za każdy posiadany poziom Doświadczenia. Niepowodzenie przeciwnika oznacza utratę wszystkich posiadanych przez niego punktów Mocy (nie działa na jego Amulety, itp. przedmioty).
                     Uwaga: tak przygotowana broń nadal w normalny sposób musi przebić zbroje i pancerze, chociaż pozbawia ich swoich nadzwyczajnych zdolności bądź podwyższonej odporności na ciosy.")

skill = Skill.create(:profession_type => "Odrzucony",
                     :name => "Niszczenie Magii",
                     :way_it_works => "raz na 24godziny postać może zniszczyć dotknięty gołą dłonią magiczny przedmiot. Proces ten ma tak niszczycielską i destrukcyjną moc, że przedmiot zazwyczaj rozpada się w pył lub w ciągu mgnienia oka niszczeje. Umiejętność obarczona jest pewną dozą ryzyka i tak Odrzucony musi wykonać rzut odpowiednią liczbą kości. W przypadku zwyczajnego przedmiotu 3k10, przy potężniejszym 4k10, przy artefakcie 5k10, a przy niezwykłych reliktach nawet 6-10k10. Za każdą wylosowaną 1-nkę otrzymuje k20 ran przed, którymi nie chroni żadna zbroja. Umiejętność zajmuje całą Rundę.
                     II Stopień: umiejętność zyskała nowe możliwości dzięki czemu może być w analogiczny sposób wykorzystana do niszczenia magicznych mikstur (trucizny, eliksiry, itp.) działających na dotkniętą przez Odrzuconego postać. Warto jednak pamiętać o tym, że nie jest on w stanie rozpoznać działania ani przeznaczenia czy chociażby samej obecności specyfiku w wybranym organizmie. Po prostu może zadeklarować, że chce zniszczyć wszystkie toksyny i inne magiczne płyny znajdujące się w ofierze. Umiejętność może zostać wykorzystana raz na 12godzin i zajmuje całą rundę.
                     III Stopień: Odrzucony może wyssać magię z istoty (odbiera wszystkie pkt mocy), która znajduje się od niego nie dalej niż 10metrów. Akcja zajmuje całą rundę (efekt osiąga na końcu rundy co oznacza że mag dysponuje swoimi PKT Mocy do jej zakończenia). Umiejętność może być użyta raz na 24godzin, a ofierze nie przysługuje żaden rzut obronny.")

skill = Skill.create(:profession_type => "Odrzucony",
                     :name => "Oczyszczenie",
                     :way_it_works => "raz na 24godziny postać może wyzwolić umysł dowolnej postaci (ręką dotyka jej głowy) z czarów wpływających na jej postrzeganie świata, opętanie, itp. efektów. Zastosowanie Oczyszczenia na sobie sprawia, że wzrok Odrzuconego przebije każdą iluzję. Umiejętność trwa przez 3k10rund i ujawnia większość sztuczek magicznych oddziałujących na umysł. Zdolność nie odkrywa prawdziwej natury demonów bądź nieumarłych i nie działa na postacie, które zmieniły wygląd za pomocą charakteryzacji lub np.: przemiany. Umiejętność zajmuje całą Rundę.
                     II Stopień: Odrzucony może oczyścić wybrane miejsce lub przedmiot z wpisanej Runy (postać widzi wszystkie Runy jako świecące znaki). Musi ją dokładnie widzieć i nie może być od niej oddalony o więcej niż metr/poziom. Umiejętność zajmuje całą Rundę.
                     III Stopień: zdolność może być wykorzystana raz na 12godzin zgodnie z zasadami opisanymi na I Stopniu. Za jej pomocą Odrzucony rozpoznaje istoty ukryte w ludzkich ciałach tj.: martwiaki i demony, wyczuwa ich wpływ i inne działania (czy kontrolują ich ciała, itp.), ujawnia istoty eteryczne i niematerialne. Moc Umiejętności utrzymuje się przez godzinę/poziom i może być aktywowana raz na 12godzin, jej aktywowanie zajmuje całą Rundę.")

skill = Skill.create(:profession_type => "Odrzucony",
                     :name => "Niewrażliwość na Magię",
                     :way_it_works => "wszystkie efekty czarów, zaklęć i modlitw (oczywiście jeżeli jest to możliwe) odnoszą tylko połowiczny sukces względem Odrzuconego. Oznacza to, że w przypadku kiedy ma otrzymać jakieś Obrażenia dostaje tylko połowę wylosowanej wartości. Oczywiście nadal przysługuje mu rzut obronny przed danym efektem magicznym, który jeżeli będzie udany dodatkowo połowi obrażenia (co oznacza, że otrzyma tylko 1/4Ran). Ponadto bohater zyskuje Odporność na Magię +10pkt. Wyżej wymienione zasady traktowane są jako Umiejętność Pasywna jednak działają zawsze czy tego chce czy nie.
                     II Stopień: jw. przy czym Odporność na Magię podnoszona jest o koleje +10pkt (razem o +20pkt).
                     III Stopień: jw. a sam Odrzucony zmuszony do wykonania jakiegokolwiek testu wywołanego przez magię zawsze automatycznie go zdaje.")



###RYCERZ

skill = Skill.create(:profession_type => "Rycerz",
                     :name => "Duma Rycerska",
                     :way_it_works => "raz na walkę z danym przeciwnikiem Rycerz może po nietrafionym ciosie przerzucić test Trafienia zwiększając swoją szansę o 3pkt.")

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
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "variable_auxiliary", :evaluated_instruction => "Statistics::BONUS_OR_PENALTY_RANGES[calculate_wt]", :group_name => "Punkty Życia")


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
s_choice.stats_modifiers.create(:modifies => "money", :value => 50000, :group_name => "domyślne")

######Rycerz Zakonny


skill = Skill.create(:profession_type => "Rycerz Zakonny",
                     :name => "Potęga Patrona",
                     :way_it_works => "raz na dzień Rycerz Zakonny może użyć każdej z poniższych zdolności na zasadach Umiejętności Pasywnej:

                     Oręż Boga; każdy cios, który trafił Demona lub Martwiaka zadaje mu dodatkowe 10pkt Ran, a tak natchniona broń (trzymana przez postać) przeciw ww. istotom traktowana jest jako magiczna. Aktywowanie Umiejętności zajmuje 1pkt Tempa. Efekt utrzymuje się do końca starcia/walki.

                     Boża Aura; Rycerz Zakonny może wytworzyć wokół siebie ochronną barierę, która powstrzymuje jeden efekt magiczny wywołany przez Wrogów Wiary dotyczy to także umiejętności martwiaków i demonów, ale tylko wtedy kiedy celem jest Rycerz. Stworzenie aury zajmuje 1pkt Tempa i utrzymuje się przez k10+1godzinę/poziom postaci lub do pierwszej aktywacji.

                     Słowo Prawdy; używając tej zdolności Rycerz próbuje na pytanej osobie wymóc szczerą odpowiedź. Sprawdzamy to przeciwstawnym testem jego Wiary przeciw Inteligencji lub Wierze ofiary w zależności od tego, który z tych parametrów jest wyższy. Jeżeli test się powiódł ofiara musi odpowiedzieć zgodnie z prawdą (postać, która nie chce wyjawić prawdy może powstrzymać się od mówienia jednakże z chwilą kiedy zechce rozmawiać z rycerzem musi odpowiedzieć zgodnie z faktami) w przeciwnym wypadku odpowiada co chce. Uzyskanie automatycznego sukcesu w teście zmusza przesłuchiwanego do dokładnej i szczerej odpowiedzi.")


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
                     :name => "Zimna Krew",
                     :way_it_works => "raz na sesję za każdy poziom doświadczenia postaci, Strzelec może przerzucić dowolny nietrafiony strzał (dotyczy broni strzeleckiej czyli kusz, łuków lub procy).")

skill = Skill.create(:profession_type => "Strzelec",
                     :name => "Im bliżej tym lepiej",
                     :way_it_works => "wszystkie strzały/bełty wystrzelone na Bliski zasięg zadają ofierze dodatkowe 3pkt Obrażeń.
Umiejętność Pasywna.")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )


skill = Skill.create(:profession_type => "Strzelec",
                     :name => "Odległość nie ma Znaczenia",
                     :way_it_works => "kara wynikająca ze strzelania na zasięg inny niż Bliski zmniejszana jest o premię ze Zręczności Strzelca. Daleki zasięg broni strzeleckiej używanej przez postać zwiększony jest o 25metrów, a jej Umiejętności Strzeleckie wzrastają o +2pkt.
Umiejętność Pasywna.")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 2, :group_name => "Umiejętności Strzeleckie")


skill = Skill.create(:profession_type => "Strzelec",
                     :name => "Wyśmienity Naciąg",
                     :way_it_works => "zadawane przez postać Obrażenia z dowolnej broni dystansowej podnoszone są o +2pkt.
Zręczność bohatera wzrasta o +1pkt.
Umiejętność Pasywna.")
skill.skill_requirements.create(:check_applies_to => "experience", :value => "5" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
#TODO Implement it ! along with other dmg perks  - modifies "melee_damage" and applicables in group name

skill = Skill.create(:profession_type => "Strzelec",
                     :name => "Mistrz Kuszników",
                     :way_it_works => "Tempo ładowania kuszy zmniejszone jest o 1rundę. Jeżeli ilość rund potrzebnych do załadowania broni spadnie do zera, postać może strzelić i napiąć kuszę w tej samej rundzie. W przypadku oddania strzału na początku rundy, Strzelec może naładować broń ale zajmie mu to całą rundę. W chwili kiedy nie ma przygotowanej do strzału kuszy napięcie zajmuje całą rundę i z jej końcem oddaje strzał (identycznie jak w przypadku czarów całorundowych).
Obrażenia zadawane dowolną kuszą zwiększane są o +1pkt.
Umiejętność Pasywna")

skill.skill_requirements.create(:check_applies_to => "experience", :value => "3" )
#TODO Implement it ! along with other dmg perks  - modifies "melee_damage" and applicables in group name
#TODO only for crossbows
#TODO reduce loadtime of a crossbows


###SZAMAN
skill = Skill.create(:profession_type => "Szaman",
                     :name => "Mistrz Żywiołów",
                     :way_it_works => "szaman wybiera przewodni żywioł. Od teraz wszystkie wrogie efekty magiczne oparte na tym aspekcie mają zmniejszoną moc i efekty do połowy (np.: ilość otrzymanych ran, itp.). Ponadto zaklęcia opierające się na tym żywiole, które rzuca Szaman mają zwiększone obszar/promień i/lub zasięg o połowę. Przełamanie takich czarów podnoszone jest o +2pkt.
Umiejętność Pasywna.")


skill = Skill.create(:profession_type => "Szaman",
                     :name => "Przymierze z Duchami",
                     :way_it_works => "raz na dzień postać może rzucić zaklęcie związane z Duchami nie wydając na niego żadnych PM.")


skill = Skill.create(:profession_type => "Szaman",
                     :name => "Zaklęcia Szamańskie",
                     :way_it_works => "człowiek związany z naturą i światem duchów, potrafi rozmawiać z przodkami, przywoływać ich duchy a nawet zmuszać je do posłuszeństwa. Dysponuje wrodzonym talentem, który na pierwszy rzut oka przypomina umiejętności Maga, jednakże jego zaklęcia, rytuały, tańce i śpiewy są odmienne i tylko on może je okiełznać. Postać potrafi rzucać zaklęcia Szamana (patrz rozdział Magia)..")


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
                     :way_it_works => "Atak i Obrona jednej z następujących broni (całej grupy): Noże, Sztylety lub Łamacz Mieczy podnoszone są o +1pkt. Pierwsza rana zadana przeciwnikowi w walce wręcz wymusza na nim test Bólu.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Wybrana grupa broni(Kłuta Puginały i Sztylety,Sieczno / Kłująca Noże,Łamacz mieczy), Atak+1 and Obrona+1")

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
                     :way_it_works => "Fechtunek w wybranej Grupie Broni podnoszony jest o +1pkt. Ponadto bohater zwiększa zadawane w walce wręcz Obrażenia o +3pkt (nie dotyczy strzelania i Bijatyki).
Umiejętność Pasywna.")

#TODO Implement it ! along with other dmg perks  - modifies "melee_damage" and applicables in group name
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "33" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "S", :value => "20" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "3" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Fechtunek w Grupie Broni")
s_choice.stats_modifiers.create(:modifies => "melee_damage", :value => 3, :group_name => "Except shooting and boxing")


 skill = Skill.create(:profession_type => "Zabójca",
                     :name => "Skrytobójca",
                     :way_it_works => "postać potrafi doskonale ukrywać posiadaną broń, wie jak ją przemycić tak aby nikt jej nie wykrył (decyzja MG). Stosowny test na Spostrzegawczość wykonywany jest z karą od -5pkt do -20pkt. Ponadto za każdym razem kiedy bohater deklaruje atak z zaskoczenia lub wyprowadza cios, którego przeciwnik się nie spodziewa, zyskuje jeden, natychmiastowy atak. Cios rozpatrywany jest przed rundą, a jego Obrażenia zwiększane są o +1pkt/poziom.
Korzystając z umiejętności Krycie się i Cichy Chód osoby które mają być zaskoczone/zwiedzione przez Zabójcę otrzymują dodatkową karę do Spostrzegawczości w wysokości -5pkt.
Inicjatywa postaci wzrasta o +1pkt.
Umiejętność Pasywna.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 1, :group_name => "Inicjatywa")

