class UsersController < ApplicationController
	before_action :authenticate_user!    # before_action === before_filter   (latter is not yet deprecated)


	# Note:  It seems Devise handles controller stuff too, so for the moment we don't need to put anything here.

	# Additional methods should work, but stuff like new users and signing in is already handled by devise.

	def journeys
		journeys = Journey.where('owner = ? AND hidden IS NULL', current_user.id)
		journeys.each do |j|
			date = j.date
			year = Integer("20" + date[4,2])
			mon = date[2,2]
			day = date[0,2]
			#fix cases like 02 = 2nd
			if mon[0] == "0"
				mon = mon[1,1]
			end
			if day[0] == "0"
				day = day[1,1]
			end
			mon = Integer(mon)
			day = Integer(day)

			formated_date = DateTime.new(year, mon, day).to_date

			if formated_date < Time.now.to_date
				j.delete
			end 
		end
		@journeys = journeys.order("created_at DESC")
	end
end
