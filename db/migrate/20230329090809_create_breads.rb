class CreateBreads < ActiveRecord::Migration[6.1]
  def change
    create_table :breads do |t|
      t.integer :user_id
      t.integer :shop_id
      t.text :bread
      t.text :introduce
      t.timestamps
    end
  end
end
