class AddStripeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :stripe, :string
  end
end
