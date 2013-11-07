class AddOldDataToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :old_data, :string
  end
end
