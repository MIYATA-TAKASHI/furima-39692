require 'rails_helper'

RSpec.describe PurchaseShippingInfo, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase_shipping_info = FactoryBot.build(:purchase_shipping_info, item_id: item.id, user_id: user.id)
    end

    context '保存できる場合' do
      it '全ての情報が正しく入力されていれば保存できる' do
        expect(@purchase_shipping_info).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @purchase_shipping_info.building = ''
        expect(@purchase_shipping_info).to be_valid
      end
    end

    context '保存できない場合' do
      it 'postal_codeが空では保存できない' do
        @purchase_shipping_info.postal_code = ''
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが含まれないと保存できない' do
        @purchase_shipping_info.postal_code = '1234567'
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Postal code is invalid. Use 3 digits, hyphen, and 4 digits format")
      end
      it 'postal_codeに数字とハイフン以外が含まれると保存できない' do
        @purchase_shipping_info.postal_code = 'aaa-1234'
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Postal code is invalid. Use 3 digits, hyphen, and 4 digits format")
      end
      it 'postal_codeに全角文字が含まれると保存できない' do
        @purchase_shipping_info.postal_code = '１２３-４５６７'
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Postal code is invalid. Use 3 digits, hyphen, and 4 digits format")
      end
      it 'prefecture_idが空では保存できない' do
        @purchase_shipping_info.prefecture_id = ''
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが未選択(0)では保存できない' do
        @purchase_shipping_info.prefecture_id = 0
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @purchase_shipping_info.city = ''
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できない' do
        @purchase_shipping_info.address = ''
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @purchase_shipping_info.phone_number = ''
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに数字以外が含まれると保存できない' do
        @purchase_shipping_info.phone_number = '123-456-7890'
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Phone number is invalid. Use 10 or 11 digits without hyphen")
      end
      it 'phone_numberに全角数字が含まれると保存できない' do
        @purchase_shipping_info.phone_number = '１２３４５６７８９０'
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Phone number is invalid. Use 10 or 11 digits without hyphen")
      end
      it 'phone_numberが9桁以下では保存できない' do
        @purchase_shipping_info.phone_number = '123456789'
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Phone number is invalid. Use 10 or 11 digits without hyphen")
      end
      it 'phone_numberが12桁以上では保存できない' do
        @purchase_shipping_info.phone_number = '123456789012'
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Phone number is invalid. Use 10 or 11 digits without hyphen")
      end
      it 'tokenが空では保存できない' do
        @purchase_shipping_info.token = ''
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていないと保存できない' do
        @purchase_shipping_info.user_id = nil
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できない' do
        @purchase_shipping_info.item_id = nil
        @purchase_shipping_info.valid?
        expect(@purchase_shipping_info.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
