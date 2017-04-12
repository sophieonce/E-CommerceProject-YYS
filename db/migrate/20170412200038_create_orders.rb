class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.references :status, foreign_key: true
      t.decimal :total

      t.timestamps
    end
  end
end
