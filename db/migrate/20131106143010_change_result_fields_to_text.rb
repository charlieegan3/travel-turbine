class ChangeResultFieldsToText < ActiveRecord::Migration
  def change
  	change_column :journeys, :train_result, :text
  	change_column :journeys, :bus_result, :text
  	change_column :journeys, :plane_result, :text
  	change_column :journeys, :best_result, :text
  end
end
