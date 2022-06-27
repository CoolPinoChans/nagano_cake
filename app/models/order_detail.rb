class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item
    
    def subtotal_order
        tax_in_price * quantity
    end
end
