class AddOwnerToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :owner, :integer
  end
end
