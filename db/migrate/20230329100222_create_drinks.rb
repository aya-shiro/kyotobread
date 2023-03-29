class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.integer :user_id
      t.integer :shop_id
      t.text :drink
      t.text :suggest
      t.timestamps
    end
  end
end
