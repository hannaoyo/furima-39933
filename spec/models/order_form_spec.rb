require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報が保存できるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_form.user_id = 1
        expect(@order_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_form.item_id = 1
        expect(@order_form).to be_valid
      end
      it '郵便番号が空でない、かつ「3桁ハイフン4桁」の組み合わせであれば保存できる' do
        @order_form.postal_code = '123-4567'
        expect(@order_form).to be_valid
      end
      it '都道府県が空でなければ保存できる' do
        @order_form.prefecture_id = 1
        expect(@order_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_form.city = '新宿区'
        expect(@order_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_form.address_number = '新宿１２３'
        expect(@order_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
      it '電話番号が空でなければ保存できる' do
        @order_form.phone_number = '09012345678'
        expect(@order_form).to be_valid
      end
      it '電話番号が10桁以上11桁以内、かつハイフンなしであれば保存できる' do
        @order_form.phone_number = '12345678901'
        expect(@order_form).to be_valid
      end
    end

    context '配送先情報が保存できないとき' do
      it 'user_idが空だと保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @order_form.postal_code = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @order_form.postal_code = 1_234_567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できない' do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できない' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @order_form.address_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address number can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できない' do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が10桁以下だと保存できない' do
        @order_form.phone_number = 9_012_345_67
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上だと保存できない' do
        @order_form.phone_number = 900_012_345_678
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
