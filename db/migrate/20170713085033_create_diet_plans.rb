class CreateDietPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :diet_plans do |t|
      t.references :user
      t.string :title
      t.text :diet_description
      t.timestamps
    end
  end
end
