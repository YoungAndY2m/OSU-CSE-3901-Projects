require_relative 'viewBoundBox.rb'
require 'gosu'

class SubmitButton
    attr_reader :boundary
    def initialize(left, top, width, height )
        @boundary = BoundBox.new(left, top, width, height)
        @image = Gosu::Image.new("./View/assets/images/submitbutton.png")
    end 

    def draw
        green = 0xff_00ff00

        @image.draw(@boundary.left, @boundary.top, 2, 0.5, 0.7)
    end
end

class AddSymbol
    attr_reader :boundary
    def initialize(left, top, width, height )
        @boundary = BoundBox.new(left, top, width, height)
        @image = Gosu::Image.new("./View/assets/images/plusicon.png")
    end 

    def draw
        green = 0xff_00ff00

        @image.draw(@boundary.left, @boundary.top, 2, 0.1, 0.1)
    end
end

class HintIcon
    attr_reader :boundary
    def initialize(left, top, width, height )
        @boundary = BoundBox.new(left, top, width, height)
        @image = Gosu::Image.new("./View/assets/images/hint.png")
    end 

    def draw
        green = 0xff_00ff00

        @image.draw(@boundary.left, @boundary.top, 2, 0.3, 0.3)
    end
end