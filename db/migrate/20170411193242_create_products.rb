class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.decimal :price
      t.string :image
      t.text :description
      t.integer :stock

      t.timestamps
    end
  end
end
