class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details

    validates :post_code ,presence: true
    validates :address ,presence: true
    validates :name ,presence: true

    enum payment_method: { credit_card: 0, transfer: 1 }
    enum select_address: { my_address: 0, address_index: 1, address_new: 2}
    enum order_status: { payment_waiting: 0, payment_finish: 1, production: 2, ready_delivery: 3, delivery_finish: 4 }
    
    def with_tax_price
      (price_no_tax * 1.1).floor
    end

end
