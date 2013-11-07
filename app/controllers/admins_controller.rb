class AdminsController < ApplicationController #Devise::RegistrationsController
# require 'devise' ?

	before_action :authenticate_admin!    # before_action === before_filter   (latter is not yet deprecated)


	# Note: Devise handles most stuff like new users and signing in.
	
	def add_admin
		#render devise form...

	# Old:
		#@admin = Admin.new
		#@admin.email = params[:email]
		#@admin.password = params[:password]
		#'devise/registrations#new'
	end

	def save_admin
		# TAKE ABOVE DATA AND CALL THE DEVISE METHODS FOR PASSWORD HASHING, USER CREATION, ETC....?
		@admin = Admin.new(params[:admin])
		respond_to do |format|
      		if @admin.save
        		format.html { redirect_to root_path, :notice => 'Admin was successfully created.' }
      		else
        		format.html { render :action => "new" }
      		end
    	end
	end

	def new
		@admin = Admin.new
	end

end
