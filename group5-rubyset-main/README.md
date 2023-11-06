# Group5-rubyset

## Summary
  "Set" is a card game in which players attempt to find three cards that satisfy basic rules. Twelve cards are displayed on the table, and players would select the cards that form a set. Our group managed to use Ruby and GUI to display the game virtually on the computer. You could play solo or with friends. Enjoy the game! 
  
  [Reference: www.setgame.com/sites/default/files/instructions/SET%20INSTRUCTIONS%20-%20ENGLISH.pdf]

- Optional functions added:
    1. Timer added with sound effect
    2. Hint generator added
    3. A graphical-front end display
    4. Solo or multiple players
    Please enjoy!


## Gem installed before playing the game:
- gem install colorize
- gem install win32-sound (If you use Windows operating system)
- gem install ruby-debug-ide
- gem install debase
- gem install solargraph
- gem install gosu steps:
     
     // Dependencies for both C++ and Ruby
   
   sudo apt-get install build-essential libsdl2-dev libgl1-mesa-dev libopenal-dev \
                         libgmp-dev libfontconfig1-dev

   
   // To install Ruby itself - if you are using rvm or rbenv, please skip this step
   
   sudo apt-get install ruby-dev

    
    // If you are using a Ruby version manager (i.e. rvm or rbenv)
   
   gem install gosu
   
   // If you are using system Ruby, you will need "sudo" to install Ruby libraries (gems)
   
   sudo gem install gosu
   
   [Reference: https://github.com/gosu/gosu/wiki/Getting-Started-on-Linux]

## Visual Studio Code Extension installed:
- Code Runner
- Ruby
- Ruby Solargraph
- VSCode Ruby (automatically installed after you install Ruby extension)

## How to run the view.rb:
- After you open the vscode, go to folder group5-rubyset,
- Type "make install_gem" in the console, to install all the needed gems for this project
- Type "make install_gosu_w/sudo" in the console, to install gosu gem and the needed libraries
- Type "make run_game" in the console, to start the Game

The command for the terminal: VirtualBox: ~/group5-rubyset$ make run_game or ~/group5-rubyset$ruby SetGame.rb

## Player instruction:
 - Welcome to Game of Sets! 
 - The timer will start running when you start playing. Choose three cards to form a set and click submit to check your answer. 3 points will be earned if it is a set. You can choose to play solo or with others. Click on the icon of your player to highlight it when checking your answer. The player with the highest score wins when the game ends. 
 - The hints icon will highlight one of three cards that can form a set when you click on it. Click on the green plus sign when you find no more sets on the table. Another three cards will only appear when there are no sets. Good luck and Enjoy!

 P.S. There is a message saying "AL lib: (EE) alc_cleanup: 1 device not closed" when you close the window. However, there's no harm with it. It is part of the problem regarding gem gosu.

## Team members:
- Andrews Kontoh
- Chaobo Cai
- Yang Li
- Olivia Ridge
- Thomas Ghebremariam
