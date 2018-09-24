# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "Seeding Data ..."

## SHOPS

puts "Creating Shops ..."

shop1 = Shop.new(
    :name => 'Nike', 
    :address => '100 Armour Street', 
    :phone => '7788880104'
)

shop1.save!

shop2 = Shop.new(
    :name => 'Abercrombie', 
    :address => '701 W Georgia St', 
    :phone => '7788880104'
)

shop2.save!

## PRODUCTS

Product.destroy_all

puts "Re-creating Products ..."

product1 = shop1.products.new(
    :name => 'Air', 
    :unit_price => 100, 
    :category => 'shoes',
    :total_in_stock => 7
)

product1.save!

product2 = shop1.products.create(
    :name => 'Running', 
    :unit_price => 140, 
    :category => 'shoes',
    :total_in_stock => 12
)

product2.save!

product3 = shop2.products.create(
    :name => 'Jumper', 
    :unit_price => 200, 
    :category => 'Jacket',
    :total_in_stock => 5
)

product3.save!

## LINE_ITEMS

puts "Creating Line Items ..."

# line_item1 = LineItem.create!(
#   quantity: 2,
#   total: 230
# )

# line_item1.save
