class AddUserColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_name, :string, null: false
    add_index :users, :last_name
    add_column :users, :first_name, :string, null: false
    add_index :users, :first_name
    add_column :users, :kana_last_name, :string, null: false
    add_index :users, :kana_last_name
    add_column :users, :kana_first_name, :string, null: false
    add_index :users, :kana_first_name
    add_column :users, :birthdate, :date, null: false
    add_index :users, :birthdate
  end
end
