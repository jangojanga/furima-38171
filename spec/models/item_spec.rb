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
        # it "商品画像が空では登録できない" do
        #   @item.image = ''
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include("Email can't be blank")
        # end
        
        it "商品名が空では登録できない" do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it "商品の説明が空では登録できない" do
          @item.description = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end

        it "商品の詳細カテゴリが空では登録できない" do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
        end

        it "商品の詳細商品の状態が空では登録できない" do
          @item.item_status_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item status can't be blank", "Item status is not a number")
        end

        it "配送料の負担が空では登録できない" do
          @item.lord_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Lord can't be blank", "Lord is not a number")
        end

        it "配送元の地位域が空では登録できない" do
          @item.former_area_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Former area can't be blank", "Former area is not a number")
        end

        it "発送までの日数が空では登録できない" do
          @item.days_before_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Days before can't be blank", "Days before is not a number")
        end

        it "販売価格が空では登録できない" do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is invalid")
        end

       



    end
  end
end
