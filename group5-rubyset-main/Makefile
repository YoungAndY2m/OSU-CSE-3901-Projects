#Run to install gosu libray and all the dependencies
install_gosu_w/sudo: install_gosu
						sudo gem install gosu

install_gosu: install_ruby_dev
				gem install gosu
install_ruby_dev: install_Libraries
					sudo apt-get install ruby-dev
install_Libraries: 
					sudo apt-get install build-essential libsdl2-dev libgl1-mesa-dev libopenal-dev libgmp-dev libfontconfig1-dev

run_game:
			ruby SetGame.rb
#Run to install all gems
install_gem: 
				bundle install