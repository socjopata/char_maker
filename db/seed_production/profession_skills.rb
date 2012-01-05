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

