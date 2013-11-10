require 'test_helper'

class JourneysControllerTest < ActionController::TestCase
   test "TEST NOT NIL" do
   	puts "i am a test"
     @journey = Journey.all
     assert @journey.nil? == false
   end

   test "journeys with aberdeen" do
   	puts "There are journeys with origin = aberdeen in the DB"
   	assert Journey.find_by_origin("Aberdeen").nil? == false
   	end

end
