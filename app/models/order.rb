class Order < ApplicationRecord
    has_many :line_items

    def self.grand_total
        self.phone.price * self.quantity
    end
end
