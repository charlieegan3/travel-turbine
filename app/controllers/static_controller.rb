class StaticController < ApplicationController
	require 'open-uri'
	def index
		@locations = Location.all.order("name ASC")
	end
end