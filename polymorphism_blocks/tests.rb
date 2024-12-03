# encoding: utf-8
require 'minitest/autorun'
require_relative 'processing_array' 

class TestArrayProcessing < Minitest::Test
  def setup
    # Общий массив для тестов
    @array = ArrayProcessing.new([1, 2, 3, 4, 5, 6])
  end

  def test_detect
    assert_equal(4, @array.detect { |x| x > 3 })
    assert_equal(2, @array.detect { |x| x.even? })
    assert_nil(@array.detect { |x| x > 10 })
  end

  def test_map
    assert_equal([2, 4, 6, 8, 10, 12], @array.map { |x| x * 2 })
    assert_equal(%w[1 2 3 4 5 6], @array.map(&:to_s))
  end

  def test_select
    assert_equal([4, 5, 6], @array.select { |x| x > 3 })
    assert_equal([1, 3, 5], @array.select(&:odd?))
  end

  def test_sort
    assert_equal([1, 2, 3, 4, 5, 6], @array.sort)
    assert_equal([6, 5, 4, 3, 2, 1], @array.sort { |a, b| b <=> a })
  end

  def test_max
    assert_equal(6, @array.max)
    assert_equal(3, @array.max { |a, b| a % 3 <=> b % 3 })
  end

  def test_drop_while
    assert_equal([4, 5, 6], @array.drop_while { |x| x < 4 })
    assert_equal([1, 2, 3, 4, 5, 6], @array.drop_while { |x| x > 10 })
  end
end
