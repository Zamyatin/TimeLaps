class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :color
      t.decimal :purcahse_price
      t.date :purchase_date
      t.string :vin
      t.integer :modification_id
      t.integer :edmunds_listing_id

      t.timestamps null: false
    end
  end
end
