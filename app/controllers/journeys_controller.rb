class JourneysController < ApplicationController

	def new
		@journey = Journey.new
		render '_searchform'
	#	@journey.origin = params[:origin]
	#	@journey.destination = params[:destination]
	#	@journey.methods = params[:methods]
	end


	def create
		if @journey.save
			redirect_to :root
		end
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
