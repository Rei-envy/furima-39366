class PurchaseAddress
    include ActiveModel::Model
    attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :locality, :house_number, :building, :phone

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture

    # ここにバリデーションの処理を書く
    with_options presence: true do
        validates :user_id
        validates :item_id
        validates :post_code       format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
        validates :locality
        validates :house_number    
        validates :phone           format: {with: /\A[0-9]{10,11}\z/}
    end
    # ジャンルの選択が「---」の時は保存できないようにする
    validates :prefecture_id, numericality: { other_than: 1 }

    def save
        # 各テーブルにデータを保存する処理を書く
    end
end
