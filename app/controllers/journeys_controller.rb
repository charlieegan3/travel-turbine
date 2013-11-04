class JourneysController < ApplicationController

	def new
		orig = Location.find_by_name(params[:origin]) #all loc's have uniq names
		dest = Location.find_by_name(params[:destination])
		date = params[:date]

		@data = best_journey(orig,dest,date)
		@journey = Journey.new
		@journey.origin = params[:origin]
		@journey.destination = params[:destination]
		@journey.date = params[:date]
		@journey.train_result = @data[1][0]
		@journey.bus_result = @data[1][1]
		@journey.plane_result = @data[1][2]
		@journey.best_result = @data[0]
		#@journey.save #to stop creating uneeded elements in testing

		#vars for the view
		year = Integer("20" + date[4,2])
		mon = Integer(date[1,2])
		day = Integer(date[0,2])
		@date = DateTime.new(year, mon, day).to_date

		@train_list = @journey.train_result[0]
		@train_best = @journey.train_result[1][1]
		@train_link = @journey.train_result[2]

		@bus_list = @journey.bus_result[0]
		@bus_best = @journey.bus_result[1][1]
		@bus_link = @journey.bus_result[2]

		@plane_list = @journey.plane_result[0]
		@plane_best = @journey.plane_result[1][1]
		@plane_link = @journey.plane_result[2]


		case @journey.best_result[1]
		when "plane"
		  @best_link = @plane_link
		when "bus"
		  @best_link = @bus_link
		when "train"
		  @best_link = @train_link
		else
		  @best_link = "http://www.error.com"
		end

		# USER INFO -> Use devise helper to check if a user is signed in  (Work in Progress)
		if user_signed_in?
			@journey.user = current_user#.email?    # https://github.com/plataformatec/devise#controller-filters-and-helpers
		else
			#@journey.user = "anon"
		end
	end


	def destroy
		if admin_session?
			@journey = Journey.find(params[:id])
			@journey.destroy
		else
			flash[:alert] = "You must have admin rights to delete journeys."
		end
	end

end
