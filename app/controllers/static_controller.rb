class StaticController < ApplicationController
	def index
		#since when did programmers have to choose the name anyway!
		nouns = ["Quest" ,"Travel", "Trip", "Trek", "Expedition", "Excursion", "Outing", "Foray", "Cruise", "Vacation", "Holiday", "Adventure", "Passage", "Quest", "Epic Journey", "Journey"]
		actions = ["Counter", "Quantifier", "Check", "Engine", "Turbine", "Checker", "Explorer", "Inquirer", "Detective", "Investigator"]
		@project_name = nouns.sample + " " + actions.sample
		@locations = Location.all.order("name ASC")
	end
end