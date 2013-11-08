class RemoveUserFromJourneys < ActiveRecord::Migration
  def change
    remove_column :journeys, :user, :string
  end
end
