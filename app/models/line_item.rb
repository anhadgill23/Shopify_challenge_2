class LineItem < ApplicationRecord
    belongs_to :product
    belongs_to :order

    def self.total
        line_item = LineItem.find_by(id: 1)
        current_order = LineItem.where(order_id: order).sum(:total)

        order.sub_total = current_order
        order.save
    end
end
