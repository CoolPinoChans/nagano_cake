class OrderDetail < ApplicationRecord

  
  enum production_status: { "not_available": 0, "production_waiting": 1, "in_production": 2, "production_finish": 3,}

    belongs_to :order
    belongs_to :item
    
    def subtotal_order
        tax_in_price * quantity
    end

end
