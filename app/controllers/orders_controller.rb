class OrdersController < ApplicationController
    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
    end

    def new
        @order = Order.new
    end

    def create
        @order.sub_total = ListItems.where(:order_id => :id).sum
        @order.order_date = Date.today
        if @order.valid?
            redirect_to @shops
        end
        @order.save
    end


end
