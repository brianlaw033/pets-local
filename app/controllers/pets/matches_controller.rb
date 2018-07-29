module Pets

  class MatchesController < PetsController

    def index
      @pet = pet
      render json: @pet.interested_customers 
    end

  end

end