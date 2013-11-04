class UsersController < ApplicationController
	before_action :authenticate_user!    # before_action === before_filter   (latter is not yet deprecated)

	def new

	end


	def create
	
	end


end
