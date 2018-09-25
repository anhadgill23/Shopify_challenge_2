class OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def create
        sub_total = total_sum
        @order = @order.new(sub_total: sub_total)
        if @order.valid?
            redirect_to orders
        end
        @order.save
    end

    def total_sum
        @order_sum = Order.line_items.find_where_order_id(order.id).sum
    end

end
