class AddDefaultSelectToDrink < ActiveRecord::Migration[6.1]
  def change
    add_column :drinks, :default_select, :boolean, default: false
  end
end
