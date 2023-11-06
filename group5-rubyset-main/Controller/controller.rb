require_relative '../Model/model'
require 'set'

class Controller
  attr_accessor :model
  <<-doc
    Create a model and initialize the table and stack
  doc
  def initialize
      @model = Model.new(2)
      @model.createCard
      @model.createTable
  end

  
  <<-doc
    Checks if Parameters passed forms a set
  doc
  def isSet(card1, card2, card3)
      checkColor = checkAttribute(card1.color, card2.color, card3.color)
      checkShape = checkAttribute(card1.shape, card2.shape, card3.shape)
      checkNumber = checkAttribute(card1.number, card2.number, card3.number)
      checkShading = checkAttribute(card1.shading, card2.shading, card3.shading)
      
      checkColor && checkNumber && checkShading && checkShape
  end

  <<-doc
    Checks if Parameters passed are all equal or all different
  doc
  def checkAttribute(att1, att2, att3)
      checkAttr = false
      if att1 == att2 && att1 == att3
          checkAttr = true
      elsif !(att1==att2) && !(att1==att3) && !(att3==att2)
          checkAttr = true
      end
  
      return checkAttr
  end

  <<-doc
    Set current player in model to playerId
  doc
  def setCurrentPlayer(playerId)
    @model.changePlayer(playerId)
  end

  <<-doc
    Returns the player with playerId = Id
  doc
  def getPlayer(id)
    @model.players[id-1]
  end

  <<-doc
    Checks if a list of cards in @param viewCards is forms a set.
    Returns true if @param viewCards forms a set
  doc
  def handleSelection(viewCards)           
    checkisSet=false
    scoreSet=[]

    checkisSet=isSet(@model.table[viewCards[0].table_position], @model.table[viewCards[1].table_position], @model.table[viewCards[2].table_position])

    if checkisSet ==true

      @model.increaseScore
        if @model.table.length()>12   || @model.stack.length == 0            
          @model.removeCardsOnTable(viewCards[0].table_position, viewCards[1].table_position, viewCards[2].table_position)
        else
          @model.replaceCardsOnTable(viewCards[0].table_position, viewCards[1].table_position, viewCards[2].table_position)
        end
    end
    
    checkisSet
  end

  <<-doc
    Calls dealMoreCards in model
    Returns Boolean
  doc
  def handleDealMoreCards
    b=isThereASet(@model.table)
    if !(b)
      @model.dealMoreCards
    end

    b
  end

  <<-doc
    Checks if there are three cards that form a set on @param table.
    Returns true if there is a set
  doc
  def isThereASet(table)  
    l=table.length()
    b= false
    for i in 0...(l-2) do
      for j in (i+1)...(l-1) do
        for k in (j+1)...l do
          b=b || (isSet(table[i],table[j],table[k]))
        end
      end
    end
    return b
  end

  <<-doc
    Checks if there are three cards that form a set on @param table.
    Returns a list of the indeces of the card that forms a set in @param table
  doc
  def hint(table)  
    l=table.length()
    hintArray=[0,0,0]
    for i in 0...(l-2) do
      for j in (i+1)...(l-1) do
        for k in (j+1)...l do
            if isSet(table[i],table[j],table[k])
              hintArray[0] = i
              hintArray[1] = j
              hintArray[2] = k
            end
            end
        end
    end
    return hintArray
  end

  <<-doc
    Counts down 
    @param limit:  The time to start counting from
  doc
  def timer(limit)
    while limit != 0
      message = "Count down: #{limit}s."
      print "\b" * message.length
      print message
      sleep  1
      limit -= 1
    end
    puts "Times up!"
  end

  <<-doc
    Checks if there are no possible sets among the cards left in the game
    Returns true if there are no possible sets among the cards left in the game
  doc
  def checkEndOfGame
    rt=false
    b= isThereASet(@model.table)
    if @model.stack.length() == 0
      if !(b)
        rt=true
      end
    end
    rt
  end
  
  <<-doc
    Returns list of players ids with highest score in a game
  doc
  def showStats
    max=@model.players[0].score
    array=[]
    for i in 0..4 do
      if @model.players[i].score >= max
        max=@model.players[i].score
      end
    end
    for i in 0..4 do
      if @model.players[i].score == max
        array << @model.players[i].id
      end
    end
    array
  end
end