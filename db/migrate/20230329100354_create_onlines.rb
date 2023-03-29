class CreateOnlines < ActiveRecord::Migration[6.1]
  def change
    create_table :onlines do |t|
      t.integer :shop_id
      t.string :online_url
      t.timestamps
    end
  end
end
