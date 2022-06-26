class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_detail

    validates :post_code ,presence: true
    validates :address ,presence: true
    validates :name ,presence: true

    enum payment_method: { credit_card: 0, transfer: 1 }
    enum select_address: { my_address: 0, address_index: 1, address_new: 2}
  
end
