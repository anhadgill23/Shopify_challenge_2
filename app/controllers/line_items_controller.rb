class LineItemsController < ApplicationController
    def index
        @line_items = LineItem.all
    end
    
    def create
        @shop = Shop.find(params[:shop_id])
        @product = @shop.products.find(params[:product_id])
        current_item = LineItem.find_by_product_id(@product.id)
        if current_item.present?
            current_item.quantity += 1
            current_item.total = @product.unit_price * current_item.quantity
            current_item.save
            redirect_to line_items_path
        else
            current_item = LineItem.create!(product_id: @product.id, order_id: 1, quantity: 1, total: @product.unit_price)
            redirect_to line_items_path
        end
    end

    private
        def line_item_params
            params.require(:line_item).permit(:quantity, :total, :product_id, :order_id)
        end
end
