module Customers

  class AdoptionsController < CustomersController

    def update
      @customer = customer
      @customer.pet = Pet.find(params[:pet_id])
      @customer.save
      render json: @customer, include: 'pet'
    end

  end

end