# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating pets'
pets = [{ name: 'Tom', available_from: Date.today, age: 1, species: 0 },
  { name: 'Bunny', available_from: Date.today, age: 3, species: 2 },
  { name: 'Wong', available_from: Date.today, age: 6, species: 1, breed: 0 }
]

pets.each do |pet|
  Pet.where(pet).first_or_create
end

puts 'Creating customers preference'
preferences = [{ age: 1...3, species: [0] },
  { age: 4...5, species: [2] },
  { age: 6...10, species: [1], breed: [0, 1, 2] }
]

preferences.each do |preference|
  CustomerPreference.where(preference).first_or_create
end

Customer.create({ customer_preference_id: 1 })
Customer.create({ customer_preference_id: 2 })
Customer.create({ customer_preference_id: 3 })