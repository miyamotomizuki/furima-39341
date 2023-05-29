class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :family_name,  presence: true, allow_blank: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name, presence: true, allow_blank: true
  validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :family_name_kana, presence: true, allow_blank: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, allow_blank: true
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{8,}\z/ }, allow_blank: true

  has_many :products
end