class Product < ApplicationRecord
  belongs_to :region
  belongs_to :user
  has_one_attached :image


  validates :title, :explain, :price, presence: true
  validates :region_id, numericality: { other_than: 1, message: "can't be blank"} 

end
