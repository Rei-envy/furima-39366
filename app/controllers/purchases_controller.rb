class PurchasesController < ApplicationController

    def index
        @purchase_address = PurchaseAddress.new
        @purchase = Purchase.new(purchase_params)
    end

    def create
        @purchase = Purchase.new(purchase_params)
        @purchase_address = PurchaseAddress.new(purchase_address_params)
        if @purchase_address.valid?
            @purchase_address.save
            redirect_to root_path
        else
            render :index
        end
    end

    private
    def purchase_params
        params.permit(:name, :image, :price, :load_id).merge(user_id: current_user.id, item_id: params[:item_id])
    end

    def purchase_address_params
        params.require(:purchase_address).permit(:post_code, :prefecture_id, :locality, :house_number, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id],purchase_id: @purchase.id)
    end
end