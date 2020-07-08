class Ship

  attr_reader :name
  attr_accessor :hits, :length, :health

  def initialize(name, length, hits = 0)
    @name = name
    @length = length
    @health = health
    $hits = hits
  end

  def hit
    $hits += 1
  end

  def health
     @length.to_i - $hits.to_i
  end

  def sunk?
    if @health == $hits
      true
    else
      false
    end
  end

end
