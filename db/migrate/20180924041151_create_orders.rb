class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.integer :sub_total
      t.timestamps
    end
  end
end
