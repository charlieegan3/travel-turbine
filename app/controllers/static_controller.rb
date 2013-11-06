class StaticController < ApplicationController
	require 'open-uri'
	def index
		nouns = ["Travel", "Trip", "Trek", "Expedition", "Excursion", "Outing", "Foray", "Cruise", "Vacation", "Holiday", "Adventure", "Passage", "Quest", "Epic Journey", "Journey"]
		actions = ["Check", "Engine", "Turbine", "Checker", "Explorer", "Inquirer", "Detective", "Investigator"]
		@project_name = nouns.sample + " " + actions.sample
		@locations = Location.all.order("name ASC")
	end
end