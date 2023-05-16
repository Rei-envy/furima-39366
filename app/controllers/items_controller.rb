class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @user = User.find(current_user.id)
    @item = @user.items.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduce, :category_id, :statement_id, :load_id, :prefecture_id, :send_day_id,
                                 :price).merge(user_id: current_user.id)
  end
end
