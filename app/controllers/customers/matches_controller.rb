module Customers

  class MatchesController < CustomersController

    def index
      @customer = customer
      render json: @customer.suitable_pets 
    end

  end

end