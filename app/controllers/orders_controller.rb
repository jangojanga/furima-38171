class OrdersController < ApplicationController

  before_action :authenticate_user!, except: []

def index
  @ab = Ab.new
  @item = Item.find(params[:item_id])

  if current_user.id == @item.user.id
    redirect_to root_path
  end

  if @item.buyer != nil
    redirect_to root_path
  end
end



def create
  # binding.pryは処理に不要なので削除する
  # 値をDBへ保存する実装
  @item = Item.find(params[:item_id])
  @ab = Ab.new(ab_params)
    if @ab.valid?
      pay_item
      @ab.save

      redirect_to root_path
    else
      render :index
    end
end


private

  def ab_params
    params.require(:ab).permit(:tel,:item_id,:post_code, :former_area_id, :city, :address, :building, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


  def pay_item
    Payjp.api_key = "sk_test_6de32ab50437c9e164837a95"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: @ab.token,    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end


