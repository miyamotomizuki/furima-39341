class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region
  belongs_to :status
  belongs_to :shipping_date
  belongs_to :shipping_cost
  belongs_to :category
  
  belongs_to :user
  has_one_attached :image


  validates :name, :explain, :price, presence: true
  validates :region_id, :status_id, :shipping_date_id, :shipping_cost_id, :category_id, numericality: { other_than: 1, message: "can't be blank"} 

end
