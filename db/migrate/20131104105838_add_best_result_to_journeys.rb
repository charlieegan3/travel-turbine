class AddBestResultToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :best_result, :string
  end
end
