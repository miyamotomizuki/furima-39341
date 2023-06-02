class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :sold

  def index
    @purchase_buyers = PurchaseBuyer.new
    return unless current_user == @product.user

    redirect_to root_path
  end

  def create
    @purchase_buyers = PurchaseBuyer.new(purchase_params)
    if @purchase_buyers.valid?
      pay_item
      @purchase_buyers.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_buyer).permit(:post_code, :city, :block, :building, :phone, :region_id).merge(
      user_id: current_user.id, product_id: @product.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def sold
    return unless @product.purchase.present?
    redirect_to root_path
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
