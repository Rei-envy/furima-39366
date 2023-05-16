class Item < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :load
    belongs_to :prefecture
    belongs_to :send_day
    belongs_to :statement
end
