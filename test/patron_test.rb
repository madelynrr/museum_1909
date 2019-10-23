require 'minitest/autorun'
require 'minitest/pride'
require './lib/patron'

class PatronClass < Minitest::Test

  def setup
    @patron = Patron.new("Bob", 20)
  end

  def test_it_exists
    assert_instance_of Patron, @patron
  end

  def test_it_initializes
    assert_equal "Bob", @patron.name
    assert_equal 20, @patron.spending_money
  end

  def test_it_begins_with_empty_array_for_interests
    assert_equal [], @patron.interests
  end

  def test_it_can_add_interests
    @patron.add_interest("Dead Sea Scrolls")
    @patron.add_interest("Gems and Minerals")

    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], @patron.interests
  end
end
