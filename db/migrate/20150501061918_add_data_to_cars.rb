class AddDataToCars < ActiveRecord::Migration
  def change
    add_column :cars, :displ, :float
    add_column :cars, :cylinders, :integer
    add_column :cars, :vehicle_class, :string
    add_column :cars, :s_charger, :boolean, :default => false
    add_column :cars, :t_charger, :boolean, :default => false
    add_column :cars, :drive, :string
  end
end
