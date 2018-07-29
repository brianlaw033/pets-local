class CustomerPreference < ApplicationRecord

  has_many :customers

  scope :with_customers_and_pets, -> { left_outer_joins(customers: :pet) }
  scope :want_a_dog, -> (pet) { where('customer_preferences.age @> ? AND customer_preferences.species @> ? AND customer_preferences.breed @> ?', pet.age, "{#{Pet.species[pet.species]}}", "{#{Pet.breeds[pet.breed]}}") }
  scope :want_other_species, -> (pet) { where('customer_preferences.age @> ? AND customer_preferences.species @> ?', pet.age, "{#{Pet.species[pet.species]}}") }
  scope :is_available, -> { where(customers: { pets: { id: nil } }) }

end
