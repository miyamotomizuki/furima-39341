class PurchasesController < ApplicationController
  def
    @purchase_buyers = PurchaseBuyer.new
  end
end
