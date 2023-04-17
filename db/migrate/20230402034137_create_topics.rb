class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.integer :bread_id
      t.string :title
      t.text :body
      t.boolean :is_published, default: false , null: false
      t.timestamps
    end
  end
end
