class LineItemController < ApplicationController
    def create
        @line_item = LineItem.create(line_item_params)
        @line_item.order_id = 1
        @line_item.product_id = 1

        if @line_item.valid?
            redirect_to @shops
        end
        @line_item.save
    end


    private
        def line_item_params
            params.require(:line_item).permit(:quantity, :total, :product_id, :order_id)
        end
end
