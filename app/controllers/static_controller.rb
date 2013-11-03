class StaticController < ApplicationController
require 'open-uri'

	def index
		# Currently just displays static/index.html.erb
	end
	# Other actions could go here.

	def search
		orig = Location.find_by_name(params[:origin]) #all loc's have uniq names
		dest = Location.find_by_name(params[:destination])
		date = params[:date]

		data = best_journey(orig,dest,date)

		train_data = data[0]
		bus_data = data[1]
		plane_data = data[2]

		#parse all data
		@train_results = train_data[0]
		@train_best = train_data[1]
		@train_url = train_data[2]
		@bus_results = bus_data[0]
		@bus_best = bus_data[1]
		@bus_url = bus_data[2]
		@plane_results = plane_data[0]
		@plane_best = plane_data[1]
		@plane_url = plane_data[2]

		#summary variables
		bests = [[train_data[1][0], "train"], [bus_data[1][0], "bus"], [plane_data[1][0], "plane"]]
		@ranked = bests.sort {|a,b| a[0] <=> b[0]}
	end

end