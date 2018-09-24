json.extract! product, :id, :name, :unit_price, :category, :total_in_stock, :created_at, :updated_at
json.url product_url(product, format: :json)
