class PurchasesController < ApplicationController

    def index
        @purchase_address = PurchaseAddress.new
    end
end
