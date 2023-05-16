class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :load
    belongs_to :prefecture
    belongs_to :send_day
    belongs_to :statement

    #空の投稿を保存できないようにする
    validates :name,         presence: true
    validates :introduce,    presence: true

    #半角数字のみを許可し、300~9999999までの範囲を許可
    with_options presence: true, format: { with: /\A[0-9]+\z/i } do
        validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9_999_999}
    end

    #ジャンルの選択が「---」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 }
    validates :statement_id, numericality: { other_than: 1 }
    validates :load_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :send_day_id, numericality: { other_than: 1 }
end