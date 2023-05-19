class PurchasesController < ApplicationController
  before_action :authenticate_user! 
  before_action :move_to_root, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_address_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :locality, :house_number, :building, :phone).merge(
      user_id: current_user.id, item_id: params[:item_id], purchase_id: @purchase.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @purchase.item.price, # 商品の値段
      card: purchase_address_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類（日本円）
    )
  end

  # 出品していない売却済みの商品の商品購入ページに遷移しようとすると、トップページに遷移する
  # ログインしているユーザーと出品者が同じであるときも、トップページに遷移
  def move_to_root
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.purchase.present?
        redirect_to root_path

    end
  end
end
