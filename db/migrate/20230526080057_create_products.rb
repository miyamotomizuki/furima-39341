class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :explain, null: false
      t.integer :price, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :shipping_cost_id, null: false
      t.integer :region_id, null: false
      t.integer :shipping_date_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
