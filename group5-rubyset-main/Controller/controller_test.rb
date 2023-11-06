require_relative 'controller.rb'
require_relative '../Model/model.rb'
require 'minitest/autorun'

class Controller_test < MiniTest::Test

    def setup
        @controller = Controller.new
    end

    def test_initialize
        assert_equal(12, @controller.model.table.length, "Testing the size of table at start")
    end

    def test_initialize_stack
        assert_equal(69, @controller.model.stack.length, "Testing the size of stack at start")
    end

    def test_checkAttr
        assert_equal(true, @controller.isSet(@controller.model.table[2], @controller.model.table[6], @controller.model.table[9]), "Expecting true")
    end

    def test_checkAttr1
        assert_equal(true, @controller.isSet(@controller.model.table[0], @controller.model.table[2], @controller.model.table[4]), "Expecting true")
    end

    def test_checkAttr
        assert_equal(true, @controller.isSet(@controller.model.table[2], @controller.model.table[6], @controller.model.table[11]), "Expecting true")
    end

    def test_model_card_name
        card = @controller.model.table[1]

        assert_equal(card.card_name[0], card.color[0], "Checking if the first letter of card name is the color of the card")

    end

    def test_model_card_name_shape
        card = @controller.model.table[1]

        assert_equal(card.card_name[1], card.shape[0], "Checking if the first letter of card name is the shape of the card")

    end

    def test_model_card_number
        card = @controller.model.table[1]

        assert_equal(card.card_name[2], card.number[0], "Checking if the first letter of card name is the color of the card")

    end

    def test_model_card_name
        card = @controller.model.table[1]

        assert_equal(card.card_name[3], card.shading[0], "Checking if the first letter of card name is the color of the card")

    end

    def test_update
        card = @controller.model.table[1]

        assert_equal(card.card_name[3], card.shading[0], "Checking if the first letter of card name is the color of the card")

    end

    def test_hint
        array = @controller.hint(@controller.model.table)

        assert_equal([9,10,11], array, "Checking hint generation ")

    end

end