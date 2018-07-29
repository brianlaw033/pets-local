class Pet < ApplicationRecord

  belongs_to :customer, optional: true

  enum species: [:cat, :dog, :rabbit], _prefix: true
  enum breed: [:labrador, :poodle, :spaniel, :terrier], _prefix: true

  scope :is_aged, -> (age) { where(age: age) }
  scope :is_species, -> (species) { where("array[species] <@ ?", "{#{species.join(',')}}") }
  scope :is_breed, -> (breed) { where('breed is null OR array[breed] && ?', "{#{breed.join(',')}}") }
  scope :is_not_adopted, -> { where(customer_id: nil) }
  
  def interested_customers
    preferences = CustomerPreference.with_customers_and_pets.send(species == 'dog' ? 'want_a_dog' : 'want_other_species', self).is_available
    customers = preferences.map { |preference| preference.customers }
    customers.flatten
  end

end
