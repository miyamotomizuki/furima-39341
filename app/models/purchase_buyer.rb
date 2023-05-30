class PurchaseBuyer
  include ActiveModel::Model
  attr_accessor :post_code, :city, :block, :building, :phone, :region_id, :user_id, :product_id
 
  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :block
    validates :phone, format: {with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :product_id
  end

  validates :region_id, numericality: {other_than: 1, message: "can't be blank"}
  
  def save
  end


end
