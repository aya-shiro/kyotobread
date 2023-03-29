class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.string :postcode
      t.text :address
      t.text :nearest_station
      t.text :shop_url
      t.timestamps
    end
  end
end
