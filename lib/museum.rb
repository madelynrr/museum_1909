class Museum

  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
      @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
    # patrons_of_exhibits(patron)
  end

  def patrons_by_exhibit_interest
    hash = {}
    @exhibits.each do |exhibit|
      hash[exhibit] =
        @patrons.find_all do |patron|
          patron.interests.include?(exhibit.name)
        end
    end
    hash
  end

  # def patrons_of_exhibits(patron)
  #   hash = {}
  #   @exhibits.each do |exhibit|
  #     hash[exhibit] =
  #       @patrons.find_all do |patron|
  #         patron.interests.include?(exhibit.name)
  #       end
  #   end
  #   hash
  # end
end
