require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user: @user)
  end

  describe '商品出品登録' do
    context '出品登録ができるとき'do
      it '全ての入力項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが「---」以外でれば登録できる' do
        @item.category_id = 1
        expect(@item).to be_valid
      end
      it '商品の状態が「---」以外でれば登録できる' do
        @item.item_status_id = 1
        expect(@item).to be_valid
      end
      it '発送の負担が「---」以外でれば登録できる' do
        @item.delivery_charge_id = 1
        expect(@item).to be_valid
      end
      it '発送元の地域が「---」以外でれば登録できる' do
        @item.prefecture_id = 1
        expect(@item).to be_valid
      end
      it '発送までの日数が「---」以外でれば登録できる' do
        @item.delivery_time_id = 1
        expect(@item).to be_valid
      end
      it '価格が半角数字で、300円～9,999,999円でれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '出品登録ができないとき'do
      it 'ユーザー登録しないと出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank", "User must exist")
      end
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空では登録できない' do
        @item.item_detail = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item detail can't be blank")
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it 'カテゴリーが「---」では登録できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it '商品の状態が空では登録できない' do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank", "Item status is not a number")
      end
      it '商品の状態が「---」では登録できない' do
        @item.item_status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 0")
      end
      it '配送料の負担が空では登録できない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank", "Delivery charge is not a number")
      end
      it '配送料の負担が「---」では登録できない' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 0")
      end
      it '発送元の地域が空では登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it '発送元の地域が「---」では登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '発送までの日数が空では登録できない' do
        @item.delivery_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank", 'Delivery time is not a number')
      end
      it '発送までの日数が「---」では登録できない' do
        @item.delivery_time_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time must be other than 0")
      end
      it '価格の情報が空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満では登録できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が9,999,999円以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
