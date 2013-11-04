class JourneysController < ApplicationController

	def new
		# Prepare a new Journey for creation.
		@journey = Journey.new
		@origin = Location.all.pluck("name")  # Using @origin for both origin and destination fields. No need to duplicate data.
		@date = Date.new
	end


	def create
		# Take the stuff selected in the form, and create a new 'journey' with it.

		@journey.origin = params[:origin]
		@journey.destination = params[:destination]
		@journeydate = params[:date]   # Journey table doesn't have date field. (See Schema.rb)
		@journey.train_result = train() # Need to include the location codes.

		# USE THE METHODS IN STATIC_CONTROLLER ?
		# Idea:    Make @origin in #new a 2-D array:   [ [CODE, NAME], [CODE, NAME], [CODE, NAME] ] etc...
		# OR:  Create a 'Location' model that contains an id field, and a name attribute.

		if @journey.save
			redirect_to :root
			# or display journey...
		end
		# else, throw error
	end


end
