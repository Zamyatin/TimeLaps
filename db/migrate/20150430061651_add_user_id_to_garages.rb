class AddUserIdToGarages < ActiveRecord::Migration
  def change
    add_column :garages, :user_id, :integer
  end
end
