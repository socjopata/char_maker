# -*- encoding : utf-8 -*-
## -*- encoding : utf-8 -*-
#



skill = Skill.create(:profession_type => "scholar",
                     :name => "Adept Magii",
                     :way_it_works => "postać ignoruje wyrzucenie „Jedynki” (nigdy nie może mieć Pechowego Splecenia Magii) podczas rzucania czarów/modlitw. Ponadto zwiększa swoją szansę na „Doskonałe Splecenie Magii” o 1pkt (czyli wynik 29 i 30 podczas rzucania czaru).
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "28" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Moc Krwi" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Amulet Mocy",
                     :way_it_works => "aby stworzyć Amulet, postać musi przygotować niewielki przedmiot (pierścień, wisiorek, itp.), który nasącza swą Mocą. Tak powstały przedmiot zawiera w sobie ilość Mocy równą dwukrotnej Premii z Inteligencji i Wiary postaci. Czerpać można z niego w dowolnym momencie, jednakże raz użyte punkty przepadają i należy je powtórnie „Naładować” (poświęcając analogiczną ilość Mocy). Postać może posiadać tylko jeden taki amulet (kiedy stworzy nowy, stary rozpada się w pył). Pobranie mocy z amuletu należy traktować jako Umiejętność Pasywną." )


skill.skill_requirements.create(:check_applies_to => "statistics", :name => "OR: INT,WI", :value => "30" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Runy Proste" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Analiza Magii",
                      :description => "postać potrafi przeprowadzić analizę magii, wyczuć jej źródło, poznać jej moc i ograniczenia. Zdaje sobie sprawę z możliwości ukrytych w przedmiotach bądź czarach pętających badanych nieszczęśników. Dzięki tej umiejętności można również wyczuć działanie magii lub potężne efekty, które miały miejsce jakiś czas temu – decyzja MG.",
                     :way_it_works => "Aby sprawdzić czy udało się jej zrozumieć i ogarnąć dany przedmiot bądź aurę należy wykonać rzut k30 zwiększony o premię z Inteligencji i 1pkt za każdy posiadany poziom. Wynik musi przekroczyć poziom przedmiotu, aury bądź bariery – dokładne zasady w rozdziale Magii. Każde badanie kosztuje 1pkt Mocy i zabiera od jednej minuty aż do kilku godzin w zależności od potęgi przedmiotu bądź klątwy; decyzja Mg.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "21" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Runy Proste" )
