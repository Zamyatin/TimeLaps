class CreateGarages < ActiveRecord::Migration
  def change
    create_table :garages do |t|
      t.string :name
      t.string :short_desc
      t.text :long_desc
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
