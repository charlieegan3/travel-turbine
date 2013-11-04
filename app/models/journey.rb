class Journey < ActiveRecord::Base
	serialize :train_result,Array
	serialize :bus_result,Array
	serialize :plane_result,Array
	belongs_to :user
end
