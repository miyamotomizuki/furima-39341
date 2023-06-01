class PurchasesController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @purchase_buyers = PurchaseBuyer.new
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_buyers = PurchaseBuyer.new(purchase_params)
    if @purchase_buyers.valid?
      @purchase_buyers.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  
  private

  def purchase_params
    params.require(:purchase_buyer).permit(:post_code, :city, :block, :building, :phone, :region_id).merge(user_id: current_user.id, product_id: @product.id,token: params[:token])
  end
end
