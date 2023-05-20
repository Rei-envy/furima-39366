require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入の保存' do
    context '商品購入の保存ができる場合' do
      it '購入に関わる全ての項目が存在すれば保存できる' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入の保存ができない場合' do
      it 'ユーザー情報がない場合は保存できない' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("ユーザーを入力してください")
      end
      it '商品情報がない場合は保存できない' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("商品を入力してください")
      end
      it 'post_codeが空では保存できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'prefecture_idが1では保存できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it 'localityが空では保存できない' do
        @purchase_address.locality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'house_numberが空では保存できない' do
        @purchase_address.house_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phoneが空では保存できない' do
        @purchase_address.phone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'post_codeが「3桁ハイフン4桁」以外では保存できない' do
        @purchase_address.post_code = '22-22222'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'post_codeが半角数字以外では保存できない' do
        @purchase_address.post_code = '０００ー００００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'phoneが10桁未満では保存できない' do
        @purchase_address.phone = '0000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phoneが12桁以上では保存できない' do
        @purchase_address.phone = '000000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phoneが半角数字以外では保存できない' do
        @purchase_address.phone = '００００００００００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'tokenが空では保存できないこと' do
        @purchase_address.token = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("カード情報を入力してください")
      end
    end
  end
end
