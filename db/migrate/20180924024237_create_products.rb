class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name
      t.integer :unit_price
      t.text :category
      t.integer :total_in_stock
      t.integer :shop_id
      t.timestamps
    end
  end
end
