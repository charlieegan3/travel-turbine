class RenamePlaneToPlaneResults < ActiveRecord::Migration
  def change
  	rename_column :journeys, :plane, :plane_result
  end
end
