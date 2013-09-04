class Locator
  def self.get_bounds(models, limit: nil)
    return unless models.to_a.any?
    new(models, limit).get_bounds
  end

  attr_reader :models

  def initialize(models, limit)
    @models = models.to_a
    @models = @models.first(limit) if limit
  end

  def get_bounds
    [south_west, north_east]
  end

private

  def south_west
    [min_latitude, min_longitude]
  end

  def north_east
    [max_latitude, max_longitude]
  end

  def min_latitude
    minmax_latitudes[0]
  end

  def min_longitude
    minmax_longitudes[0]
  end

  def max_latitude
    minmax_latitudes[1]
  end

  def max_longitude
    minmax_longitudes[1]
  end

  def minmax_latitudes
    @minmax_latitudes ||= models.map(&:latitude).minmax
  end

  def minmax_longitudes
    @minmax_longitudes ||= models.map(&:longitude).minmax
  end
end
