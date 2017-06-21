class AddInitSettingColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :init_settings, :text
  end
end
