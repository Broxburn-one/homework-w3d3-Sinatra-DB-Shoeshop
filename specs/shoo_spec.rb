require('minitest/autorun')
require_relative('../models/shoo')

class TestPizza < Minitest::Test

  def setup
    options = {
    'style'  => "Pigalle",
    'first_name' => "Fred",
    'last_name' => "Bloggs",
    'address' => "12 Main St.",
    'city' => "Edinburgh",
    'quantity' => 10
    }
    @shoo = Shoo.new(options)
  end

  def test_style
    assert_equal("Pigalle", @shoo.style())
  end

  def test_first_name
    assert_equal("Fred", @shoo.first_name())
  end

  def test_last_name
    assert_equal("Bloggs", @shoo.last_name())
  end

  def test_address
    assert_equal("12 Main St.", @shoo.address())
  end

  def test_city
    assert_equal("Edinburgh", @shoo.city())
  end

  def test_quantity
    assert_equal(10, @shoo.quantity().to_i)
  end

  def test_pretty_name
    assert_equal("Fred Bloggs", @shoo.pretty_name())
  end

  def test_total_price
    assert_equal( 1500, @shoo.total_price() )
  end


end


