class CustomersController < ApplicationController

  def create 
    @customer = Customer.create_with_preference(customer_params)
    render json: @customer
  end

  def show
    @customer = customer
    render json: @customer
  end

  private

  def customer_params
    params.required(:customer).permit(customer_preference_attributes: [:age, { species: [] }, { breed: [] }])
  end

end
