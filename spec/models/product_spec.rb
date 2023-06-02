require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '出品ができる時' do
      it '必須項目が全てあれば登録できること' do
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
        expect(@product.errors.full_messages).to include { "Image can't be blank" }
      end
      it 'userが紐付いていなければ出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Userを入力してください")
      end
      it '商品名がないと登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明がないと登録できない' do
        @product.explain = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリーの情報がないと登録できない' do
        @product.category_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("カテゴリーを選択してください。")
      end

      it '商品の状態についての情報がないと登録できない' do
        @product.status_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の状態を選択してください。")
      end

      it '配送料の負担についての情報がないと登録できない' do
        @product.shipping_cost_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("配送料の負担を選択してください。")
      end

      it '発送元の地域についての情報がないと登録できないと' do
        @product.region_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("発送元の地域を選択してください。")
      end

      it '発送までの日数についての情報がないと登録できないと' do
        @product.shipping_date_id = '1'
        @product.valid?
        expect(@product.errors.full_messages).to include("発送までの日数を選択してください。")
      end

      it '販売価格についての情報がないと登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格を入力してください")
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @product.price = '100'
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格is invalid')
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @product.price = '10,000,000'
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格is invalid')
      end

      it '販売価格は半角数字のみ保存可能であること' do
        @product.price = '１００００'
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格is invalid')
      end
    end
  end
end
