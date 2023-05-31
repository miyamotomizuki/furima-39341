class PurchasesController < ApplicationController
  def index
    @purchase_buyers = PurchaseBuyer.new
  end

  def create
    binding.pry
  end

end
