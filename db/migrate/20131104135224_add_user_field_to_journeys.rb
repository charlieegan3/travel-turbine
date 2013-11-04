class AddUserFieldToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :user, :string
  end
end
