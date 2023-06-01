class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region
  belongs_to :status
  belongs_to :shipping_date
  belongs_to :shipping_cost
  belongs_to :category

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validates :name, :explain, :image, presence: true
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }, allow_blank: true
  validates :price, presence: true
  validates :region_id, :status_id, :shipping_date_id, :shipping_cost_id, :category_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
