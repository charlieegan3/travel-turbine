class AdminsController < Devise::RegistrationsController#ApplicationController
# require 'devise' ?

	before_action :authenticate_admin!    # before_action === before_filter   (latter is not yet deprecated)


	# Note: Devise handles most stuff like new users and signing in.
	
	def add_admin
		#render devise form...

		@admin = Admin.new
		@admin.email = params[:email]
		@admin.password = params[:password]
		#'devise/registrations#new'
	end

	def save_admin
		# taken from:  https://github.com/plataformatec/devise/blob/master/app/controllers/devise/registrations_controller.rb#L19
    	build_resource(sign_up_params)

    	if resource.save
    	  	if resource.active_for_authentication?
		        set_flash_message :notice, :signed_up if is_flashing_format?
        		respond_with resource, :location => root_path  # Do NOT sign in after registration (already signed in as admin)
      		else
	        	set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        		expire_data_after_sign_in!
        		respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      		end
    		else
      			clean_up_passwords resource
      			respond_with resource
    	end
	end
	

	def new
		@admin = Admin.new
	end

end
