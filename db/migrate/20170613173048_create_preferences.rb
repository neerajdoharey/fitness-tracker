class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :preferences do |t|
      t.references :user
      t.string :measure_type
      t.text :unit_for_measure
      t.timestamps
    end
  end
end
