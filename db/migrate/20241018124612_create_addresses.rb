class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,     null: false
      t.integer    :prefecture_id, null: false
      t.string     :municipality,  null: false
      t.string     :block,         null: false
      t.string     :building
      t.string     :phone_num,     null: false
      t.references :record,        null: false, foreign_key: true
      t.timestamps
    end
  end
end