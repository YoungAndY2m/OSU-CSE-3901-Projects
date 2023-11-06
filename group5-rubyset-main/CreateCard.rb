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
 <<-doc
  create cards
 doc
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
  head = "________"
  middle = "|      |"
  tail = "|______|"

  case card.shape
  when "diamond"
    shape = "|  /\\  |" + "\n" + "|  \\/  |"
  when "squiggle"
    shape = "|  ~~  |"
  when "oval"
    shape = "|  ()  |"
  end

  case card.shading
  when "solid"
    shading = "|######|"
  when "striped"
    shading = "|//////|"
  when "open"
    shading = "|      |"
  end

  case card.number
  when 1
    number = "|  1.  |"
  when 2
    number = "|  2.  |"
  when 3
    number = "|  3.  |"
  end

  case card.color
  when "red"
    puts head.colorize(:red)
    puts "#{shading}".colorize(:red),"#{number}".colorize(:red),"#{shape}".colorize(:red),"#{shading}".colorize(:red),"#{shading}".colorize(:red)
    puts tail.colorize(:red)
  when "green"
    puts head.colorize(:green)
    puts "#{shading}".colorize(:green),"#{number}".colorize(:green),"#{shape}".colorize(:green),"#{shading}".colorize(:green),"#{shading}".colorize(:green)
    puts tail.colorize(:green)
  when "purple"
    puts head.colorize(:magenta)
    puts "#{shading}".colorize(:magenta),"#{number}".colorize(:magenta),"#{shape}".colorize(:magenta),"#{shading}".colorize(:magenta),"#{shading}".colorize(:magenta)
    puts tail.colorize(:magenta)
  end
  
end

#set.each{|card| displayCard(card)} ##