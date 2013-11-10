require 'test_helper'

class JourneysControllerTest < ActionController::TestCase
   test "Fixtures should generate some test journeys" do
     @journey = Journey.all
     assert @journey.nil? == false, "There are no journeys in the test database (see your fixtures)."
   end

   	test "Journey attributes can't be null" do
   		@journey = Journey.new
   		assert !@journey.save, "Journey with null attributes was able to be saved."
   	end

   	test "should create journey" do
	  assert_difference('Journey.count') do
	    j=Journey.create!(:origin=>'A Place',:destination=>'Another Place',:date=>'211113')
	  end
	 
	  assert journey_path(j)
	end
end
