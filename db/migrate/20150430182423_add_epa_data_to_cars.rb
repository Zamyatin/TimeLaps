class AddEpaDataToCars < ActiveRecord::Migration
  def change
    add_column :cars, :epa_id, :integer
  end
end
