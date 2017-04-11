class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.references :province, foreign_key: true
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
