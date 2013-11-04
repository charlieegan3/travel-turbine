class AddDateToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :date, :string
  end
end
