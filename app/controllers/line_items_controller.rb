class LineItemsController < ApplicationController
    def index
        @line_items = LineItem.all
    end
    
    def create
        @shop = Shop.find(params[:shop_id])
        @product = @shop.products.find(params[:product_id])
        add_product(@product)
    end

    def add_product(product)
        current_item = LineItem.find_by_product_id(product.id)
        if current_item.present?
            current_item.quantity += 1
            current_item.total = product.unit_price * current_item.quantity
            current_item.save
            redirect_to line_items_path
        else
            current_item = LineItem.create(product_id: product.id, order_id: 1, quantity: 1, total: product.unit_price)
            if current_item.valid?
                redirect_to line_items_path
                puts 'LINE_ITEM is added.'
            else
                puts 'ERRRRROR'
                redirect_to line_items_path
            end
        end
        current_item
    end


    private
        def line_item_params
            params.require(:line_item).permit(:quantity, :total, :product_id, :order_id)
        end
end
