class UsersController < ApplicationController
	before_action :authenticate_user!    # before_action === before_filter   (latter is not yet deprecated)


	# Note:  It seems Devise handles controller stuff too, so for the moment we don't need to put anything here.

	# Additional methods should work, but stuff like new users and signing in is already handled by devise.

	def journeys
		@journeys = Journey.where('owner = ?', current_user.id).order("created_at DESC")

	end
end
