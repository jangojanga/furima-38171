class OrdersController < ApplicationController

  before_action :authenticate_user!, except: []

  before_action :set_item, only: [:index, :criate ]

def index
  @ab = Ab.new
 

  if current_user.id == @item.user.id or @item.buyer != nil
    redirect_to root_path
  end

  # if @item.buyer != nil
  #   redirect_to root_path
  # end
end



def create
  # binding.pryは処理に不要なので削除する
  # 値をDBへ保存する実装

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
    params.require(:ab).permit(:tel,:post_code, :former_area_id, :city, :address, :building, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:id])
  end


  def pay_item
    Payjp.api_key = "PAYJP_SECRET_KEY"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: @ab.token,    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end


