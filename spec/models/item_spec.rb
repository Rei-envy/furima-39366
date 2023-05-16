require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品の保存' do
    context '商品出品の保存ができる場合' do
      it '出品の関わる全ての項目が存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品の保存ができない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'introduceが空では登録できない' do
        @item.introduce = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Introduce can't be blank"
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
      it 'statement_idが1では登録できない' do
        @item.statement_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Statement must be other than 1'
      end
      it 'load_idが1では登録できない' do
        @item.load_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Load must be other than 1'
      end
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it 'send_day_idが1では登録できない' do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Send day must be other than 1'
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが半角数字でなければ登録できない' do
        @item.price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
      it 'priceが300以下では登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end
      it 'priceが9999999以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end
    end
  end
end
