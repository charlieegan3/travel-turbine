#!/usr/bin/env ruby
#+--------------------------+
#|  This is to test out the |
#|  fetch methods.          |
#+--------------------------+
RAILS_ENV = 'development'
require File.expand_path('../environment', __FILE__)
require 'net/http'
require 'open-uri'


# Months with 31	- January - March - May - July - August - October - December
# Months with 30	- April - June - September - November
# Month with 28*	- February

#make a request to national rail like: train("INV", "ABD", "211113")
def test
	locations = ["Aberdeen", "Birmingham", "Bournemouth", "Bristol", "Cambridge", "Cardiff", "Carlisle", "Coventry", "Dundee", "Edinburgh", "Exeter", "Glasgow", "Inverness", "Leeds", "Liverpool", "London", "Manchester", "Newcastle", "Newquay", "Norwich", "Oban", "Penzance", "Perth", "Southampton", "Swansea", "Blackpool", "Chester"]
	orig = locations.sample	
	locations = locations - [orig]
	dest = locations.sample
	months = *(11..12)
	month = months.sample
	case month 				#  NOTE:  currently have to set months and days ranges manually (try using Time.now date to do it dynamically)
		when 31
			days = *(13..31)    # Must be a way to do this on one line...  *(0..31).sample doesn't work.
			day = days.sample
		when 30
			days = *(13..30)
			day = days.sample
		else
			days = *(13..28)
			day = days.sample
	end
	date = "#{day}#{month}13"

	l1 = locations.sample
	l2 = locations.sample
	time = Time.now
	begin
		xml = Nokogiri::HTML(open("http://travel-turbine.herokuapp.com/journey/new?origin=#{l1}&destination=#{l2}&date=#{date}").read)
	rescue # if there is an error, don't stop whole program.
		puts "ERROR WITH REQUEST: new?origin=#{l1}&destination=#{l2}&date=#{date}"
		return nil
	end
	time_dif = Time.now - time
	puts "thread1: " + l1.to_s + " to " + l2.to_s + " on " + date + " - " + time_dif.to_s
end
def test2
	locations2 = ["Aberdeen", "Birmingham", "Bournemouth", "Bristol", "Cambridge", "Cardiff", "Carlisle", "Coventry", "Dundee", "Edinburgh", "Exeter", "Glasgow", "Inverness", "Leeds", "Liverpool", "London", "Manchester", "Newcastle", "Newquay", "Norwich", "Oban", "Penzance", "Perth", "Southampton", "Swansea", "Blackpool", "Chester"]
	orig2 = locations2.sample	
	locations2 = locations2 - [orig]
	dest2 = locations2.sample
	months2 = *(11..12)
	month2 = months2.sample
	case month2 				#  NOTE:  currently have to set months and days ranges manually (try using Time.now date to do it dynamically)
		when 31
			days2 = *(13..31)    # Must be a way to do this on one line...  *(0..31).sample doesn't work.
			day2 = days2.sample
		when 30
			days2 = *(13..30)
			day2 = days2.sample
		else
			days2 = *(13..28)
			day2 = days2.sample
	end
	date2 = "#{day2}#{month2}13"

	l12 = locations2.sample
	l22 = locations2.sample
	time2 = Time.now
	xml2 = Nokogiri::HTML(open("http://travel-turbine.herokuapp.com/journey/new?origin=#{l12}&destination=#{l22}&date=#{date2}").read)
	time_dif2 = Time.now - time2
	puts "thread2: " +  l12.to_s + " to " + l22.to_s + " on " + date2 +" - " +time_dif2.to_s
end


def stress_test
	50.times do
		puts "---------------------"
		t1=Thread.new{test()}
		t2=Thread.new{test2()}
		t1.join
		t2.join
		sleep(5)  # Wait 5 seconds - Note, server still dies a lot. Might be b/c of the threads.
	end
end

def single_thread(no, rest)  # rest in seconds
	puts ""
	puts "-> Doing a single_thread test with #{no} requests"
	no.times do |n|
		puts "-------#{n+1}---------"
		test()
		sleep(rest)
	end
end
single_thread(50, 5) # 50 requests, 5 second interval