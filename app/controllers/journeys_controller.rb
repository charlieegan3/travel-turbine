class JourneysController < ApplicationController

	def new
		@journey = Journey.new
		@origin = Location.all.pluck("name")  # Using @origin for both origin and destination fields.
		@date = Date.new
	end


	def create
		# Take the stuff selected in the form, and create a new 'journey' with it.
		@journey = best_journey(params[:origin], params[:destination], params[:date])

		if @journey.save
			redirect_to :root
			# or display journey...
		end
		# else, throw error
	end

	def search(method, origin, destination, date)   # Search for possible journeys - just calls bus(), train(), plane().
		#obviously a neater way of doing this...   like #{args?}
		if method = "bus"
			@search = bus(origin, destination, date)
		end
		if method = "train"
			@search = train(origin, destination, date)
		end
		if method = "plane"
			@search = train(origin, destination, date)
		end
		else
			return "Please enter a valid travel method. Options are train, plane, or bus"
		

	end

end
