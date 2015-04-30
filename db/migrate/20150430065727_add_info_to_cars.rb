class AddInfoToCars < ActiveRecord::Migration
  def change
    add_column :cars, :make, :string
    add_column :cars, :model, :string
    add_column :cars, :year, :string
    add_column :cars, :trim, :string
  end
end
