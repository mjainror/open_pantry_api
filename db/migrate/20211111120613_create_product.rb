class CreateProduct < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :supplier_category_id
      t.integer :supplier_id
      t.string :sku
      
      t.timestamps
    end
  end
end
