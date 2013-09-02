class Employee < ActiveRecord::Base
  geocoded_by :address

  after_validation :geocode, if: :address_changed?

  def address
    "#{street}, #{zip} #{city}, #{country}"
  end

  def address_changed?
    street_changed? || city_changed? || zip_changed? || country_changed?
  end

private

  def geocode
    return unless result = Geocoder.search(address)[0]
    format_address(result)
    set_coordinates(result)
  end

  def format_address(result)
    self.street = result.street_address
    self.zip = result.postal_code
    self.city = result.city
    self.country = result.country
  end

  def set_coordinates(result)
    self.latitude = result.latitude
    self.longitude = result.longitude
  end
end
