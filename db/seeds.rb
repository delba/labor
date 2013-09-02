require 'csv'

path = File.join(Rails.root, 'data', 'employees.csv')
options = { headers: true }

CSV.foreach path, options do |row|
  Employee.create!(row.to_hash)
end