skill.skill_requirements.create(:check_applies_to => "caster_class", :name => "Posiadanie Mocy" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Astrologia",
                      :description => "postać posiada tajemną wiedzę o gwiazdach i konstelacjach niebieskich. Dzięki czemu może uchylić rąbek tajemnicy dotyczący przyszłości danej osoby. Ponadto potrafi określić swoje położenie w terenie, wyznaczyć kurs, itd.",
                      :way_it_works => "Raz w miesiącu Astrolog może próbować odczytać przeznaczenie wybrańca. Ujawniony los nie może ulec zmianie. Aby spróbować odgadnąć przyszłość, bohater musi wykonać test Inteligencji, nieudany oznacza, iż wybraniec i jego przyszłość jest w tym miesiącu nieodgadniona, a każda następna próba automatycznie skazana jest na porażkę. Sukces w teście oznacza wykonanie rzutu k10 z następującymi efektami:
„1” klątwa, pech i nieszczęście; gracz będzie musiał przerzucić jeden, udany test wybrany przez MG (w tym miesiącu),
„2-3” bez efektu; wizja postaci jest zamglona i całkowicie niejasna,
„5-10” uważaj na...; astrolog ostrzega przed nadciągającym niebezpieczeństwem (bez szczegółów, ani informacji, które mogłyby wpłynąć na sesję). W nadchodzącym miesiącu bohater może przerzucić jeden, nieudany test.
Astrolog może próbować odgadnąć własną przyszłość.
Inteligencja postaci podnoszona jest o +1pkt.")

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Wykształcenie Akademickie" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "scholar",
                     :name => "Blitz",
                     :way_it_works => "wszystkie czary, Modlitwy i zaklęcia nie będące rytuałami mają zmniejszone Tempo o 2pkt.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "22" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Chowaniec",
                     :way_it_works => "postać łączy swe życie z wybranym zwierzęciem. Wybór istoty jest niezwykle ważny, a czarodzieje najczęściej decydują się na taki gatunek, który da im największe możliwości. Jeżeli postaci uda się znaleźć i pozyskać odpowiednie zwierzę może związać je magiczną, wieczną więzią. Profity i korzyści wynikające z połączenia są następujące:
Poprzez koncentrację postać potrafi odbierać myśli chowańca, dodatkowo może słyszeć i widzieć to co zwierzę.
Z biegiem czasu zwierzę staje się coraz bardziej Inteligentne. Znane są przypadki kiedy bystrością umysłu dorównywało niejednemu człowiekowi.
Czarodziej z chowańcem połączeni są magiczną więzią, która nie może być niczym rozdzielona.
Śmierć czarodzieja oznacza natychmiastowy zgon chowańca, natomiast w odwrotnym przypadku bohater traci k10pkt Wytrzymałości i Inteligencji (efekt jest permanentny) i może ponownie wykupić tą umiejętność aby pozyskać kolejnego.
Chowaniec żyje tak długo jak czarodziej (czyli właściwie się nie starzeje).
Raz pozyskanego chowańca nie można odrzucić, zostaje się z nim do końca życia.
W tym samym czasie można posiadać tylko jednego Chowańca.
Na Chowańca można wybrać: ssaka, gada, płaza lub ptaka (nie dotyczy mitycznych bestii).")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "23" )
skill.skill_requirements.create(:check_applies_to => "caster_class", :name => "Posiadanie Mocy" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Dogłębne Studia",
                     :way_it_works => "bohater otrzymuje jeden, wybrany czar/Modlitwę, pochodzący z listy zaklęć przynależnych do jego profesji.
Uwaga: umiejętność ta może być wybrana wielokrotnie, każdorazowo dając nowy czar.")


skill.skill_requirements.create(:check_applies_to => "caster_class", :name => "Posiadanie Mocy" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Gromadzenie Mocy",
                     :way_it_works => "przed rzucaniem czaru, bohater może zadeklarować gromadzenie i podsycanie swej mocy przez „X” najbliższych rund. Czar musi zostać rzucony normalnie po czym mag wydaje 1pkt Mocy za każdą rundę gromadzenia, jednak nie dłużej niż jedną dodatkową rundę na każdy posiadany poziom. Za każdą dodatkową rundę wartość „Przełamania” wzrasta o 3pkt. Umiejętności tej nie można użyć przy rzucaniu rytuałów. Czar, którego moc była gromadzona, uwalniany jest przez czarodzieja na początku następnej, wybranej rundy. Jeżeli efekt czaru zadaje Obrażenia wartość ta jest podwajana, wymóg; należy rzucać zaklęcie minimum 2rundy, itd. decyzja MG.
Rzucanie czarów/modlitw postaci wzrasta o +1pkt.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "22" )
skill.skill_requirements.create(:check_applies_to => "caster_class", :name => "Posiadanie Mocy" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "casting", :value => 1, :group_name => "Rzucanie czarów")


skill = Skill.create(:profession_type => "scholar",
                     :name => "Język Klasyczny",
                     :way_it_works => "bohater poznał język klasyczny, który używany jest przez znakomitą większość uczonych, magów i kapłanów tego świata. Zważywszy na jego złożoność i komplikację oraz fakt, iż nie wiele osób chce się tą wiedzą dzielić postać, której udało się go wyuczyć zaliczana będzie do elity intelektualnej świata. Bohater potrafi mówić i pisać w języku Klasycznym.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "15" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Krwawa Ofiara",
                     :way_it_works => "za każdym razem kiedy postać za pomocą magii (czaru, modlitwy, itp.) uśmierci człowieka odzyskuje 1pkt Życia i Mocy za każdy posiadany poziom doświadczenia.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "OR: INT,WI", :value => "32" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "3")


skill = Skill.create(:profession_type => "scholar",
                     :name => "Medycyna",   #TODO check name
                     :description => "szkoła, którą ukończył bohater oferuje pełną wiedzę medyczną jaka jest dostępna w cywilizowanym świecie. Postać potrafi nastawiać kości, tamować krwotoki, zwalczać choroby, itd. W zależności od przypadku może potrzebować odpowiednich narzędzi lub leków (decyzja MG).",
                     :way_it_works => "Zasada działania: aby poprawnie przeprowadzić zabieg należy wykonać udany test Inteligencji. MG odpowiednio modyfikuje rzut w zależności od komplikacji zabiegu, stanu narzędzi i wszystkich innych ważnych czynników. Oto kilka modyfikatorów:
- krwotok -2pkt, złamanie -3pkt, złamanie otwarte -6pkt,
- czyste i sprawne narzędzia +1pkt,
- brak odpowiednich narzędzi i miejsca do zabiegu od -2pkt do -5pkt,
- asysta wykwalifikowanej osoby +2pkt.
Bohater rozpoczyna grę posiadając leki (w tym również eliksiry i zioła) o wartości nie większej niż 200sztuk złota.
Inteligencja postaci podnoszona jest o +1pkt.")

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Leczenie Ran i Chorób" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Wykształcenie Akademickie" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "20" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "scholar",
                     :name => "Medytacja",
                     :description => "postać potrafi wprowadzić swój umysł w niezwykły stan skupienia dzięki, któremu wprowadza się w trans powszechnie zwany Medytacją, która oczyszcza ze zmęczenia jego ciało i duszę.",
                     :way_it_works => "Zasada działania: Za każdą pełną godzinę spędzoną na Medytacji postać regeneruje 6pkt Mocy oraz całkowicie odnawia swoje siły witalne, pozbywając się efektów zwykłego zmęczenia. Bohater pogrążony w tak głębokim transie właściwie całkowicie odcina się od otoczenia a wyjść z niego może dopiero po upływie założonego czasu lub pod wpływem silnych bodźców takich jak krzyki, uderzenie lub kubeł zimnej wody. Po przebudzeniu postać potrzebuje całej rundy na dojście do siebie jest lekko nieprzytomna i zdezorientowana. Bohater zwiększa swoją Inteligencję o +1pkt.")

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Podstawy Medytacji" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "26" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "scholar",
                     :name => "Mistrz Czarów",
                     :way_it_works => "postać zwiększa parametr Rzucanie Czarów/Modlitw o +2pkt. Umiejętność może zostać wybrana wielokrotnie, każdorazowo dając kolejną premię.
Umiejętność Pasywna.")
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Moc Krwi" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "casting", :value => 2, :group_name => "Rzucanie czarów")   #TODO implement it

skill = Skill.create(:profession_type => "scholar",
                     :name => "Mistrz Magii",
                     :description => "postać potrafi wprowadzić swój umysł w niezwykły stan skupienia dzięki, któremu wprowadza się w trans powszechnie zwany Medytacją, która oczyszcza ze zmęczenia jego ciało i duszę.",
                     :way_it_works => "postać zwiększa swoją szansę na „Doskonałe Splecenie Magii” o 1pkt (Krytyk na 28, 29 i 30). Ponadto za każdym razem kiedy uda jej się tego dokonać podnosi wynik uzyskany w tabeli Doskonałego Splecenia Magii o +3pkt.
Umiejętność Pasywna.")
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Adept Magii" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "5")


skill = Skill.create(:profession_type => "scholar",
                     :name => "Mistrz Rytuałów",
                     :way_it_works => "koszt wszystkich rytuałów, które odprawia czarodziej zmniejszony jest o -5pkt, a ich Trudność spada o -3pkt.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Adept Magii" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Moc Krwi" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "3")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "30" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Moc Krwi",
                     :way_it_works => " czarodziej może zaczerpnąć Moc bezpośrednio z organizmu. Ten niesamowity wysiłek niesie ze sobą ryzyko utraty przytomności, co sprawdzane jest testem Bólu z karą równą -5pkt. Test wykonywany jest po zaczerpnięciu mocy i rzuceniu zaklęcia. Mag może otrzymać tyle mocy ile zada sobie ran w stosunku jeden do jednego. Postacie, które nie są szaleńcami nigdy nie mogą zaczerpnąć więcej Mocy niż posiadają PŻ. Utracone w ten sposób PŻ powracają szybciej niż po odniesieniu zwyczajnych ran, w Tempie 3pkt/dzień odpoczynku; taki proces leczniczy nadal może być przyspieszony przez standardowe leczenie, mikstury czy czary.")

skill = Skill.create(:profession_type => "scholar",
                     :name => "Nieomylność",
                     :way_it_works => "postać może wykonać drugi test na rzucenie czaru/modlitwy jeżeli pierwszy wynik nie był satysfakcjonujący. MG po rzucie, który nie zapewnił sukcesu powinien zapytać gracza czy chce rzucić powtórnie albowiem aktualny rezultat nie będzie dla niego satysfakcjonujący. Drugi wynik jest ostateczny, nawet jeżeli był niższy od pierwszego. Umiejętność ta chroni przed pechowym rzuceniem czaru, ale tylko kiedy doszło do tego w pierwszym rzucie.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "22" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Odporność na Magię",
                     :way_it_works => "postać zwiększa swoją Odporność na Magię o +3pkt. Zdolność może zostać wykupiona wielokrotnie każdorazowo podnosząc ten parametr.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WT", :value => "16" )
skill.skill_requirements.create(:check_applies_to => "caster_class", :name => "Posiadanie Mocy" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Odporność na Magię")

skill = Skill.create(:profession_type => "scholar",
                     :name => "Podstawy Medytacji",
                     :way_it_works => "postać potrafi wprowadzić swój organizm w głęboki trans, dzięki czemu odnawia siły psychiczne. Za każdą godzinę spędzoną na medytacji bohater odzyskuje 4pkt Mocy.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "15" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Potęga Doświadczenia",
                     :way_it_works => "„Przełamanie” postaci zostaje zwiększone o 2pkt +1pkt/pięć poziomów doświadczenia (na 5p. 3Pkt, na 10p. 4Pkt, itd.).
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "31" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Mistrz Magii" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "6")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "casting", :value => 2, :group_name => "Przełamanie") #TODO if we ever go above 1 lvl, we need to fix this

skill = Skill.create(:profession_type => "scholar",
                     :name => "Perfekcjonizm",
                     :way_it_works => "postać doskonali się w jednym wybranym czarze, osiągając w nim perfekcję. Dzięki temu koszt czaru (Moc) zmniejszony jest o połowę, zaokrąglając na korzyść gracza. Trudność zaklęcia spada o 5pkt, Tempo o 2pkt natomiast wartość Przełamania czaru zwiększona jest dodatkowo o +2pkt. Uwaga: umiejętność ta może być wybrana wielokrotnie, dając każdorazowo specjalizację w innym czarze/Modlitwie.
    .")


skill.skill_requirements.create(:check_applies_to => "skill", :name => "Nieomylność" )
skill.skill_requirements.create(:check_applies_to => "caster_class", :name => "Posiadanie Mocy" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Potęga Magii",
                     :way_it_works => "czary, które zadają Obrażenia mają zwiększoną siłę działania. Ofiara zaklęcia otrzymuje o 2rany +1ranę/poziom rzucającego więcej np.: Mag na 3poz. normalnie zadając 2k10Ran, z tą umiejętnością zada 2k10+5Ran.
Umiejętność Pasywna.")


skill.skill_requirements.create(:check_applies_to => "statistics", :name => "OR: INT,WI", :value => "25" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Potęga Spokoju",
                     :way_it_works => "postać musi poświęcić jedną rundę na koncentrację. W tym stanie nie może wykonywać żadnych innych czynności i jest całkowicie bezbronna. Za każdym razem kiedy stanie się celem wrogiego czaru/modlitwy, jego twórca musi dwukrotnie wygrać w teście Przełamania aby pokonać bohatera (wykonuje dwa Testy Przełamania i wybiera mniej korzystny wynik). Zdolność utrzymuje się przez godzinę/poziom Postaci.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "experience", :value => "5")
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "25" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WI", :value => "25" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Potęga Umysłu",
                     :way_it_works => "bohater na stałe podnosi swoją Moc o 2k10pkt, a jego Przełamanie wzrasta o +1pkt.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "22" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WI", :value => "22" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Moc Krwi" )


s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "casting", :value => 1, :group_name => "Przełamanie")
s_choice.stats_modifiers.create(:modifies => "power level", :value => 0, :group_name => "2k10") #TODO ...     if 0 then parse group name


skill = Skill.create(:profession_type => "scholar",
                     :name => "Religioznawstwo",
                    :description => "księgi, zapiski, zbiory archiwalne oraz liczne ustne przekazy. Wiedza gromadzona przez wiele lat zapewnia postaci znajomość mitów, legend, podań oraz historii religii. Bohater zna podstawowe dogmaty i założenia wiary, wie kiedy wypadają święta kościelne, pamięta przywódców zakonów, wielkich mędrców wiary i inne znamienite osoby związane z religią. ",
                     :way_it_works => "postać zdobyła ogromną i rozległą wiedzę dotyczącą religii, mitów i legend. Zapoznała się z dogmatami oraz wierzeniami cywilizowanych krajów jak i zapomnianych cywilizacji. Aby sprawdzić czy wybrane zagadnienie lub fakt jest jej znany musi wykonać udany rzut na swój Inteligencję. W przypadku wiedzy, która nie jest znana publicznie: starożytne zapiski, tajne informacje, dogmaty zapomnianej wiary, legendy i mity z odległych krain MG musi przyznać stosowny modyfikator.
Wiara bohatera podnoszona jest o +1pkt.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Wykształcenie Akademickie" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "WI", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "scholar",
                     :name => "Rozproszenie i Niszczenie Magii",
                     :way_it_works => "postać posiadła umiejętność niszczenia magii, nie tylko potrafi anulować trwałe efekty zawarte w przedmiotach ale również zgłębiła sztukę niszczenia najróżniejszych Barier i Aur magicznych. Za każdym razem kiedy bohater próbuje zniszczyć coś czego nie zna i nie rozumie musi ponieść tego konsekwencje. Przedstawione jest to w formie kary -10pkt do rzutu sprawdzającego czy udało mu się „Rozproszyć magię”. Sam rzut wygląda następująco: k30 plus premia z Inteligencji postaci zwiększone o 1pkt/poziom. Następnie otrzymany wynik zmniejszony jest o dwukrotną wartość przełamania Twórcy. Jeżeli końcowy rezultat będzie wyższy od rzutu uzyskanego podczas tworzenia przedmiotu, pułapki bądź aury, czarodziejowi udaje się zniszczyć cel i zdobywa 2k10pkt Mocy. Jeżeli mu się nie udało, pułapka natychmiast się aktywuje, aura lub bariera zostaje nienaruszona, a magia zawarta w przedmiocie zadaje 2k10Ran przed, którymi nie chroni żaden pancerz (nawet magiczne aury). Czas potrzebny na próbę zniszczenia to w przypadku: aury k10rund, bariery magicznej k10minut, a przedmiotu w zależności od jego potęgi około 2k10godzin. Niwelowanie efektów takich jak: „Oczarowanie” „Opętanie” bądź innych podobnych wpływów należy traktować jako próbę niszczenia aury. Każdorazowy koszt takiej akcji to k10pkt Mocy.")

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Analiza Magii" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "25" )


skill = Skill.create(:profession_type => "scholar",
                     :name => "Runy Proste",
                    :description => "księgi, zapiski, zbiory archiwalne oraz liczne ustne przekazy. Wiedza gromadzona przez wiele lat zapewnia postaci znajomość mitów, legend, podań oraz historii religii. Bohater zna podstawowe dogmaty i założenia wiary, wie kiedy wypadają święta kościelne, pamięta przywódców zakonów, wielkich mędrców wiary i inne znamienite osoby związane z religią. ",
                     :way_it_works => "postać poznała tajniki pisma runicznego potrafi w nim czytać i pisać. Bohater zyskuje wiedzę o Runach Prostych dzięki czemu może je rozpoznawać i analizować. Postać wybiera pięć z nich i od teraz może je tworzyć zgodnie z zasadami opisanymi w rozdziale: Magia.
")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "20" )
skill.skill_requirements.create(:check_applies_to => "caster_class", :name => "Posiadanie Mocy" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Runy Złożone",
                     :way_it_works => "jw. z tym, że postać poznaje pięć Run Złożonych lub Prostych.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "25" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Runy Proste" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "3")

skill = Skill.create(:profession_type => "scholar",
                     :name => "Runy Doskonałe",
                     :way_it_works => "jw. z tym, że postać poznała pięć Run Doskonałych, Złożonych lub Prostych.")


skill.skill_requirements.create(:check_applies_to => "skill", :name => "Runy Złożone" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "5")


skill = Skill.create(:profession_type => "scholar",
                     :name => "Mistrz Runów",
                     :way_it_works => "postać poznaje tajniki pięciu wybranych Run oraz zwiększa swoją Zręczność i Inteligencję o +1pkt, a Moc o +5pkt.")


skill.skill_requirements.create(:check_applies_to => "skill", :name => "Runy Doskonałe" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "7")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "power level", :value => 5) #TODO ...
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")


skill = Skill.create(:profession_type => "scholar",
                     :name => "Rzucanie Czarów bez Gestów",
                     :way_it_works => "postać do perfekcji opanowała rzucanie czarów, dzięki czemu nie potrzebuje wspomagać mocy inkantacji magicznymi znakami tworzonymi przez palce i dłonie. Rzucanie Czarów/Modlitw wzrasta o +1pkt, a ręce czarodzieja nie muszą tworzyć magicznych znaków (może coś w nich trzymać, mieć je związane, itp).
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "caster_class", :name => "Posiadanie Mocy" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "OR: INT,WI", :value => "30" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "25" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WI", :value => "25" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Starożytny Splot",
                    :limitations => "nie można korzystać ze zdolności „Rzucanie Czarów bez Gestów”",
                     :way_it_works => "zasięg wszystkich czarów dystansowych zostaje zwiększony o 15metrów. Umiejętność nie działa na magię, która wymaga Dotknięcia celu. Ponadto zaklęcia obszarowe mają powiększony promień/średnicę o 3metry.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "OR: INT,WI", :value => "31" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Tworzenie Mikstur",
                     :way_it_works => "postać posiadła kompletną wiedzę o wszystkich Zaawansowanych przepisach znajdujących się w rozdziale Alchemia. Potrafi je stworzyć, zna ich składniki i wie gdzie można je zakupić/znaleźć. Bohater zyskuje 100sztuk złota, które może wydać na eliksiry, mikstury i zioła od razu podczas tworzenia postaci.
                     Ponadto zwiększa swoją Zręczność o +1pkt.")

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")
skill.skill_requirements.create(:check_applies_to => "caster_class", :name => "Posiadanie Mocy" )
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Zielarstwo" )

skill = Skill.create(:profession_type => "scholar",
                     :name => "Zakazana Wiedza",
                    :description =>  "odwaga czy szaleństwo pchnęły postać ku tej jakże niebezpiecznej wiedzy? Chociaż większość ludzi nie chce wierzyć w demony i inne horrory tego świata, wybrańcy postanowili zrozumieć ich naturę i posiąść zdolność komunikacji z tymi przeklętymi stworzeniami. Powody są różne, niektórzy za pomocą tej wiedzy chcą chronić świat, inni, a tych jest zazwyczaj zdecydowanie więcej próbują wykorzystać tą moc dla swoich prywatnych ambicji.",
                     :way_it_works => " Postać potrafi mówić, czytać i pisać w zakazanym języku oraz zdobyła szeroką, a zarazem jakże niebezpieczną wiedzę. Aby uzyskać informację o Demonie lub Martwiaku, jakichś słabościach lub innych potrzebnych szczegółach MG musi wykonać test Inteligencji postaci odpowiednio zmodyfikowany.
Inteligencja Bohatera wzrasta o +1pkt, a Odporność na Strach o +3pkt.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "INT", :value => "22" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "INT", :value => 1, :group_name => "domyślne")
s_choice.stats_modifiers.create(:modifies => "auxiliary", :value => 3, :group_name => "Odporność na Strach")
