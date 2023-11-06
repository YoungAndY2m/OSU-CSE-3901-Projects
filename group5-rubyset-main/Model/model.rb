require 'set'

class Model
    <<-doc
      Create the class of model. Initialize it with four attributes:
      stack, table, players, and the number of current player
    doc
    attr_reader :stack, :table, :currentPlayer, :players
    def initialize(numberOfPlayer)
        @stack = []
        @table = []
        @players = []
        @currentPlayer = 0
        createPlayers(5)

    end

    <<-doc
      Create the class of cards. Initialize it with five attributes:
      color, number, shape, shading, and the card name
    doc
    class Cards
      attr_reader :color,:number,:shape,:shading,:card_name
      def initialize(color,number,shape,shading,card_name)
        @color = color
        @number = number
        @shape = shape
        @shading = shading
        @card_name = card_name
      end
    end

    <<-doc
      Create the class of players. Initialize it with two attributes:
      player_id and the score
    doc
    class Player
      attr_accessor :score
      attr_reader :id
      def initialize(id)
        @id = id
        @score = 0
      end

    end

    <<-doc
      change the currentPlayer to the id the player requested
    doc
    def changePlayer(id)
      @currentPlayer=id
    end

    <<-doc
      increase score of current player
    doc
    def increaseScore
      @players[@currentPlayer].score  +=3
    end

    <<-doc
      create the set of all cards and then put them into the stack
    doc
    def createCard
      colors = ["red","green","purple"]
      numbers = [1,2,3]
      shapes = ["diamond","squiggle","oval"]
      shadings = ["line","blank","solid"]
      card_name = [""]
      cards = colors.product(numbers).product(shapes).product(shadings).product(card_name)
      cards.each{|c| c.flatten!}
      cards.shuffle!
        
      cards.each do |info|
        info[4] = info[0][0]+info[2][0]+info[1].to_s+info[3][0]
        @stack << Cards.new(info[0], info[1], info[2], info[3], info[4])
      end
    end

    <<-doc
      create the players based on the number of player
    doc
    def createPlayers(numberOfPlayer)
      for i in 1..numberOfPlayer do
        player = Player.new(i)
        @players.push player
      end
    end

    <<-doc
      create the table with randomly selected 12 cards
    doc
    def createTable
      # take 12 cards
      count = 12
      while count >= 1
        card = @stack.pop
        @table << card
              
        count = count - 1
      end
      
    end

    <<-doc
      Replaces three cards in @table with cards from @stack
      @param index1:    The location of first card on table
      @param index2:    The location of second card on table
      @param index3:    The location of third card on table
    doc
    def replaceCardsOnTable(index1, index2, index3)
      if index1 >= @table.length || index2 >= @table.length || index3 >= @table.length
        puts "In model.rb line 51, Invalid arguments for method replaceCardsOnTable: "
      else
        @table[index1] = @stack.pop
        @table[index2] = @stack.pop
        @table[index3] = @stack.pop
      end
    end   

    <<-doc
      removes 3 cards from table without replacing from stack
      @param index1:  index of cared
      @param index2:  index of cared
      @param index3:  index of cared
    doc
    def removeCardsOnTable(index1, index2, index3)
      pick = Set.new
      pick.add index1
      pick.add index2
      pick.add index3
      @table.delete_if.with_index { |_, index| pick.include? index }

    end

    <<-doc
      Adds 3 cards to table from stack
      Returns Boolean
    doc
    def dealMoreCards
      if stack.length < 1
        return false
      else
        for i in 1..3 do
          @table.push @stack.pop
        end
        return true
      end
    end

end

