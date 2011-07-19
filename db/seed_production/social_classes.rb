['Niewolnik',
'Chłop Ubogi',
'Chłop Bogaty',
'Mieszczanin Ubogi',
'Mieszczanin',
'Mieszczanin Bogaty',
'Szlachcic Zaściankowy',
'Szlachcic',
'Wielmoża'].each do |s_class|
 SocialClass.create(:name => s_class) unless SocialClass.exists?(:name => s_class)
end

