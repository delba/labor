class Employee < ActiveRecord::Base
  geocoded_by :address do |obj, results|
    if result = results.first
      obj.street = result.street_address
      obj.zip = result.postal_code
      obj.city = result.city
      obj.country = result.country
      obj.latitude = result.latitude
      obj.longitude = result.longitude
    end
  end

  after_validation :geocode, if: :address_changed?

  def address
    "#{street}, #{zip} #{city}, #{country}"
  end

  def address_changed?
    street_changed? || city_changed? || zip_changed? || country_changed?
  end
end
