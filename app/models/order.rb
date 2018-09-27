class Order < ApplicationRecord
    has_many :line_items

    
    def self.total_sum
        order = Order.find_by(id: 1)
        current_order = LineItem.where(order_id: order).sum(:total)

        order.sub_total = current_order
        order.save
    end
end
