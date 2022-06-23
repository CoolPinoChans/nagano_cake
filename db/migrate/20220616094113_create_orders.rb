class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer  :customer_id
      t.string   :post_code
      t.string   :address
      t.string   :name
      t.integer  :order_status, default: 0
      t.integer  :payment_method, default: 0
      t.integer  :postage
      t.integer  :billing_amount



      t.timestamps
    end
  end
end
