class ApplicationController < ActionController::API

  private

  def customer
    @customer ||= Customer.find(params[:id])
  end

  def pet
    @pet ||= Pet.find(params[:id])
  end
  
end
