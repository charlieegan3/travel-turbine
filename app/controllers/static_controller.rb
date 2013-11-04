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

		@data = best_journey(orig,dest,date)
	end

end