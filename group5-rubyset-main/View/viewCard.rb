require_relative'viewBoundBox'

class Card
    attr_accessor :boundary, :selected, :card_name, :table_position

    #Creates a new instance of a card
    # @ card_name:      The id of card
    # @ column   :      Column of card on table
    # @ row      :      Row of card on table
    # @ selected :      Boolean. if card is selected
    def initialize(card_name, column, row, selected, table_position)
        width = 110
        height = 90
        @boundary = BoundBox.new(column * width, row * height, width, height)
        @selected = selected
        @card_name = card_name
        @table_position = table_position
    end
end