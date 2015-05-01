class AddTransToCars < ActiveRecord::Migration
  def change
    add_column :cars, :trany, :string
  end
end
