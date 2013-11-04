class StaticController < ApplicationController
	require 'open-uri'
	def index
		@locations = Location.all
	end
end