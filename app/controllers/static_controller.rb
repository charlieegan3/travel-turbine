class StaticController < ApplicationController
require 'open-uri'

	def index
		# Currently just displays static/index.html.erb
		@buses = bus("49","56","211113")
	end
	# Other actions could go here.

end
