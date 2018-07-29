class Customer < ApplicationRecord
  
  belongs_to :customer_preference
  has_one :pet

  accepts_nested_attributes_for :customer_preference

  def self.create_with_preference(params)
    # Change String "#{min_age}..#{max_age}" to Range
    params[:customer_preference_attributes][:age] = Range.new(*params[:customer_preference_attributes][:age].split("..").map(&:to_i))
    # Translate species and breed to enum used in Pet
    [:species, :breed].each do |key|
      params[:customer_preference_attributes][key] = params[:customer_preference_attributes][key].map do |name|
        Pet.send(key)[name]
      end
    end
    customer_preference = CustomerPreference.where(params[:customer_preference_attributes]).first_or_create
    customer_preference.customers.create()
  end

  def suitable_pets
    Pet.is_aged(customer_preference.age)
      .is_species(customer_preference.species)
      .is_breed(customer_preference.breed)
      .is_not_adopted
  end

end
