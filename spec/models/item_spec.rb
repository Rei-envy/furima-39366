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
        expect(@item.errors.full_messages).to include "商品画像を入力してください"
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it 'introduceが空では登録できない' do
        @item.introduce = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'カテゴリーは1以外の値にしてください'
      end
      it 'statement_idが1では登録できない' do
        @item.statement_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の状態は1以外の値にしてください'
      end
      it 'load_idが1では登録できない' do
        @item.load_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '配送料の負担は1以外の値にしてください'
      end
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '発送元の地域は1以外の値にしてください'
      end
      it 'send_day_idが1では登録できない' do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '発送までの日数は1以外の値にしてください'
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格を入力してください"
      end
      it 'priceが半角数字でなければ登録できない' do
        @item.price = '３３３'
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は数値で入力してください'
      end
      it 'priceが300以下では登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は300以上の値にしてください'
      end
      it 'priceが9999999以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include '販売価格は9999999以下の値にしてください'
      end
      it 'ユーザー情報がない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'ユーザーを入力してください'
      end
    end
  end
end
