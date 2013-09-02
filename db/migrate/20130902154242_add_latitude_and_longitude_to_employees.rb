class AddLatitudeAndLongitudeToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :latitude, :float
    add_index :employees, :latitude
    add_column :employees, :longitude, :float
    add_index :employees, :longitude
  end
end
