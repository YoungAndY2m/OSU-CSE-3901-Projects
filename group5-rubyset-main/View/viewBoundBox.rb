#This object is rapped around a card. 
#Help detect a mouse click

class BoundBox
    attr_reader :left, :right, :top, :bottom, :width, :height

    def initialize(left, top, width, height)
        @left = left
        @top = top
        @width = width
        @height = height
        @right = @left + @width
        @bottom = @top + @height
    end

    #checks if a coordinate is within a boundary
    # @x    The x-coordinate
    # @y    The y-coordinate
    def in_bound?(x, y)
        if x>= @left && x<= @right && y<=@bottom && y>= @top
            return true
        else
            return false
        end
    end
end