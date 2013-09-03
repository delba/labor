class AddCompositeIndexLatitudeLongitudeToEmployees < ActiveRecord::Migration
  def change
    add_index :employees, [:latitude, :longitude]
    remove_index :employees, :latitude
    remove_index :employees, :longitude
  end
end
