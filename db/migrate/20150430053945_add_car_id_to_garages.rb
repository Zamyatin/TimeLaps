class AddCarIdToGarages < ActiveRecord::Migration
  def change
    add_column :garages, :car_id, :integer
  end
end
