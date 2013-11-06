class StaticController < ApplicationController
	require 'open-uri'
	def index
		nouns = ["Quest" ,"Travel", "Trip", "Trek", "Expedition", "Excursion", "Outing", "Foray", "Cruise", "Vacation", "Holiday", "Adventure", "Passage", "Quest", "Epic Journey", "Journey"]
		actions = ["Counter", "Quantifier", "Check", "Engine", "Turbine", "Checker", "Explorer", "Inquirer", "Detective", "Investigator"]
		@project_name = nouns.sample + " " + actions.sample
		@locations = Location.all.order("name ASC")
	end
end