class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :bus
      t.string :station
      t.string :airport

      t.timestamps
    end
  end
end
