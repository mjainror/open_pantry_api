class CreateCategory < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    Category.create([  
      { name: "Beverages" },
      { name: "Bread/Bakery" },
      { name: "Canned/Jarred Goods" },
      { name: "Dairy" },
      { name: "Dry/Baking Goods" },
      { name: "Frozen Foods" },
      { name: "Meat" },
      { name: "Produce" },
      { name: "Cleaners" },
      { name: "Paper Goods" },
      { name: "Personal Care" },
      { name: "Other" }
    ])
  end
end
