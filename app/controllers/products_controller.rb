class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :sold, only: :edit

  
  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  def edit
    unless current_user.id == @product.user_id
      redirect_to action: :index
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @product.user_id
      @product.destroy
    end
      redirect_to root_path
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :explain, :price, :category_id, :status_id, :shipping_cost_id, :region_id,:shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def sold
    if @product.purchase.present?
      redirect_to root_path
    end
  end
end
