class Museum

  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
  end

  # museum has array of exhibit objects
  #exhibit objects have names
  #patron has array of interests, the elements of which are names

end
