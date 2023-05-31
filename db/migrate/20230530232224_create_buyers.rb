class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string :post_code, null: false
      t.integer :region_id, null: false
      t.string :city , null: false
      t.string :block, null: false
      t.string :building
      t.string :phone, null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
