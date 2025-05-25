require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品情報を入力' do
    context '商品情報の入力がうまくいくとき' do
      it 'すべての入力事項が、存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'ユーザー登録している人でないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
       it '商品の説明が空では出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
       it '販売価格が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'カテゴリーが「---」では出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が「---」では出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it '配送料の負担が「---」では出品できない' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it '発送元の地域が「---」では出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数が「---」では出品できない' do
        @item.delivery_time_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery time can't be blank"
      end
      it '販売価格が全角数字では登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが1000万以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
    end
  end
end
