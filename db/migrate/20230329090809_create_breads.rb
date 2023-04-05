class CreateBreads < ActiveRecord::Migration[6.1]
  def change
    create_table :breads do |t|
      t.integer :user_id
      t.integer :shop_id
      t.integer :drink_id
      t.text :bread_name, null: false
      t.text :introduce, null: false
      t.boolean :taste, null: false
      t.timestamps
    end
  end
end
