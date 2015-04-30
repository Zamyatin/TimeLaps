class AddOwnerIdToCars < ActiveRecord::Migration
  def change
    add_column :cars, :owner_id, :integer
  end
end
