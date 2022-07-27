require 'rails_helper'

RSpec.describe Ab, type: :model do
  before do
    @ab = FactoryBot.build(:ab)
  end

  describe '商品新規登録' do
    context '新規登録できる場合' do
      it '全部正しく存在すれば登録できる' do
        expect(@ab).to be_valid
      end
    end
    context '郵便番号できない場合' do
         it "では登録できない" do
           @ab.post_code = ''
           @ab.valid?
           expect(@ab.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
         end
        
        it "都道府県が空では登録できない" do
          @ab.former_area_id =  -1
          @ab.valid?
          expect(@ab.errors.full_messages).to include("Former area must be greater than or equal to 1")
        end

        it "しが空では登録できない" do
          @ab.city = ''
          @ab.valid?
          expect(@ab.errors.full_messages).to include("City can't be blank")
        end

        it "番地が空では登録できない" do
          @ab.address = ''
          @ab.valid?
          expect(@ab.errors.full_messages).to include("Address can't be blank")
        end

        it "電話番号が空では登録できない" do
          @ab.tel = ''
          @ab.valid?
          expect(@ab.errors.full_messages).to include("Tel can't be blank")
        end





        it "番地がハイフンnasi
        では登録できない" do
          @ab.post_code = 1234567
          @ab.valid?
          expect(@ab.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end

        it "電話番号ハイフンありは登録できない" do
          @ab.tel = "090-1234-5678"
          @ab.valid?
          expect(@ab.errors.full_messages).to include("Tel is invalid")
        end

        it "電話番号9桁以下は登録できない" do
          @ab.tel = "090-123-567"
          @ab.valid?
          expect(@ab.errors.full_messages).to include("Tel is invalid")
        end

        it "電話番号１２桁以上は登録できない" do
          @ab.tel = "0900-12340-56780"
          @ab.valid?
          expect(@ab.errors.full_messages).to include("Tel is invalid")
        end

        it 'userが紐付いていないと保存できない' do
          @ab.user_id = nil
          @ab.valid?
          expect(@ab.errors.full_messages).to include('User must exist')
        end

        it 'userが紐付いていないと保存できない' do
          @ab.item_id = nil
          @ab.valid?
          expect(@ab.errors.full_messages).to include('Item must exist')
        end





        it "tokenが空では登録できないこと" do
          @ab.token = nil
          @ab.valid?
          expect(@ab.errors.full_messages).to include("Token can't be blank")
        end

    end
  end
end
