class CreateShopTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_topics do |t|
      t.integer :shop_id
      t.integer :topic_id
      t.timestamps
    end
  end
end
