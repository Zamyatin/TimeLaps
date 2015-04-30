class AddAppDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_index :users, :username
    add_column :users, :zipcode, :string
    add_column :users, :is_retailer, :boolean
  end
end
