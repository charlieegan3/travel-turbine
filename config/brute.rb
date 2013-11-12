#!/usr/bin/env ruby
#+--------------------------+
#|  This is to test out the |
#|  fetch methods.          |
#+--------------------------+
RAILS_ENV = 'development'
require File.expand_path('../environment', __FILE__)
require 'net/http'
require 'open-uri'


#make a request to national rail like: train("INV", "ABD", "211113")
def test
	locations = ["Aberdeen", "Birmingham", "Bournemouth", "Bristol", "Cambridge", "Cardiff", "Carlisle", "Coventry", "Dundee", "Edinburgh", "Exeter", "Glasgow", "Inverness", "Leeds", "Liverpool", "London", "Manchester", "Newcastle", "Newquay", "Norwich", "Oban", "Penzance", "Perth", "Southampton", "Swansea", "Blackpool", "Chester"]
	l1 = locations.sample
	l2 = locations.sample
	time = Time.now
	xml = Nokogiri::HTML(open("http://travel-turbine.herokuapp.com/journey/new?origin=#{l1}&destination=#{l2}&date=271113").read)
	time_dif = Time.now - time
	puts "thread1: " + l1.to_s + " to " + l2.to_s + " - " +time_dif.to_s
end
def test2
	locations2 = ["Aberdeen", "Birmingham", "Bournemouth", "Bristol", "Cambridge", "Cardiff", "Carlisle", "Coventry", "Dundee", "Edinburgh", "Exeter", "Glasgow", "Inverness", "Leeds", "Liverpool", "London", "Manchester", "Newcastle", "Newquay", "Norwich", "Oban", "Penzance", "Perth", "Southampton", "Swansea", "Blackpool", "Chester"]
	l12 = locations2.sample
	l22 = locations2.sample
	time2 = Time.now
	xml2 = Nokogiri::HTML(open("http://travel-turbine.herokuapp.com/journey/new?origin=#{l12}&destination=#{l22}&date=271113").read)
	time_dif2 = Time.now - time2
	puts "thread2: " +  l12.to_s + " to " + l22.to_s + " - " +time_dif2.to_s
end

50.times do
	t1=Thread.new{test()}
	t2=Thread.new{test2()}
	t1.join
	t2.join
end

