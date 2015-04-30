class RemoveOwnerIdFromGarages < ActiveRecord::Migration
  def change
    remove_column :garages, :owner_id, :integer
  end
end
