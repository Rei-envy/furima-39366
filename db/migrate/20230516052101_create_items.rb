class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,           null: false, default: ""
      t.text       :introduce,      null: false
      t.integer    :category_id,    null: false
      t.integer    :statement_id,   null: false 
      t.integer    :load_id,        null: false
      t.integer    :prefecture_id,  null: false
      t.integer    :send_day_id,    null: false
      t.integer    :price,          null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end