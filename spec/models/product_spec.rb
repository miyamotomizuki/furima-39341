require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('app/assets/images/star.png')

  end

  describe '商品出品機能' do
    context '出品ができる時' do
      it "必須項目が全てあれば登録できること" do
        expect(@product).to be_valid
      end
      it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
        @product = FactoryBot.create(:user)
        expect(@product).to be_valid
      end
    end
    context '出品ができない時' do
      it '商品画像を添付しないと登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include{"Image can't be blank"}
      end

      it '商品名がないと登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がないと登録できない' do
        @product.explain = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explain can't be blank")
      end

      it 'カテゴリーの情報がないと登録できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態についての情報がないと登録できない' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end

      it '配送料の負担についての情報がないと登録できない' do
        @product.shipping_cost_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it '発送元の地域についての情報がないと登録できないと' do
        @product.region_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Region can't be blank")
      end

      it '発送までの日数についての情報がないと登録できないと' do
        @product.shipping_date_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping date can't be blank")
      end

      it '販売価格についての情報がないと登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @product.price = '100'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @product.price = '10,000,000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @product.price = '１００００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end