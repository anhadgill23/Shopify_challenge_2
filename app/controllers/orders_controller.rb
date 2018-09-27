class OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def create
        @order = Order.total_sum
        redirect_to orders_path
    end

end
