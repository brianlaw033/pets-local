class PetsController < ApplicationController

  def create 
    @pet = Pet.create(pet_params)
    render json: @pet
  end

  def show
    @pet = pet
    render json: @pet
  end

  private

  def pet_params
    params.required(:pet).permit(:name, :age, :species, :breed, :available_from)
  end

end
