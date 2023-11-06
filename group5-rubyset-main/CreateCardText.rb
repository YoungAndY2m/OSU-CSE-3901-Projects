require 'colorize'

class Cards
  def initialize(color,number,shape,shading)
    @color = color
    @number = number
    @shape = shape
    @shading = shading
  end
  attr_reader :color,:number,:shape,:shading
end

def createCard(set)
  colors = ["red","green","purple"]
  numbers = [1,2,3]
  shapes = ["diamond","squiggle","oval"]
  shadings = ["striped","open","solid"]
  cards = colors.product(numbers).product(shapes).product(shadings)
  cards.each{|c| c.flatten!}
  
  cards.each do |info|
    set << Cards.new(info[0], info[1], info[2], info[3])
  end
  set.shuffle!

end

set = []
createCard(set)

def displayCard(card)
  number,shape,shading,color = "","","",""

  case card.shape
  when "diamond"
    shape = " /\\ "
  when "squiggle"
    shape = " ~~ "
  when "oval"
    shape = " () "
  end

  case card.shading
  when "solid"
    shading = "########"
  when "striped"
    shading = "////////"
  when "open"
    shading = "[      ]"
  end

  case card.number
  when 1
    number = "1."
  when 2
    number = "2."
  when 3
    number = "3."
  end

  case card.color
  when "red"
    print "#{shading} #{number} #{shape}".colorize(:red)
  when "green"
    print "#{shading} #{number} #{shape}".colorize(:green)
  when "purple"
    print "#{shading} #{number} #{shape}".colorize(:magenta)
  end
  
end

#set.each{|card| displayCard(card)} ##