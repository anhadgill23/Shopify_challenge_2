class OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def new
        @order = Order.new
    end

    def create
        @order_sum = Order.line_items(:order_id).count
        if @order.valid?
            redirect_to @shops
        end
        @order.save
    end


end
