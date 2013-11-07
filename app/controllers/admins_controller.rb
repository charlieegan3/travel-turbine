class AdminsController < ApplicationController #Devise::RegistrationsController
#was class AdminsController < ApplicationController
# Require 'Devise' for Devises' methods???

#	before_action :authenticate_admin!    # before_action === before_filter   (latter is not yet deprecated)


	# Note:  It seems Devise handles controller stuff too, so for the moment we don't need to put anything here.

	# Additional methods should work, but stuff like new users and signing in is already handled by devise
#	def add_admin
#		@admin = Admin.new
#		@admin.email = params[:email]
#		@admin.password = params[:password]
#		#'devise/registrations#new'
#	end
#
#	def save_admin
#		# TAKE ABOVE DATA AND CALL THE DEVISE METHODS FOR PASSWORD HASHING, USER CREATION, ETC....
#		@admin = Admin.new(params[:admin])
#		@admin.save
#	end
#
#	def new
#		@admin = Admin.new
#	end
#
#end
