# -*- encoding : utf-8 -*-
User.create!(:email => "socjopata@gmail.com", :password => ::SecureRandom.hex(16), :admin => true )
User.create!(:email => "durgill@interia.pl", :password => ::SecureRandom.hex(16), :admin => true )

User.all.each {|u| u.update_attribute(:admin, true)}