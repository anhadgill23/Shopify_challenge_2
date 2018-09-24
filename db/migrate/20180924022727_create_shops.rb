class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.text :name
      t.text :address
      t.integer :phone

      t.timestamps
    end
  end
end
