require 'concerns/googledirections.rb'

class JourneysController < ApplicationController

	def new
		orig = Location.find_by_name(params[:origin]) #all loc's have uniq names
		dest = Location.find_by_name(params[:destination])
		date = params[:date]

		#set a user variable
		if current_user.nil?
			user = 1 #the id of the guest user
		else
			user = current_user.id
		end

		#sort out stuff to do with getting a valid date
		year = Integer("20" + date[4,2])
		mon = date[2,2]
		day = date[0,2]
		#fix cases like 02 = 2nd
		if mon[0] == "0"
			mon = mon[1,1]
		end
		if day[0] == "0"
			day = day[1,1]
		end
		mon = Integer(mon)
		day = Integer(day)

		#if date is beyond help then just set it to a weeks time
		begin
		    @date = DateTime.new(year, mon, day).to_date
		rescue
		    @date = "Not valid"
		end

		if (@date != "Not valid")
			logger.info "getting data"
			old_journey = Journey.where("origin = ? AND destination = ? AND date = ? AND created_at > ? AND old_data IS NULL", params[:origin], params[:destination], date, Time.now-1.days).first()
			#still need to set the user in here!
			
			if old_journey.nil?
				@data = best_journey(orig,dest,date)
				@journey = Journey.new
				@journey.origin = params[:origin]
				@journey.destination = params[:destination]
				@journey.date = params[:date]
				@journey.train_result = @data[1][0]
				@journey.bus_result = @data[1][1]
				@journey.plane_result = @data[1][2]
				@journey.best_result = @data[0]
				@journey.owner = user
				@journey.save
			else
				@journey = old_journey.dup
				@journey.old_data = old_journey.created_at
				@journey.owner = user
				@journey.save
				@data = "Data Already Available"
			end
			logger.info @data
		if (@data != "None of Any")
			#vars for the view
			if @journey.train_result.nil? == false
			if @journey.train_result[1].nil? == false
				@train_list = @journey.train_result[0]
				@train_best = @journey.train_result[1][1]
				@train_link = @journey.train_result[2]
			end
			else
				@train_list = "None"
				@train_best = "None"
				@train_link = "www.nationalrail.com"
			end
	
			if @journey.bus_result.nil? == false
			if @journey.bus_result[1].nil? == false
				@bus_list = @journey.bus_result[0]
				@bus_best = @journey.bus_result[1][1]
				@bus_link = @journey.bus_result[2]
			end
			else
				@bus_list = "None"
				@bus_best = "None"
				@bus_link = "www.megabus.com"
			end
	
			if @journey.plane_result.nil? == false
			if @journey.plane_result[1].nil? == false
				@plane_list = @journey.plane_result[0]
				@plane_best = @journey.plane_result[1][1]
				@plane_link = @journey.plane_result[2]
			end
			else
				@plane_list = "None"
				@plane_best = "None"
				@plane_link = "www.tripsta.com"
			end
	
			case @journey.best_result[1]
			when "plane"
			  @best_link = @plane_link
			when "bus"
			  @best_link = @bus_link
			when "train"
			  @best_link = @train_link
			else
			  @best_link = "http://www.error.com"
			end
		end
		end

		@car_miles = directions = GoogleDirections.new(params[:origin], params[:destination]).distance_in_miles
		@car_mins = directions = GoogleDirections.new(params[:origin], params[:destination]).drive_time_in_minutes
		@car_link = "https://www.google.co.uk/maps/preview?saddr=#{params[:origin]}&daddr=#{params[:destination]}"
		@car_cost = (((@car_miles*1.609)/100)*5*1.3070*1.3).round(3) #1.3 = for driver ineficency
		@car_cost = @car_cost.to_s[0,@car_cost.to_s.index('.')+3] #have no idea why .round() isn't behaving!
		#http://en.wikipedia.org/wiki/Fuel_economy_in_automobiles#Fuel_economy_standards_and_testing_procedures
	end

	def show
		@journey = Journey.find(params[:id])
		#vars for the view
		year = Integer("20" + @journey.date[4,2])
		mon = @journey.date[2,2]
		day = @journey.date[0,2]
		if mon[0] == "0"
			mon = mon[1,1]
		end
		if day[0] == "0"
			day = day[1,1]
		end
		mon = Integer(mon)
		day = Integer(day)
		
		@date = DateTime.new(year, mon, day).to_date

		if @journey.train_result.nil? == false
		if @journey.train_result[1].nil? == false
			@train_list = @journey.train_result[0]
			@train_best = @journey.train_result[1][1]
			@train_link = @journey.train_result[2]
		end
		else
			@train_list = "None"
			@train_best = "None"
			@train_link = "www.nationalrail.com"
		end

		if @journey.bus_result.nil? == false
		if @journey.bus_result[1].nil? == false
			@bus_list = @journey.bus_result[0]
			@bus_best = @journey.bus_result[1][1]
			@bus_link = @journey.bus_result[2]
		end
		else
			@bus_list = "None"
			@bus_best = "None"
			@bus_link = "www.megabus.com"
		end

		if @journey.plane_result.nil? == false
		if @journey.plane_result[1].nil? == false
			@plane_list = @journey.plane_result[0]
			@plane_best = @journey.plane_result[1][1]
			@plane_link = @journey.plane_result[2]
		end
		else
			@plane_list = "None"
			@plane_best = "None"
			@plane_link = "www.tripsta.com"
		end

		case @journey.best_result[1]
		when "plane"
		  @best_link = @plane_link
		when "bus"
		  @best_link = @bus_link
		when "train"
		  @best_link = @train_link
		else
		  @best_link = "http://www.error.com"
		end

		@car_miles = directions = GoogleDirections.new(@journey.origin, @journey.destination).distance_in_miles
		@car_mins = directions = GoogleDirections.new(@journey.origin, @journey.destination).drive_time_in_minutes
		@car_link = "https://www.google.co.uk/maps/preview?saddr=#{@journey.origin}&daddr=#{@journey.destination}"
		@car_cost = (((@car_miles*1.609)/100)*5*1.3070*1.3).round(3) #1.3 = for driver ineficency
		@car_cost = @car_cost.to_s[0,@car_cost.to_s.index('.')+3] #have no idea why .round() isn't behaving!
		#http://en.wikipedia.org/wiki/Fuel_economy_in_automobiles#Fuel_economy_standards_and_testing_procedures

	end

	def destroy
		@journey = Journey.find(params[:id])
		if @journey.owner == current_user.id
			@journey.hidden = true #means can still access as cached data to speed up searches of other users
			@journey.save
		elsif admin_session?
			@journey.destroy
		else
			flash[:alert] = "You must have admin rights to delete journeys."
		end
		respond_to do |format|
      		format.html { redirect_to '/journeys' }
    	end
	end

end
