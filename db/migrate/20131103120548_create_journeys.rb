class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|
      t.string :origin
      t.string :destination
      t.string :train_result
      t.string :bus_result
      t.string :plane

      t.timestamps
    end
  end
end
