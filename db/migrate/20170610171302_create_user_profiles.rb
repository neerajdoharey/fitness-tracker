class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.references :user
      t.string :gender
      t.datetime :date_of_birth
      t.string :address1
      t.string :address2
      t.timestamps
    end
  end
end
