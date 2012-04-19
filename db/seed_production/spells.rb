# -*- encoding : utf-8 -*-

profession = Profession.find_by_name("Mag")
["Mistrz Oręża", "Zaklęcie Hakona", "Moc Światła", "Tarcza Qira", "Władca Mrozu", "Zbroja Gorlanda", "Głosy", "Zaklęcie Jagor'a", "Grzmot", "Iluzja Nathaniela", "Animacja Darghula", "Zaklęcie Talhiora", "Wola Umysłu", "Mistrz Umysłu", "Upokorzenie Altanidasa", "Amulet Saldarski ", "Kula Wejrzenia", "Wzrok Calhora", "Sztuczka Waldarisa", "Golem"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1)
end

profession = Profession.find_by_name("Czarnoksiężnik")

["Oczy Strachu", "Ciemność Gallarda", "Maska", "Postarzenie", "Aura Cierpienia", "Abominacja", "Lalka", "Pochwycenie", "Przyzwanie", "Kontakty z Umarłymi", "Sługa Prawdy", "Wyssanie Życia", "Wyssanie Duszy", "Uścisk Xargosa", "Moc Księżyca", "Zmrocz", "Dance Macabre", "Przemiana", "Mgły Śmierci", "Aura Sirtol"].each_with_index do |spell_name, i|
  Spell.create(:name => spell_name, :profession_id => profession.id, :index => i+1)
end

#szaman
["Duchy Ognia", "Duchy Powietrza", "Duchy Wody", "Duchy Ziemi", "Duchy Nieba", "Duchy Piasku i Pyłu", "Duchy Przodków", "Duchy Natury", "Kontrola Zwierząt", "Rytuał Odporności", "Kamuflaż", "Moc Natury", "Harmonia Natury", "Kontrola Pogody", "Totem Psa", "Totem Ślimaka", "Totem Pancernika", "Matka Ziemia", "Totemiczna Przemiana", "Fetysze"]
