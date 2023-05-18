class PurchaseAddress
    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :locality, :house_number, :building, :phone, :purchase_id

    # ここにバリデーションの処理を書く
    with_options presence: true do
        validates :user_id
        validates :item_id
        validates :post_code,       format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
        validates :locality
        validates :house_number    
        validates :phone,           format: {with: /\A[0-9]{10,11}\z/}
        validates :purchase_id
    end
    # ジャンルの選択が「---」の時は保存できないようにする
    validates :prefecture_id, numericality: { other_than: 1 }

    def save
        # 購入情報を保存し、変数purchaseに代入する
        purchase = Purchase.create(user_id: user_id, item_id: item_id)
        # 住所を保存する
        Address.create(post_code: post_code, prefecture_id: prefecture_id, locality: locality, house_number: house_number, building: building, phone: phone, purchase_id: purchase.id)
    end
end