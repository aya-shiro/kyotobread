class CreatePanImages < ActiveRecord::Migration[6.1]
  def change
    create_table :pan_images do |t|

      t.timestamps
    end
  end
end
