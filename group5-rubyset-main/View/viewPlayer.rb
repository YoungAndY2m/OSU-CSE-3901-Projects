require_relative 'viewBoundBox.rb'

class ViewPlayer
    #Creates a new instance of a player
    # @ playerId :      The id of player
    # @ selected :      Boolean. if card is selected
    attr_reader :playerId, :boundary
    attr_accessor :selected
    def initialize(playerId, selected)
        @playerId = playerId
        @boundary = BoundBox.new(10+playerId*90, 550, 70, 70)
        @selected = selected
    end
end