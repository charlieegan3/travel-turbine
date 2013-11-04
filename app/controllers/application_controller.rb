class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  require 'open-uri'

#make a request to national rail like: train("INV", "ABD", "211113")
def train(origin, destination, date)
	url = "http://ojp.nationalrail.co.uk/service/timesandfares/#{origin}/#{destination}/#{date}/0900/dep"
	xml = Nokogiri::HTML(open(url).read)
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
		  	pair = [prices[count][1,prices[count].length], durations[count]] #rather messy way of taking out the £ at the last minute!
			results.push(pair)
		end
	return results, url
end

#make a request to megabus like: bus("49", "56", "211113")
def bus(origin, destination, date)
	param_date = date[0,2] + "%2f" + date[2,2] + "%2f20" + date[4,2] #megabus uses odd date formats
	url = "https://uk.megabus.com/JourneyResults.aspx?originCode=#{origin}&destinationCode=#{destination}&outboundDepartureDate=#{param_date}&passengerCount=1&transportType=-1"
	xml = Nokogiri::HTML(open(url).read)
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
	return results, url
end

#make a request to tripsta like: plane("INV", "LON", "211113")
def plane(origin, destination, date)
	param_date = date[0,2] + "%2f" + date[2,2] + "%2f20" + date[4,2]
	url = "http://www.tripsta.co.uk/airline-tickets/results?dep=#{origin}&arr=#{destination}&passengersAdult=1&passengersChild=0&passengersInfant=0&class=&airlineCode=&directFlightsOnly=0&extendedDates=0&isRoundtrip=0&obDate=#{param_date}&obTime=&ibDate=&ibTime="
	xml= Nokogiri::HTML(open(url).read)

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
	return results, url
end

def best_journey(origin, destination, date)
	#train_results = train(origin.station, destination.station, date)
	#bus_results = bus(origin.bus, destination.bus, date)
	#plane_results = plane(origin.airport, destination.airport, date)
	
	train_results = [[["146.50", 456], ["45.50", 419], ["146.50", 458], ["142.00", 464], ["142.00", 463]], "http://ojp.nationalrail.co.uk/service/timesandfares/ABD/London/211113/0900/dep"]
	bus_results = [[["13.00", 770], ["13.00", 775], ["13.00", 745], ["13.00", 690]], "https://uk.megabus.com/JourneyResults.aspx?originCode=1&destinationCode=56&outboundDepartureDate=21%2f11%2f2013&passengerCount=1&transportType=-1"]
	plane_results = [[["55.62", 100], ["59.99", 100], ["64.99", 100], ["70.99", 80], ["73.05", 100], ["85.99", 90], ["88.29", 100], ["88.29", 100], ["99.99", 85], ["100.14", 95]], "http://www.tripsta.co.uk/airline-tickets/results?dep=ABZ&arr=LON&passengersAdult=1&passengersChild=0&passengersInfant=0&class=&airlineCode=&directFlightsOnly=0&extendedDates=0&isRoundtrip=0&obDate=21%2f11%2f2013&obTime=&ibDate=&ibTime="]
	
	all_journeys = Array.new
	train_results[0].each do |r|
		all_journeys.push([r, "train"])
	end
	bus_results[0].each do |r|
		all_journeys.push([r, "bus"])
	end
	plane_results[0].each do |r|
		all_journeys.push([r, "plane"])
	end

	all_results = Array.new
	all_journeys.each do |r|
		all_results.push(r[0])
	end

	return all_journeys[best_result(all_results)[1]], [[train_results[0], best_result(train_results[0]), train_results[1]], [bus_results[0], best_result(bus_results[0]), bus_results[1]],[plane_results[0], best_result(plane_results[0]), plane_results[1]]]

end

def best_result(results)
	prices = Array.new
	durations = Array.new
	
	results.each do |r|
		prices.push(r[0].to_f)
		durations.push(r[1])
	end
		
	
	#variables for test
	prices_mean = DescriptiveStatistics::Stats.new(prices).mean
	durations_mean = DescriptiveStatistics::Stats.new(durations).mean
	
	#adjust to scores
	prices.count().times do |count|
		prices[count] = (prices[count]/prices_mean)
	end
	durations.count().times do |count|
		durations[count] = (durations[count]/durations_mean)
	end
	
	#calc avg scores
	scores = Array.new
	prices.count().times do |count|
		scores.push(DescriptiveStatistics::Stats.new([prices[count],durations[count]]).mean.round(3))
	end
	return scores.each_with_index.min
end

  
end