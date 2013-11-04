class JourneysController < ApplicationController

	def new
		# Prepare a new Journey for creation.
		orig = Location.find_by_name(params[:origin]) #all loc's have uniq names
		dest = Location.find_by_name(params[:destination])
		date = params[:date]

		@data = best_journey(orig,dest,date)
		@journey = Journey.new
		@journey.origin = params[:origin]
		@journey.destination = params[:destination]
		@journey.date = params[:date]
		@journey.train_result = @data[1][0].to_s
		@journey.bus_result = @data[1][1].to_s
		@journey.plane_result = @data[1][2].to_s
		#@journey.save #to stop creating uneeded elements in testing

		# USER INFO -> Use devise helper to check if a user is signed in  (Work in Progress)
		if user_signed_in?
			@journey.user = current_user#.email?    # https://github.com/plataformatec/devise#controller-filters-and-helpers
		else
			@journey.user = "Anonymous"
		end

		#things for the view
		@train_result = @journey.train_result.split(',')
	end

end
