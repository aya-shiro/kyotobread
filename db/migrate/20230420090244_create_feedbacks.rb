class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.text :opinion, null: false
      t.boolean :is_solved, default: false , null: false
      t.timestamps
    end
  end
end
