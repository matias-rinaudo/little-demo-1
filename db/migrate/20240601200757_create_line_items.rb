class CreateLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.references :product, foreign_key: true
      t.references :cart, foreign_key: true
      
      t.timestamps
    end
  end
end
