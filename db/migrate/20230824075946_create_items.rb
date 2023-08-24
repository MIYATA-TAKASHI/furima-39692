class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :category_id, null: false, foreign_key: true
      t.text :description
      t.integer :price
      t.integer :status_id, null: false, foreign_key: true
      t.integer :delivery_fee_burden_id, null: false, foreign_key: true
      t.integer :prefecture_id, null: false, foreign_key: true
      t.integer :days_until_shipping_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
