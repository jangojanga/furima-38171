require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できる場合' do
      it '全部正しく存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できない場合' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it '商品の詳細カテゴリが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be greater than or equal to 2')
      end

      it '商品の詳細商品の状態が空では登録できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be greater than or equal to 2')
      end

      it '配送料の負担が空では登録できない' do
        @item.lord_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Lord must be greater than or equal to 2')
      end

      it '配送元の地位域が空では登録できない' do
        @item.former_area_id = -1
        @item.valid?
        expect(@item.errors.full_messages).to include('Former area must be greater than or equal to 1')
      end

      it '発送までの日数が空では登録できない' do
        @item.days_before_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days before must be greater than or equal to 2')
      end

      it '販売価格が空では登録できない' do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格が半角英数字が含まれていては登録できない' do
        @item.price = '3000a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number', 'Price is not a number')
      end

      it '販売価格が少数では登録できない' do
        @item.price = 4000.1
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end

      it '販売価格が300以下では登録できない' do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格が9_999_999を超えるとは登録できない' do
        @item.price = '999999999'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
