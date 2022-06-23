class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer   :order_id
      t.integer   :item_id
      t.integer   :quantity
      t.integer   :production_status, default: 0
      t.integer   :tax_in_price

      t.timestamps
    end
  end
end
