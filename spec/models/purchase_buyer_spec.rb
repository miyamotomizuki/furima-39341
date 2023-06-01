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
        expect(@purchase_buyer.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @purchase_buyer.post_code = '1234567'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Post code is invalid")
      end
      it 'cityが空だと購入できない' do
        @purchase_buyer.city = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと購入できない' do
        @purchase_buyer.block = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Block can't be blank")
      end
      it 'phoneが空だと購入できない' do
        @purchase_buyer.phone = ''
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneは9桁以下だと購入できない' do
        @purchase_buyer.phone = '123456789'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneは12桁以上だと購入できない' do
        @purchase_buyer.phone = '123456789123'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone is invalid")
      end
      it 'numberは半角数字以外が含まれている場合だと購入できない' do
        @purchase_buyer.phone  = '090-1234'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Phone is invalid")
      end
      it 'region_idに「1」が選択されている場合は出品できない' do
        @purchase_buyer.region_id = '1'
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Region can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        @purchase_buyer.user_id = nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'productが紐付いていなければ購入できない' do
        @purchase_buyer.product_id= nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Product can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @purchase_buyer.token = nil
        @purchase_buyer.valid?
        expect(@purchase_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end