class Employee < ActiveRecord::Base
  geocoded_by :address

  after_validation :geocode, if: :address_changed?

  def address
    "#{street}, #{zip} #{city}, #{country}"
  end

  def address_changed?
    street_changed? || city_changed? || zip_changed? || country_changed?
  end
end
