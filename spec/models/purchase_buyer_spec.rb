require 'rails_helper'

RSpec.describe PurchaseBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @purchase_buyer = FactoryBot.build(:purchase_buyer, user_id: user.id, product_id: product.id)
  end

  describe '購入者情報の保存' do
    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchase_buyer).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @purchase_buyer.building = ''
        expect(@purchase_buyer).to be_valid
      end
    end

    context '購入できない場合' do
      it 'post_codeが空だと購入できない' do
        @purchase_buyer.post_code = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include('郵便番号を入力してください')
      end
      it 'post_codeは「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @purchase_buyer.post_code = '1234567'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'cityが空だと購入できない' do
        @purchase_buyer.city = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("市区町村を入力してください")
      end
        it 'blockが空だと購入できない' do
        @purchase_buyer.block = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("番地を入力してください")
      end
      it 'phoneが空だと購入できない' do
        @purchase_buyer.phone = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phoneは9桁以下だと購入できない' do
        @purchase_buyer.phone = '123456789'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phoneは12桁以上だと購入できない' do
        @purchase_buyer.phone = '123456789123'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'numberは半角数字以外が含まれている場合だと購入できない' do
        @purchase_buyer.phone = '090-1234'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'region_idに「1」が選択されている場合は出品できない' do
        @purchase_buyer.region_id = '1'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'userが紐付いていなければ購入できない' do
        @purchase_buyer.user_id = nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Userを入力してください")
      end
      it 'productが紐付いていなければ購入できない' do
        @purchase_buyer.product_id = nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Productを入力してください")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_buyer.token = nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
    end
  end
end
