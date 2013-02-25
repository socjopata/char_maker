
   _____  .__                 __
  /  _  \ |  | _____    _____/  |______ _______
 /  /_\  \|  | \__  \  /    \   __\__  \\_  __ \
/    |    \  |__/ __ \|   |  \  |  / __ \|  | \/
\____|__  /____(____  /___|  /__| (____  /__|
        \/          \/     \/          \/


What you see here is a repository of an application that generates
characters for custom RPG system called Alantar.\
It’s goal is: when a player takes a new RPG book to his hand, everything
seems to be overwhelming at first glance.\
He might be excited to try it, but the process of creating a character
for play might be difficult at first and not everyone wants to use
example characters prepared by author of the book.

And here comes the online characters generator :)

Do you like it? Please consider endorsing me on Coderwall:

[![endorse](http://api.coderwall.com/socjopata/endorsecount.png)](http://coderwall.com/socjopata)

Environment
-----------

-   ruby <1.9.3-p194\> or newer
-   rails <3.2.11\>
-   bundler
-   gems are described in Gemfile and also some are packed by bundler
    into the project.
-   PostgreSQL <8.4\> or <9.1\>
-   wkhtmltopdf

### Developer Setup

    git clone git@github.com:socjopata/char_maker.git ~/projects/alantar_char_maker && cd ~/projects/alantar_char_maker
    # if using rvm acknowledge gemset creation
    bundle install

### Database Setup

    cp config/database.yml.example config/database.yml
    # customize credentials inside file. Or let perl do that for you :-)
    perl -i -p -e 's/<username>/$PG_USERNAME/g;' config/database.yml
    perl -i -p -e 's/<password>/$PG_PASSWORD/g;' config/database.yml
    rake db:setup

### Test suite

Be sure to setup test database and load seed data first. You can run the
suite by issuing:

    rspec

License
-------

I release this piece of code under MIT license.
