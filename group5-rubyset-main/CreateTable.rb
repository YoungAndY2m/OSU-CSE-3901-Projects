require_relative 'CreateCard'
require "set"

def createTable(set,displaySet)
  # take 12 cards
  count = 12
  while count >= 1
    thing=set.pop
    displaySet << thing
        
    count = count - 1
  end

end

displaySet, set= [], []
createCard(set)
createTable(set,displaySet)
def display_board(displaySet)
  puts " #{displayCard(displaySet[0])}  #{displayCard(displaySet[1])}  #{displayCard(displaySet[2])} "
  puts "-----------"
  puts " #{displayCard(displaySet[3])}  #{displayCard(displaySet[4])}  #{displayCard(displaySet[5])} "
  puts "-----------"
  puts " #{displayCard(displaySet[6])}  #{displayCard(displaySet[7])}  #{displayCard(displaySet[8])} "
  puts "-----------"
  puts " #{displayCard(displaySet[9])}  #{displayCard(displaySet[10])}  #{displayCard(displaySet[11])} "
end
display_board(displaySet)

def updateTable(set,displaySet,scoreSet)
  # remove 3 selected cards and add 3 more
  count = 3
  
  #remove 3 selected cards with pop, need to wait on GUI or input, used first 3 as an example.
  temp=displaySet.dup
  #get input of user to a set
  pick=Set.new [0,1,2]
  displaySet.delete_if.with_index { |_, index| pick.include? index }
  scoreSet.push(temp-displaySet)
  

  while count >= 1
    thing=set.pop
    #can replace at original position, now just simple add.
    #displaySet.insert(0,thing) #take out of while loopand do three times 
    
    #insert at the end
    displaySet << thing
        
    count = count - 1
  end
  
end

scoreSet = []
#updateTable(set,displaySet,scoreSet)
#puts "after round1"
#displaySet.each{|card| displayCard(card)}