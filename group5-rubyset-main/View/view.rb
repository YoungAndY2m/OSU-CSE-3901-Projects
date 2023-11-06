require_relative 'viewCard'
require_relative '../Controller/controller'
require_relative 'viewSubmitButton'
require_relative 'viewPlayer.rb'
require 'gosu'

class Main < Gosu::Window
    attr_reader :table_cards_generated

    <<-doc
        initialize GUI window
    doc
    def initialize
        super(900, 625)
        self.resizable = true
        self.caption = "View 2"
        @controller = Controller.new
        @table_cards = @controller.model.table
        @table_cards_generated = []
        @cards_selected = []
        @background = Gosu::Image.new("./View/assets/images/backgroundImage.jpeg")
        @submitButton = SubmitButton.new(110,270, 100, 45)
        @addSymbol = AddSymbol.new(240, 270, 60, 60)
        @hintIcon = HintIcon.new(15,270,60,60)
        @players = []
        @numberOfPlayer = 5
        generate_cards
        createPlayers
        toggleSelectPlayer(@players[0])
        @font = Gosu::Font.new(30)
        @start_time = 0
        @beep_sound = Gosu::Song.new("./View/assets/images/tick2.ogg")
        @beep_sound.play(true)
        @beep_sound.volume=0.05
        @messageNumber = 0
        @messages = []
        @gameOver = false
        @hintArray = []
        @hintNumber = 0
        @gameOverImage = Gosu::Image.new("./View/assets/images/gameover.jpg")
        @winnerIds = []
        @displayPanelMessage = "        Welcome to Game of Sets! 
 The timer will start running when you start playing.
 Choose three cards to form a set and click submit 
 to check your answer. 3 points will be earned if it is a set. 
 You can choose to play solo or with others. Click on the icon 
 of your player to highlight it when checking your answer. 
 The player with the highest score wins when the game ends.
 The hints icon will highlight one of three cards that can form 
 a set when you click on it. The hint icon will not respond if 
 there's no set. Click on the green plus instead. Another three 
 cards will only appear when there are no sets. Game ends if
 the timers runs out to 0, or there is no set in the game. 
             Good luck and Enjoy!"

    end

    <<-doc
        Method extened from the Gosu::Window
        Update the window with corresponding information on both the game window and end game window
    doc
    def draw
        @background.draw(0, 0, 0)
        if !@gameOver
            @table_cards_generated.each do |card|
                draw_card card
            end
            @submitButton.draw
            @addSymbol.draw
            @hintIcon.draw
            drawPlayers
            drawNoticePanel @displayPanelMessage
            drawTimerBackground
            @font.draw_text(@time_left.to_s, 700, 20, 2)
        else
            @gameOverImage.draw(150, 50,1, 0.45, 0.2)
            @font.draw_text("End of Game, please close the window.", 304, 263, 3, scale_x = 0.5, scale_y = 0.5, color = 0xff_000000, mode = :default)
            drawWinners(@winnerIds)           
        end
    end

    <<-doc
        Update time remaining
    doc
    def update
        @time_left = (200-((Gosu.milliseconds - @start_time)/1000))
        @playing = false if (Gosu.milliseconds - @start_time)> 100_000
        endGame
        if @gameOver
            sleep 1
        end
    end

    <<-doc
        Creates card objects and pushs it into @table_cards_generated
    doc
    def generate_cards
        for i in 0...@table_cards.length do
            card = Card.new(@table_cards[i].card_name, i/3, i%3, false, i)            
            @table_cards_generated.push card
        end
    end

    <<-doc
        Create players 
    doc
    def createPlayers
        for i in 1..@numberOfPlayer do
            player = ViewPlayer.new(i, false)
            @players.push player
        end
    end

    <<-doc
        Changes the current player to player
        @param player:  New current player
    doc
    def toggleSelectPlayer(player)
        @players.each do |object|
            object.selected = false
            if player.playerId == object.playerId
                object.selected = true
                @currentPlayer = object.playerId
                @controller.setCurrentPlayer(object.playerId-1)
            end
        end
    end

    <<-doc
        Display Representation of players onto the game scene
    doc
    def drawPlayers
        green = 0xff_00ff00
        @players.each do |player|
            image = Gosu::Image.new("./View/assets/images/player#{player.playerId}.png")
            @font.draw_text(@controller.model.players[player.playerId - 1].score, player.boundary.left + 30, player.boundary.top-50, 3)
            image.draw(player.boundary.left, player.boundary.top, 2, 0.15, 0.15)
            if player.selected
                Gosu.draw_quad(player.boundary.left, player.boundary.top, green, player.boundary.left, player.boundary.bottom, green, player.boundary.right, player.boundary.bottom, green, player.boundary.right, player.boundary.top, green, 1)
            end
        end
    end

    <<-doc
        Display Winners on the Gameover Scene
        @param winnerIds:   list of winners
    doc
    def drawWinners(winnerIds)
        winnerImage = Gosu::Image.new("./View/assets/images/winner.png")
        winnerImage.draw(180, 330, 2, 0.3, 0.3)
        for i in 0...winnerIds.length do
            image = Gosu::Image.new("./View/assets/images/player#{winnerIds[i]}.png")
            @font.draw_text(@controller.getPlayer(winnerIds[i]).score.to_s, 370+ 80*i, 300 , 3)         
            image.draw(350+80*i, 370, 2, 0.160, 0.165)
        end
    end
    
    <<-doc
        Display the Notice panel in the middle
    doc
    def drawNoticePanel(message)
        green = 0xff_00ff00
        Gosu.draw_quad(330, 275, 0xff_F2D2E2, 330, 480, green, 700, 480, 0xff_008000, 700, 275, green, 2)
        @font.draw_text(message, 330, 280, 300, scale_x = 0.5, scale_y = 0.5, color = 0xff_000000, mode = :default)
    end
    
    <<-doc
        Display the changing color timer background
    doc
    def drawTimerBackground
        if @time_left<=20
            Gosu.draw_quad(698, 10, 0xff_FFA200, 698, 60, 0xff_EB3A21, 750, 60, 0xff_EB3A21, 750, 10, 0xff_EB3A21, 2)
        elsif @time_left<=100
            Gosu.draw_quad(698, 10, 0xff_FFA200, 698, 60, 0xff_FFC500, 750, 60, 0xff_FFC500, 750, 10, 0xff_FFC500, 2)
        else
            Gosu.draw_quad(698, 10, 0xff_18EDBE, 698, 60, 0xff_09FF00, 750, 60, 0xff_09FF00, 750, 10, 0xff_09FF00, 2)
        end
    end
    
    <<-doc
        Extention of a Callback function in gosu library
        Actions to take when buttons down
    doc
    def button_down(id)
        if id == Gosu::MsLeft
            if !@gameOver
                @table_cards_generated.each do |card|
                    if card.boundary.in_bound?(mouse_x, mouse_y)
                       toggle_select_card card
                    end 
                end
                @players.each do |player|
                    if player.boundary.in_bound?(mouse_x, mouse_y)
                        toggleSelectPlayer player
                    end
                end
                if @submitButton.boundary.in_bound?(mouse_x, mouse_y)
                    @hintNumber = 0
                    submitCardsSelected
                    generate_cards
                end
                if @addSymbol.boundary.in_bound?(mouse_x, mouse_y)
                    submitDealMoreCards
                end
                if @hintIcon.boundary.in_bound?(mouse_x, mouse_y)
                    submitGetHint
                end
            end
            
        elsif id ==Gosu::KbReturn
            submitCardsSelected
            generate_cards
        end
        @cards_selected.each do |card|
        end
    end
    
    <<-doc
        Displays coreesponding card image of a card on the screen
        @param card:    Card to display
    doc
    def draw_card(card)
        green = 0xff_00ff00
        image = Gosu::Image.new("./View/assets/images/#{card.card_name}.png")
        image.draw(card.boundary.left, card.boundary.top, 2, 0.4, 0.5)
        if card.selected
            Gosu.draw_quad(card.boundary.left, card.boundary.top, green, card.boundary.left, card.boundary.bottom, green, card.boundary.right, card.boundary.bottom, green, card.boundary.right, card.boundary.top, green, 1)
        end
    end
    
    <<-doc
        Checks if Gameover conditions are met and then clear all data values
    doc
    def endGame
        if @time_left <= 0 || @controller.checkEndOfGame
            @gameOver = true
            @winnerIds = @controller.showStats
            clearCards
            @hintIcon = []
            @addSymbol = []
            @SubmitButton = []
            @players = []
            @beep_sound.stop
        end
    end
    
    <<-doc
        submit selected cards to controller
        Unselect all cards
        reset table_cards_generated
        update table_cards_generated
    doc
    def submitCardsSelected
        if @cards_selected.length < 3
            return
        end
        if @controller.handleSelection @cards_selected
            @displayPanelMessage = " Great Job.
             You ve found a set."
        else
            @displayPanelMessage = " Oops. The cards you selected do no form a set."
        end
      clearCards
    end
    
    <<-doc
        Clears all the cards selected
    doc
    def clearCards
        @cards_selected = []
        @table_cards_generated = []
    end
    
    <<-doc
        Calls handleDealMoreCards in controller
    doc
    def submitDealMoreCards
        if @controller.handleDealMoreCards
            @displayPanelMessage = " There is a Set on the table. 
             Try to find it."
        else
            @displayPanelMessage = " Added Three more cards to the table."
        end
        temp = []
        @cards_selected.each do |card|
            temp.push(card.table_position)
        end
        clearCards
        generate_cards
        temp.each do |position|
            toggle_select_card @table_cards_generated[position]
        end
    end
    
    <<-doc
        Gets a hint of for sets on the table
    doc
    def submitGetHint
        @hintArray= @controller.hint(@controller.model.table)
        if @hintArray[0] == @hintArray[1] && @hintArray[1] == @hintArray[2] && @hintArray[0] == @hintArray[2]
            @displayPanelMessage = " There's no set on the table. 
             Click on the plus sign to add three more cards."
        end
        clearCards
        generate_cards
        displayHints
    end
    
    <<-Doc
        It displays the first @hintNumber of hints
        @requires   @cards_selected = []
    Doc
    def displayHints
        if @hintArray[0] != @hintArray[1] && @hintArray[1] != @hintArray[2] && @hintArray[0] != @hintArray[2]
            if @hintNumber < 3
               @hintNumber += 1
            else
                @hintNumber = 0
            end
            for i in 0...@hintNumber
              toggle_select_card(@table_cards_generated[@hintArray[i]])
            end
        end
    end
    
    <<-doc
        Toggles card as selected and not selected
        @param card:    Card to toggle selected attribute 
    doc
    private def toggle_select_card(card)
        if !card.selected && @cards_selected.length<3 && !@cards_selected.include?(card)
            card.selected = !card.selected
            @cards_selected.push card
        elsif card.selected
            card.selected = !card.selected
            temp_array = []
            while @cards_selected.length > 0
                temp_card = @cards_selected.pop
                if temp_card != card
                    temp_array.push temp_card
                end
            end
            @cards_selected = temp_array
        end
    end
end
