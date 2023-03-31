class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.integer :bread_id
      t.text :drink
      t.text :suggest
      # ↑breadのintroduceにdrinkのsuggestを含むか否かは未明のため一旦残す
      t.timestamps
    end
  end
end
