class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.text :drink
      t.timestamps
    end
  end
end
