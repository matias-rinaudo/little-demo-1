class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.integer :stock

      t.timestamps
    end
  end
end
