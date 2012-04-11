# -*- encoding : utf-8 -*-

##################STRZELECKIE##########################3


skill = Skill.create(:profession_type => "shooter",
                     :name => "Głęboka Rana",
                     :limitations => "tylko dla broni Strzeleckich.",
                     :way_it_works => "raz na rundę kiedy postać trafi bronią dystansową, rzut na Obrażenia wykonywany jest za pomocą 2k20 i gracz wybiera korzystniejszy wynik. Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )

skill = Skill.create(:profession_type => "shooter",
                     :name => "Doskonały Strzał",
          :limitations => "tylko dla broni Strzeleckich.",
                     :way_it_works => "postać musi poświęcić jeden atak (strzał) na przycelowanie. Dzięki czemu kolejny strzał zmniejsza wartość Pancerza/Zbroi przeciwnika do połowy.
Ponadto Tempo wszystkich ataków w Łukach obniżane jest o 2pkt do minimum 1pkt.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "27" )

skill = Skill.create(:profession_type => "shooter",
                     :name => "Doświadczony Strzelec",
          :limitations => "tylko dla broni Strzeleckich.",
                     :way_it_works => "postać nie otrzymuje żadnej kary za celowanie do walczących postaci. Ponadto wyrzucenie w takim przypadku „Jedynki” oznacza tylko nietrafienie (strzała nie sięga innej losowo wybranej osoby). Dodatkowo postać otrzymuje o połowę mniejszą karę strzelając do źle widocznego celu (dotyczy deszczu, mgły, itp. sytuacji).
Umiejętności Strzeleckie postaci podnoszone są o +1pkt.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "experience", :value => "3")
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Pewny Strzal" )


s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Umiejętności Strzeleckie")

skill = Skill.create(:profession_type => "shooter",
                     :name => "Kusznik",
          :limitations => "tylko używając Kuszy",
                     :way_it_works => "ładowanie kuszy Typowej i Ciężkiej zajmuje o jedną rundę mniej.
Umiejętności Strzeleckie bohatera wzrastają jest o +1pkt.
Umiejętność Pasywna." )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Umiejętności Strzeleckie")

skill = Skill.create(:profession_type => "shooter",
                     :name => "Mierzony Strzał",
          :limitations => "tylko dla broni strzeleckich.",
                     :way_it_works => "postać otrzymuje +5pkt do Trafienia, kosztem zwiększenia Tempa broni strzeleckiej o +5pkt." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "20" )

skill = Skill.create(:profession_type => "shooter",
                     :name => "Pewny Strzał",
          :limitations => "tylko dla broni strzeleckich",
                     :way_it_works => "kara do Trafienia wynikająca ze strzelania na zasięg Średni, Daleki i Maksymalny zmniejszona jest o 5pkt.
Obrażenia w broniach dystansowych wzrastają o +1pkt.
Umiejętność Pasywna" )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Mierzony Strzał" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "28" )

s_choice = skill.stats_choices.create
#TODO !!! Obrażenia w broniach dystansowych wzrastają o +1pkt.  melee_damage ?

skill = Skill.create(:profession_type => "shooter",
                     :name => "Precyzyjny Strzał",
          :limitations => "tylko dla broni strzeleckich",
                     :way_it_works => "Trafienie ataku zmniejszane jest o -3pkt, w zamian za to pancerz ofiary redukowany jest o ilość punktów równą przekroczeniu Obrony celu. Umiejętność może być wykorzystana tylko na Bliskim zasięgu.
Np.: łucznik posiada 25pkt Trafienia (po odjęciu 3pkt za Precyzyjny Strzał), Obrona Daleka jego przeciwnika wynosi 35pkt, po rzucie na Trafienie (k30 równym np.: 16pkt) otrzymujemy wynik 41pkt co oznacza, że Obrona celu została przekroczona o 6pkt. W tym przypadku wartość pancerza celu zmniejszana jest o 6pkt, ale nie więcej niż do połowy swej podstawowej wartości – zgodnie z podstawowymi zasadami dotyczącymi przebijania zbroi." )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Mierzony Strzał" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )

skill = Skill.create(:profession_type => "shooter",
                     :name => "Seria",
          :limitations => "tylko dla Łuków Prosty i Refleksyjnych",
                     :way_it_works => "postać zyskuje jeden atak we wszystkich Łukach.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "30" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "4")

skill = Skill.create(:profession_type => "shooter",
                     :name => "Strzał w Dziesiątkę",
          :limitations => "tylko dla broni Strzeleckich",
                     :way_it_works => "kara za celowanie w głowę zmniejszona jest o 5pkt. Z zasady tej można również skorzystać podczas strzelania do małych obiektów, co zawsze obłożone jest odpowiednią karą.
Obrażenia w broniach dystansowych wzrastają o +1pkt.
Umiejętność Pasywna")

skill.skill_requirements.create(:check_applies_to => "experience", :value => "3")
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Mierzony Strzał" )
s_choice = skill.stats_choices.create
#TODO !!! Obrażenia w broniach dystansowych wzrastają o +1pkt.  melee_damage ?

skill = Skill.create(:profession_type => "shooter",
                     :name => "Wcelowanie",
          :limitations => "tylko dla broni Strzeleckich",
                     :way_it_works => "po spudłowaniu, postać otrzymuje +5pkt do Trafienia. Premia ta dotyczy następnego strzału, a atak musi być wykonany przeciw temu samemu celowi.
Zręczność postaci wzrasta o +1pkt.
Umiejętność Pasywna")

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Mierzony Strzał" )
s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "ZR", :value => 1, :group_name => "domyślne")

skill = Skill.create(:profession_type => "shooter",
                     :name => "Wrażliwe Miejsce",
          :limitations => "tylko dla broni Strzeleckich",
                     :way_it_works => "Obrażenia w każdej broni dystansowej jaką posługuje się bohater zwiększone są o +3pkt.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )
s_choice = skill.stats_choices.create
#TODO !!! Obrażenia w broniach dystansowych wzrastają o +3pkt.  melee_damage ?

skill = Skill.create(:profession_type => "shooter",
                     :name => "Zaawansowane Wrażliwe Miejsce",
          :limitations => "tylko dla broni Strzeleckich",
                     :way_it_works => "jeżeli strzał zada przynajmniej 1ranę, ofiara musi wykonać test Bólu z karą -5pkt. Niepowodzenie, ponad standardowe kary, przerywa wykonywaną przez postać czynność (anuluje atak, czar, a nawet przerywa bieg czy sprint). ")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "28" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "2")

