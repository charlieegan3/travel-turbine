class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	#make a request to national rail like: train("INV", "ABD", "211113")
	def train(origin, destination, date)
		xml = Nokogiri::HTML(open("http://ojp.nationalrail.co.uk/service/timesandfares/#{origin}/#{destination}/#{date}/0900/dep").read)
		#get prices
		price_string = xml.css('.opsingle').inner_html
		price_string.gsub!(/\s+/, "")
		prices = price_string.scan(/£\d*.\d*/)
		
		#get durations
		duration_string = xml.css('.dur').inner_html
		duration_string.gsub!(/\s+/, "")
		duration_string.gsub!(/<abbrtitle="hours">h<\/abbr>/, ":")
		duration_string.gsub!(/<abbrtitle="minutes">m<\/abbr>/, ",")
		duration_string.gsub!(/^.*>/, "")
		duration_string = duration_string.split(',')
		durations = Array.new
		duration_string.each do |d|
			hours = d[0, d.index(':')]
			mins = d[d.index(':')+1, d.length]
			if mins[0,1] == "0"
				mins = mins[1,1]
			end
			durations.push(Integer(hours)*60 + Integer(mins))
		end
		results  = Array.new
			prices.count().times do |count|
			  	pair = [prices[count], durations[count]]
				results.push(pair)
			end
		return results
	end
	
	#make a request to megabus like: bus("49", "56", "211113")
	def bus(origin, destination, date)
		param_date = date[0,2] + "%2f" + date[2,2] + "%2f20" + date[4,2] #megabus uses odd date formats
		xml = Nokogiri::HTML(open("https://uk.megabus.com/JourneyResults.aspx?originCode=#{origin}&destinationCode=#{destination}&outboundDepartureDate=#{param_date}&passengerCount=1&transportType=-1").read)
		#get prices
		price_string = xml.css('ul.standard>li.five>p').to_s
		price_string.gsub!(/\s+/, "")
		price_string.gsub!(/[<p>\/]/, '')
		prices = price_string.split('£')
		prices.delete_at(0)
		#get durations
		dur_string = xml.css('ul.standard>li.three>p').to_s
		dur_string.gsub!(/\s+/, "")
		dur_string.gsub!(/></, ',')
		dur_string.gsub!(/[<p>\/]/, '')
		dur_string.gsub!('hrs', ':')
		dur_string.gsub!('mins', '')
		duration_string = dur_string.split(',')
		durations = Array.new
		duration_string.each do |d|
			hours = d[0, d.index(':')]
			mins = d[d.index(':')+1, d.length]
			if mins[0,1] == "0"
				mins = mins[1,1]
			end
			durations.push(Integer(hours)*60 + Integer(mins))
		end
		#prepare results
		results  = Array.new
		prices.count().times do |count|
		  	pair = [prices[count], durations[count]]
			results.push(pair)
		end
		return results
	end
	
	#make a request to tripsta like: plane("INV", "LON", "211113")
	def plane(origin, destination, date)
		param_date = date[0,2] + "%2f" + date[2,2] + "%2f20" + date[4,2]
		xml= Nokogiri::HTML(open("http://www.tripsta.co.uk/airline-tickets/results?dep=#{origin}&arr=#{destination}&passengersAdult=1&passengersChild=0&passengersInfant=0&class=&airlineCode=&directFlightsOnly=0&extendedDates=0&isRoundtrip=0&obDate=#{param_date}&obTime=&ibDate=&ibTime=").read)
	
		#get prices
		price_string = xml.css("span.amount").to_s
		price_string.gsub!(/\s+/, "")
		price_string.gsub!(/[<\/spancl=""moutright>]/, "") #I'm sure there's a better way but...
		prices = price_string.split('£')
		prices.delete_at(0)
		
		#get durations
		duration_string = xml.css('td.duration>span:first-child').inner_html
		duration_string.gsub!(/\s+/, "")
		duration_string = duration_string.scan(/\d*h\d*min/)
		durations = Array.new
		duration_string.each do |d|
			dur = d.gsub('h', ':')
			dur = dur.gsub!('min', '')
			hours = dur[0, dur.index(':')]
			mins = dur[dur.index(':')+1, dur.length]
			if mins[0,1] == "0"
				mins = mins[1,1]
			end
			durations.push(Integer(hours)*60 + Integer(mins))
		end
	
		#prepare results
		results  = Array.new
		prices.count().times do |count|
		  	pair = [prices[count], durations[count]]
			results.push(pair)
		end
		return results
	end

	def best_journey()
		#code here to pick the best options and return the three best results
		
		#can use other methods in the meantime e.g. from views and contollers
		#puts train("INV", "ABD", "211113").to_s
		#puts bus("49", "56", "211113").to_s
		#puts plane("INV", "LON", "211113").to_s
	end
end
