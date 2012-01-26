##################STRZELECKIE##########################3

skill = Skill.create(:profession_type => "shooter",
                     :name => "Doskonały Strzał",
          :limitations => "tylko dla broni Strzeleckich.",
                     :way_it_works => "postać musi poświęcić jeden atak na przycelowanie. Dzięki czemu kolejny strzał zmniejsza wartość Pancerza/Zbroi przeciwnika do połowy.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "27" )

skill = Skill.create(:profession_type => "shooter",
                     :name => "Doświadczony Strzelec",
          :limitations => "tylko dla broni Strzeleckich.",
                     :way_it_works => "postać nie otrzymuje żadnej kary za celowanie do walczących postaci. Ponadto wyrzucenie w takim przypadku „Jedynki” oznacza tylko nietrafienie (strzała nie sięga innej losowo wybranej osoby). Dodatkowo postać otrzymuje o połowę mniejszą karę strzelając do źle widocznego celu (dotyczy deszczu, mgły, itp. sytuacji). Umiejętności Strzeleckie postaci podnoszone są o +1pkt.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "experience", :value => "3")
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Pewny Strzal" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "WI", :value => "18" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Umiejętności Strzeleckie")

skill = Skill.create(:profession_type => "shooter",
                     :name => "Kusznik",
          :limitations => "tylko używając Kuszy",
                     :way_it_works => "ładowanie kuszy Typowej i Ciężkiej zajmuje o jedną rundę mniej. Ponadto Trafienie w tym typie broni podnoszone jest o 1pkt.
Umiejętność Pasywna." )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Kusze")   #TODO OMG... will I ever be able to standarize fighting bonuses?

skill = Skill.create(:profession_type => "shooter",
                     :name => "Mierzony Strzał",
          :limitations => "tylko dla broni strzeleckich.",
                     :way_it_works => "postać otrzymuje +5pkt do Trafienia, kosztem zwiększenia Tempa broni strzeleckiej o +5pkt." )

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "20" )

skill = Skill.create(:profession_type => "shooter",
                     :name => "Pewny Strzał",
          :limitations => "tylko dla broni strzeleckich",
                     :way_it_works => "kara do Trafienia wynikająca ze strzelania na zasięg inny niż Bliski zmniejszona jest o premię ze Zręczności postaci. Umiejętności Strzeleckie bohatera wzrastają o +1pkt.
Umiejętność Pasywna." )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Mierzony Strzał" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "28" )

s_choice = skill.stats_choices.create
s_choice.stats_modifiers.create(:modifies => "fighting", :value => 1, :group_name => "Umiejętności Strzeleckie")

skill = Skill.create(:profession_type => "shooter",
                     :name => "Precyzyjny Strzał ",
          :limitations => "tylko dla broni strzeleckich",
                     :way_it_works => "Tempo strzału zwiększone jest o +3pkt a Trafienie zmniejszane o -3pkt, w zamian za to pancerz ofiary redukowany jest o ilość punktów równą przekroczeniu Obrony celu. Umiejętność może być wykorzystana tylko na Bliskim zasięgu." )

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Mierzony Strzał" )
skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )

skill = Skill.create(:profession_type => "shooter",
                     :name => "Seria",
          :limitations => "tylko dla Łuków Prosty i Refleksyjnych",
                     :way_it_works => "po zadeklarowaniu umiejętności, postać może w rundzie wykonać jeden dodatkowy strzał z łuku. Tempo ataku pozostaje bez zmian, natomiast kara do Trafienia wynosi -5pkt. Zdolność utrzymuje się przez rundę/poziom postaci i może być użyta raz na starcie/walkę.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "4")

skill = Skill.create(:profession_type => "shooter",
                     :name => "Strzał w Dziesiątkę",
          :limitations => "tylko dla broni Strzeleckich",
                     :way_it_works => "kara za celowanie w głowę zmniejszona jest o 5pkt. Z zasady tej można również skorzystać podczas strzelania do małych obiektów, co zawsze obłożone jest odpowiednią karą.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "experience", :value => "3")
skill.skill_requirements.create(:check_applies_to => "skill", :name => "Mierzony Strzał" )

skill = Skill.create(:profession_type => "shooter",
                     :name => "Wcelowanie",
          :limitations => "tylko dla broni Strzeleckich",
                     :way_it_works => "po spudłowaniu, postać otrzymuje +5pkt do Trafienia. Premia ta dotyczy następnego strzału, a atak musi być wykonany przeciw temu samemu celowi.
Umiejętność Pasywna.")

skill.skill_requirements.create(:check_applies_to => "skill", :name => "Mierzony Strzał" )

skill = Skill.create(:profession_type => "shooter",
                     :name => "Wrażliwe Miejsce",
          :limitations => "tylko dla broni Strzeleckich",
                     :way_it_works => "kosztem zwiększenia Tempa strzału o +5pkt, postać zadaje o +3pkt Obrażeń więcej.")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "25" )

skill = Skill.create(:profession_type => "shooter",
                     :name => "Wrażliwe Miejsce",
          :limitations => "tylko dla broni Strzeleckich",
                     :way_it_works => "po wyuczeniu się tej zdolności, postać może używać umiejętności „Wrażliwe Miejsce” zgodnie z zasadami „Umiejętności Pasywnej”. Ponadto Tempo strzału przy wykorzystaniu tej zdolności nie jest zwiększane.
Umiejętność Pasywna")

skill.skill_requirements.create(:check_applies_to => "statistics", :name => "ZR", :value => "28" )
skill.skill_requirements.create(:check_applies_to => "experience", :value => "2")

