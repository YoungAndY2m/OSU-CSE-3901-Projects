require_relative 'viewBoundBox'
require 'minitest/autorun'

class TestBound < MiniTest::Test
    def setup
        @boundary = BoundBox.new(5, 5, 5, 5)
    end

    def test_true
        assert_equal( true, @boundary.in_bound?(8, 8), "This test results to true")
    end

    def test_false1
        assert_equal( false, @boundary.in_bound?(11, 8), "This test results to false")
    end

    def test_false2
        assert_equal( false, @boundary.in_bound?(2, 8), "This test results to false")
    end

    def test_false3
        assert_equal( false, @boundary.in_bound?(8, 11), "This test results to false")
    end

    def test_false4
        assert_equal( false, @boundary.in_bound?(11, 2), "This test results to false")
    end

    def test_false4
        assert_equal( false, @boundary.in_bound?(11, 11), "This test results to false")
    end

    def test_false5
        assert_equal( false, @boundary.in_bound?(2, 2), "This test results to false")
    end

    def test_boundary_left
        assert_equal(5, @boundary.left, "This checks the value of left attribute in booundary")
    end

    def test_boundary_right
        assert_equal(10, @boundary.right, "This checks the value of right attribute in booundary")
    end

    def test_boundary_top
        assert_equal(5, @boundary.top, "This checks the value of top attribute in booundary")
    end

    def test_boundary_right
        assert_equal(10, @boundary.bottom, "This checks the value of bottom attribute in booundary")
    end

    def test_boundary_width
        assert_equal(5, @boundary.width, "This checks the value of width attribute in booundary")
    end

    def test_boundary_height
        assert_equal(5, @boundary.height, "This checks the value of height attribute in booundary")
    end
end

