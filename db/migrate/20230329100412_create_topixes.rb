class CreateTopixes < ActiveRecord::Migration[6.1]
  def change
    create_table :topixes do |t|
      t.integer :bread_id
      t.integer :shop_id
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
