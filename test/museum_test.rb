require 'minitest/autorun'
require 'minitest/pride'
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

class MuseumTest < Minitest::Test

  def setup
    @museum = Museum.new("Denver Museum of Nature and Science")

  end

  def test_it_exists
    assert_instance_of Museum, @museum
  end

  def test_it_initializes
    assert_equal "Denver Museum of Nature and Science", @museum.name
  end

  def test_it_begins_with_empty_array_for_exhibits
    assert_equal [], @museum.exhibits
  end

  def test_it_can_add_exhibits
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    @museum.add_exhibit(gems_and_minerals)
    @museum.add_exhibit(dead_sea_scrolls)
    @museum.add_exhibit(imax)

    assert_equal [gems_and_minerals, dead_sea_scrolls, imax], @museum.exhibits
  end

  def test_it_can_recommend_exhibits
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    @museum.add_exhibit(gems_and_minerals)
    @museum.add_exhibit(dead_sea_scrolls)
    @museum.add_exhibit(imax)
    patron = Patron.new("Bob", 20)
    patron.add_interest("Dead Sea Scrolls")
    patron.add_interest("Gems and Minerals")    

    assert_equal [gems_and_minerals, dead_sea_scrolls], @museum.recommend_exhibits(patron)
  end
end
