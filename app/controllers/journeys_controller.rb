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
		@journey.save
#		@origin = Location.all.pluck("name")  # Using @origin for both origin and destination fields. No need to duplicate data.
#		@date = Date.new
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
