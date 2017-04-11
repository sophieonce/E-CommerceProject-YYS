class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :customer, foreign_key: true
      t.references :province, foreign_key: true
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :city
      t.string :province
      t.string :country

      t.timestamps
    end
  end
end
