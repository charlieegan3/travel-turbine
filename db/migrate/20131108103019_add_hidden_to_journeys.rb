class AddHiddenToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :hidden, :boolean
  end
end
