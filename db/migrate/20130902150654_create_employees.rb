class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :zip
      t.string :city
      t.string :country
      t.string :phone
      t.string :email
      t.date :birthday

      t.timestamps
    end
  end
end
