# -*- encoding : utf-8 -*-

profession = Profession.find_by_name("Mag")
["Mistrz Oręża", "Zaklęcie Hakona", "Moc Światła", "Tarcza Qira", "Władca Mrozu", "Zbroja Gorlanda", "Głosy", "Zaklęcie Jagor'a", "Grzmot", "Iluzja Nathaniela", "Animacja Darghula", "Zaklęcie Talhiora", "Wola Umysłu", "Mistrz Umysłu", "Upokorzenie Altanidasa", "Amulet Saldarski ", "Kula Wejrzenia", "Wzrok Calhora", "Sztuczka Waldarisa", "Golem"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1)
end

profession = Profession.find_by_name("Czarnoksiężnik")

["Oczy Strachu", "Ciemność Gallarda", "Maska", "Postarzenie", "Aura Cierpienia", "Abominacja", "Lalka", "Pochwycenie", "Przyzwanie", "Kontakty z Umarłymi", "Sługa Prawdy", "Wyssanie Życia", "Wyssanie Duszy", "Uścisk Xargosa", "Moc Księżyca", "Zmrocz", "Dance Macabre", "Przemiana", "Mgły Śmierci", "Aura Sirtol"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1)
end


profession = Profession.find_by_name("Kapłan")
deity = Deity.find_by_name!("Sirtol")
["Głos Sirtol",
 "Ceremoniał",
 "Sługa",
 "Klątwy",
 "Relikwia Sirtol",
 "Aura Wiary",
 "Księżycowy Rytuał",
 "Dominacja",
 "Księżycowy Pierścień",
 "Oręż Melchiora",
 "Dotyk Pierworodnej",
 "Oblicza Strachu",
 "Gniew Boży",
 "Ciernie Zmierzchu",
 "Opętanie",
 "Trucizna",
 "Zatajenie",
 "Aura Strachu",
 "Ostrza Śmierci",
 "Klątwa Halimmara"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Kastor")

["Szept Kastora",
 "Aura Strachu",
 "Aureola Świętości",
 "Ciernie Zmierzchu",
 "Gniew Boży",
 "Gorzkie Szepty",
 "Księżycowy Pierścień",
 "Oręż Melchiora",
 "Oblicza Strachu",
 "Relikwia Kastora",
 "Oblicze Kastora",
 "Opętanie",
 "Cienie Zdrady",
 "Szaleństwo Tarnhila",
 "Trucizna",
 "Umarlak",
 "Zamiana Kastora",
 "Zbroja Św. Aureliusza",
 "Dominacja",
 "Przyzwanie Terraki"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Smoczy Bóg")

["Potęga Przedwiecznego",
 "Relikwia Smoczego Boga",
 "Porażenie",
 "Ciernie Zmierzchu",
 "Gniew Boży",
 "Aura Wiary",
 "Ostatnie Namaszczenie",
 "Oręż Przedwiecznego",
 "Oblicza Strachu",
 "Znak Gorlanda",
 "Namaszczenie",
 "W Imię Boga",
 "Czarny Ogień",
 "Ogień Wiary",
 "Aura Strachu",
 "Gorzkie Szepty",
 "Smoczy Pancerz",
 "Amulet z Gargarot",
 "Ziemia Przedwiecznego",
 "Więzy Krwi"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Kalastra")

["Relikwia Kalastry",
 "Oratorium",
 "Dominacja",
 "Księżycowy Pierścień",
 "Szaleństwo Tarnhila",
 "Oczyszczenie",
 "Oręż Melchiora",
 "Gniew Kalastry",
 "Męczennik",
 "Zatajenie",
 "Ciernie Zmierzchu",
 "Tchnienie Kalastry",
 "Zbroja Boża",
 "Opętanie",
 "Umarlak",
 "Klątwy",
 "Sługa",
 "Aura Strachu",
 "Trucizna",
 "Gorzkie Szepty"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Syrion")

["Relikwia Syriońska",
 "Namaszczenie",
 "Oratorium",
 "Porażenie",
 "W Imię Boga",
 "Aureola Syriona",
 "Słoneczny Pierścień",
 "Aura Wiary",
 "Zbroja Boża",
 "Krew za Krew",
 "Sakrament Wiary",
 "Ostatnie Namaszczenie",
 "Aureola Świętości",
 "Boska Przemiana",
 "Pieśń do świętego Gredona",
 "Pieśń Walki",
 "Gniew Pana",
 "Stróż",
 "Słoneczny Blask",
 "Wola Syriona"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Alaj")

["Relikwia Alaja",
 "Poświęcenie",
 "Porażenie",
 "Balsam",
 "Aureola Syriona",
 "Słoneczny Pierścień",
 "Oczyszczenie",
 "Męczennik",
 "Łzy Pana",
 "Sakrament Wiary",
 "Drugi Policzek",
 "Boska Przemiana",
 "Zbroja Boża",
 "Aureola Świętości",
 "Ofiara",
 "Oratorium",
 "Pokora Alaja",
 "Stróż",
 "Klątwa Halimmara",
 "Miłosierdzie Zbawcy"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Calisto")

["Relikwia Calisto",
 "Poświęcenie",
 "Porażenie",
 "Balsam",
 "Aureola Syriona",
 "Słoneczny Pierścień",
 "Oczyszczenie",
 "Ochrona Niebios",
 "Moc Zwierząt",
 "Sakrament Wiary",
 "Gniew Calisto",
 "Kamuflaż",
 "Matka Ziemia",
 "Kontrola Pogody",
 "Harmonia z Naturą",
 "Moc Natury",
 "Rytuał Odporności",
 "Kontrola Zwierząt",
 "Duchy Natury",
 "Siła Natury"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

deity = Deity.find_by_name!("Durgil")

["Relikwia Durgila",
 "Namaszczenie",
 "Oratorium",
 "Porażenie",
 "W Imię Boga",
 "Aureola Syriona",
 "Słoneczny Pierścień",
 "Aura Wiary",
 "Zbroja Boża",
 "Krew za Krew",
 "Sakrament Wiary",
 "Ostatnie Namaszczenie",
 "Aureola Świętości",
 "Oczyszczenie",
 "Gniew Durgila",
 "Męczennik",
 "Znak Gorlanda",
 "Prawdziwe Męstwo",
 "Klątwy",
 "Amulet Dolmira"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end


#Magni
deity = Deity.find_by_name!("Magni")
profession = Profession.find_by_name("Szaman")

["Duchy Ognia",
 "Duchy Ziemi",
 "Duchy Nieba",
 "Totemiczna Przemiana Magniego",
 "Totem Pancernika",
 "Chwała Bitewna",
 "Furia Magniego",
 "Moc Zwierząt",
 "Rytuał Krwi",
 "Znaki Runiczne",
 "Matka Ziemia",
 "Kamuflaż",
 "Dary Gór",
 "Kontrola Pogody",
 "Harmonia Natury",
 "Moc Natury",
 "Rytuał Odporności",
 "Kontrola Zwierząt",
 "Przyzwanie Ducha",
 "Duchy Przodków"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

#Stepy - Kal Kalar
deity = Deity.find_by_name!("Kal-Kalar")

["Duchy Piasku i Pyłu",
 "Duchy Ziemi",
 "Duchy Powietrza",
 "Totemiczna Przemiana Stepów",
 "Totem Psa",
 "Władca Ognia",
 "Moc Kal-Kalar",
 "Światło Gwiazd",
 "Władca Wiatru",
 "Widmowi Wojownicy",
 "Matka Ziemia",
 "Kamuflaż",
 "Dary Stepów",
 "Kontrola Pogody",
 "Harmonia Natury",
 "Moc Natury",
 "Rytuał Odporności",
 "Kontrola Zwierząt",
 "Przyzwanie Ducha",
 "Duchy Przodków"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

#Północ
deity = Deity.find_by_name!("Galos i Malos")

["Duchy Wody",
 "Duchy Nieba",
 "Duchy Powietrza",
 "Totemiczna Przemiana Północy",
 "Totem Żółwia",
 "blank",
 "Potęga Braci",
 "blank",
 "Tatuaże Malosa",
 "Duchy Zimy",
 "Matka Ziemia",
 "Kamuflaż",
 "Dary Mórz",
 "Kontrola Pogody",
 "Harmonia Natury",
 "Moc Natury",
 "Rytuał Odporności",
 "Kontrola Zwierząt",
 "Przyzwanie Ducha",
 "Duchy Przodków"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

#Archipelag Południowy
deity = Deity.find_by_name!("Calisto")

["Oblicza Xargosa",
 "Słońce/upał",
 "blank",
 "blank",
 "blank",
 "blank",
 "blank",
 "blank",
 "blank",
 "blank",
 "Matka Ziemia",
 "Kamuflaż",
 "Dary Południa",
 "Kontrola Pogody",
 "Harmonia Natury",
 "Moc Natury",
 "Rytuał Odporności",
 "Kontrola Zwierząt",
 "Przyzwanie Ducha",
 "Duchy Przodków"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1, :deity_id => deity.id)
end

profession = Profession.find_by_name("Alchemik")

[
{:name => "Swietlik", :description => "na życzenie Alchemika (zazwyczaj jest to wybrane przez niego słowo), magiczny proszek zaczyna świecić jasnym, dziennym światłem. Specyfik ten najczęściej wsypywany jest do okrągłego, szklanego pojemnika umocowanego np.: na zwieńczeniu laski."},
{:name => "Maść Lecząca", :description => "po wypiciu tego specyfiku Alchemik widzi w ciemnościach (tak dobrze jak za dnia), mikstura działa również na magicznie ciemności."},
{:name => "Wodny Oddech", :description => "po wypiciu pozwala na oddychanie pod wodą, a na jej powierzchni nie pojawiają się żadne bąbelki powietrza świadczące o miejscu przebywania postaci. W trakcie działania płynu nadal można oddychać zwyczajnym powietrzem."},
 {:name => "Czystość Alaja", :description => "po posypaniu wybranego jedzenia lub płynu Alchemik oczyszcza go z wszelkich toksyn, trucizn i innych szkodliwych substancji (nawet magicznych). Za jego pomocą można również zamienić wodę słoną w słodką."}
]


[
    {:name => "Poliglota", :description => "po posypaniu proszkiem wybranej książki, która jest napisana w nieznanym alchemikowi języku, staje się ona dla niego czytelna. Jedna porcja wystarcza na dwie przeciętnych rozmiarów strony."},
    {:name => "Oczy Nocy", :description => "jedna porcja nałożona na rany postaci przywraca jej 5PŻ+1PŻ/poziom Alchemika. W przeciągu najbliższych 24godzin kolejne dawki nie mogą pomóc tej samej osobie. Moc Talentu nie uleczy uszkodzonych organów ani nie wyprowadza ze stanu agonalnego (przebitego płuca, itp.) jednakże może powstrzymać Krwawienie."},
    {:name => "Przełamanie Ciszy", :description => "po wciągnięciu proszku przez nos, Alchemik wyczula swój słuch, dzięki czemu może usłyszeć nawet najcichszą rozmowę prowadzoną w zasięgu Talentu. Tylko magia może zapobiec podsłuchiwaniu.."},
    {:name => "Letarg", :description => "po wtarciu maści w okolice serca, postać zapada w letarg trwający przez jeden dzień/poziom Alchemika. W tym czasie wstrzymane są podstawowe funkcje organizmu, działanie trucizn (właściwie wszystkich, decyzja MG), efekty agonii i krwawienia. Postać przypomina trupa, nie oddycha, nie posiada tętna, itp. Talent działa tylko na osoby, które nie bronią się przed jego działaniem oraz postacie nieprzytomne."}
]

[
    {:name => "Dymny Obłoczek", :description => "po rozsypaniu proszku, wokół Alchemika tworzy się chmura czarnego pyłu, w jej wnętrzu wszystkie żywe istoty nic nie widzą. Wyjątek stanowi sam Alchemik, martwiaki oraz demony, które widzą wewnątrz jak w półmroku. Silny wiatr niszczy efekt Talentu w ciągu jednej rundy.."},
    {:name => "Przyspieszenie", :description => "postać otrzymuje +1pkt do Inicjatywy za każdy poziom Alchemika. Ponadto zwiększa swoją Spostrzegawczość o +5pkt. Związane jest to z ogromnym wysiłkiem organizmu, dlatego też talent ten może być użyty tylko raz na dobę (24 godziny). Dodatkowo parametr Bieg postaci zwiększony jest o +5pkt."},
    {:name => "Ogłuszenie", :description => "proszek ten należy uformować w małe kuleczki, które po uderzeniu w coś twardego i na życzenie Alchemika wybuchają. Eksplozja powoduje potężny wstrząs oraz huk mogący powalić na ziemie wszystkie postacie w jego zasięgu za wyjątkiem samego Alchemika. Ofiary muszą wykonać udany test Bólu lub padają na ziemie tracąc przytomność na rundę/poziom. Ponadto niezależnie od wyniku testu otrzymują k10 +2Rany/poziom przed, którymi nie chroni żaden pancerz (osłony magiczne nadal działają)."},
    {:name => "Podmuch", :description => "po wysypaniu proszku na rękę Alchemik dmucha w niego tworząc potężny podmuch wiatru mogący powalić lub nawet porwać dorosłego mężczyznę. Każda ofiara znajdująca się na linii Podmuchu musi wykonać udany rzut na Siłę lub Zręczność (wyższy parametr) zmniejszoną o -2pkt/poziom Alchemika lub zostaje porwana przez wiatr i leci na odległość wyrażoną w metrach równą ilość punktów, o którą nie udało jej się zdać testu. Za każdy metr lotu otrzymuje 2pkt obuchowych Obrażeń bez możliwości skorzystania z ochrony ze zbroi. Należy również pamiętać o tym, że każda ofiara, która została porwana przez efekt talentu musi się podnieść z podłoża."}
]

 [
{:name => "Zamrożenie", :description => "po otwarciu fiolki zawierającej Talent, pobliska powierzchnia zostaje skuta lodem (automatycznie gasi ogień na tym obszarze, itp.). Wszystkie postacie znajdujące się na tym obszarze za wyjątkiem twórcy muszą wykonać udany test Zręczności zmniejszonej o 1pkt/poziom Alchemika lub przewracają się na ziemie. Jeżeli uda im się utrzymać równowagę ich Trafienie i Obrona zmniejszane są o -5pkt. Test Zręczności powtarzany jest na początku każdej rundy zanim postać wykona jakąkolwiek inną akcję. Magiczne efekty tj; Kula ognia, które zostaną skierowane na lód natychmiast go niszczą."},
{:name => "Ognisty Podmuch", :description => "zdmuchnięta z ręki (lub przy użyciu specjalnej rurki) porcja proszku tworzy ognisty stożek pędzący w wybranym przez Alchemika kierunku (po prostej linii). Wszystkie postacie znajdujące się na trasie ognia otrzymują k20ran +2rany/poziom twórcy lub połowę po udanym rzucie na Wytrzymałość. Kierunek i linia podmuchu sterowana jest przez Alchemika. Przedmioty łatwopalne, które znalazły się na drodze  ognistego jęzora automatycznie się zapalają (siano, oliwa, itp.) decyzja MG. Tylko magiczna aura może ochronić przed Obrażeniami wywołanymi przez ten Talent."},
{:name => "Burza Piaskowa", :description => "po rozsypaniu magicznego proszku Alchemik tworzy wokół siebie potężną burze piaskową, która pozostaje w miejscu stworzenia. W jej wnętrzu każda postać, która nie wykonała udanego testu Bólu zmniejszonego o -1pkt/poziom Alchemika zmniejsza swoje Trafienie, Obronę i Rzucanie Czarów o -10pkt. Ponadto pole widzenia ograniczone jest do 1metra. Żywe istoty będące wewnątrz powstałej sfery nie są w stanie usłyszeć niczego poza potwornym szumem. Alchemik, martwiaki jak i demony są całkowicie odporne na efekty tego Talentu. Ponieważ moc twórcy chroni go przez efektami burzy, Alchemik może normalnie walczyć, jednakże wszystkie przedmioty, które opuszczą jego ręce lub zostaną przez niego pozostawione porywane są natychmiast przez sztorm. Wewnątrz burzy nie można strzelać, wszystkie głosy i krzyki są całkowicie zagłuszone, a postacie znajdujące się na zewnątrz nie są w stanie niczego dostrzec w jej wnętrzu. "},
{:name => "Nie szata nas zdobi", :description => "po wypiciu jednej porcji, Alchemik staje się dla osób postronnych wyjątkowo charyzmatyczny, przystojny i elokwentny. Dzięki temu zwiększa swoją Ogładę o +10pkt. Ponadto właściwie zawsze traktowany jest jako osoba wywodząca się z szlachty nie zależnie od tego z jakiej klasy społecznej pochodzi oraz jak pełną sakiewkę posiada."}
]


#TODO add spell rquirements and attach these depemnding on the level