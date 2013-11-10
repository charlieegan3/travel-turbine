class StaticController < ApplicationController
	def index
		actions = ["Search", "Find", "Check", "Hunt", "Compare", "Look", "Sift", "Seek", "Scan", "Scour", "Frisk", "Forage", "Pry", "Rake", "Prospect", "Scuntinize", "Rummage", "Detect", "Spot", "Uncover", "Unearth", "Pinpoint", "Browse", "Skim", "Sweep", "Study", "Go!", "Depart", "Travel", "Cruise" ]
		@search_verb = actions.sample
		@locations = Location.all.order("name ASC")
	end
end