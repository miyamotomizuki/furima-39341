class PurchaseBuyer
  include ActiveModel::Model
  attr_accessor :post_code, :city, :block, :building, :phone, :region_id, :user_id, :product_id, :token
  
  with_options presence: true do
    validates :city
    validates :block
    validates :user_id
    validates :product_id
    validates :token
  end

  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :post_code, presence: true, allow_blank: true
  validates :phone, format: {with: /\A[0-9]{10,11}\z/ }
  validates :phone, presence: true, allow_blank: true


  validates :region_id, numericality: {other_than: 1, message: "can't be blank"}
  
  def save
    purchase = Purchase.create(user_id: user_id, product_id: product_id)
    Buyer.create(post_code: post_code, city: city, block: block, building: building, phone: phone, region_id: region_id,purchase_id: purchase.id)
  end


end
