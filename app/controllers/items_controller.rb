class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :update, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy if current_user.id == item.user_id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduce, :category_id, :statement_id, :load_id, :prefecture_id, :send_day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # 自身が出品した売却済み商品の商品情報編集ページに遷移しようとすると、トップページに遷移する
  def move_to_index
    return unless current_user.id != @item.user_id || @item.purchase.present?

    redirect_to action: :index
  end
end
