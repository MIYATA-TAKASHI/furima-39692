require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '正常系テスト' do
      it '全ての必須項目が正しく入力されていれば、商品が有効であること' do
        expect(@item).to be_valid
      end
    end

    context '異常系テスト' do
      it '商品名が必須であること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '発送元の地域の情報が必須であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '商品の状態の情報が必須であること' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages_for(:status_id)).to include("Status must be other than 1")
      end

      it '配送料の負担の情報が必須であること' do
        @item.delivery_fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee burden must be other than 1")
      end

      it '発送までの日数の情報が必須であること' do
        @item.days_until_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipping must be other than 1")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages_for(:category_id)).to include("Category must be other than 1")
      end

      it '商品画像が1枚ついていること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages_for(:image)).to include("Image can't be blank")
      end

      it '価格の情報が必須であること' do
        @item.price = nil
        expect(@item).to_not be_valid
        expect(@item.errors[:price]).to include("can't be blank")
      end

      it '価格が299円以下の場合無効であること' do
        @item.price = 299
        expect(@item).to_not be_valid
        expect(@item.errors[:price]).to include('must be greater than or equal to 300')
      end

      it '価格が10,000,000以上の場合、無効であること' do
        @item.price = 10_000_000
        expect(@item).to_not be_valid
        expect(@item.errors[:price]).to include('must be less than or equal to 9999999')
      end

      it '価格に半角数字以外が含まれている場合登録できないこと' do
        @item.price = 'abc123'  
        @item.valid?
        expect(@item.errors.full_messages_for(:price)).to include('Price is not a number')
      end

      it 'userが紐づいていない場合登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages_for(:user)).to include("User must exist")
      end


    end
  end
end
