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
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("IMAX")

    assert_equal [gems_and_minerals, dead_sea_scrolls], @museum.recommend_exhibits(patron_1)
    assert_equal [imax], @museum.recommend_exhibits(patron_2)
  end

  def test_it_begins_with_empty_array_of_patrons
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)

    assert_equal [], @museum.patrons
  end

  def test_it_can_admit_patrons
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)
    @museum.admit(patron_1)
    @museum.admit(patron_2)

    assert_equal [patron_1, patron_2], @museum.patrons
  end

  def test_it_can_sort_patrons_by_exhibit_interest
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    @museum.add_exhibit(gems_and_minerals)
    @museum.add_exhibit(dead_sea_scrolls)
    @museum.add_exhibit(imax)
    patron_1 = Patron.new("Bob", 20)
    patron_2 = Patron.new("Sally", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2.add_interest("Dead Sea Scrolls")
    patrons_by_exhibit = {
      gems_and_minerals => [patron_1],
      dead_sea_scrolls => [patron_1, patron_2],
      imax => []
    }

    assert_equal patrons_by_exhibit, @museum.patrons_by_exhibit_interest
  end
end
