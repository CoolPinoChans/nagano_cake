class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_detail
    
    enum payment_method: { credit_card: 0, transfer: 1 }
    enum select_address: { my_address: 0, address_index: 1, address_new: 2}
    
    def subtotal_check
        item.with_tax_price * quantity
    end
    
    def postage
        800
    end
end
