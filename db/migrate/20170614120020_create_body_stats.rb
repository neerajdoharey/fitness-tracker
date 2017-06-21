class CreateBodyStats < ActiveRecord::Migration[5.0]
  def change
    create_table :body_stats do |t|
      t.references :user
      t.integer :body_fat
      t.float :weight
      t.float :height
      t.float :waist
      t.float :chest
      t.float :arms
      t.float :forearms
      t.float :hips
      t.float :neck
      t.float :shoulders
      t.float :thighs
      t.float :calves
      t.timestamps
    end
  end
end
