# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# LOCATIONS

Location.create(:id => 1, :name => "Aberdeen", :bus => "1", :station => "ABD", :airport => "ABZ")
Location.create(:id => 2, :name => "Birmingham", :bus => "8", :station => "Birmingham", :airport => "BHX")
Location.create(:id => 3, :name => "Bournemouth", :bus => "11", :station => "BMH", :airport => "BOH")
Location.create(:id => 4, :name => "Bristol", :bus => "13", :station => "Bristol", :airport => "BRS")
Location.create(:id => 5, :name => "Cambridge", :bus => "17", :station => "CBG", :airport => "CBG")
Location.create(:id => 6, :name => "Cardiff", :bus => "20", :station => "Cardiff", :airport => "CWL")
Location.create(:id => 7, :name => "Carlisle", :bus => "21", :station => "CAR", :airport => "CAX")
Location.create(:id => 8, :name => "Coventry", :bus => "27", :station => "COV", :airport => "CVT")
Location.create(:id => 9, :name => "Dundee", :bus => "32", :station => "DEE", :airport => "DND")
Location.create(:id => 10, :name => "Edinburgh", :bus => "34", :station => "EDB", :airport => "EDI")
Location.create(:id => 11, :name => "Exeter", :bus => "36", :station => "Exeter", :airport => "EXT")
Location.create(:id => 12, :name => "Glasgow", :bus => "38", :station => "Glasgow", :airport => "GLA")
Location.create(:id => 13, :name => "Inverness", :bus => "49", :station => "INV", :airport => "INV")
Location.create(:id => 14, :name => "Leeds", :bus => "52", :station => "LDS", :airport => "LBA")
Location.create(:id => 15, :name => "Liverpool", :bus => "54", :station => "Liverpool", :airport => "LPL")
Location.create(:id => 16, :name => "London", :bus => "56", :station => "London", :airport => "LON")
Location.create(:id => 17, :name => "Manchester", :bus => "58", :station => "MAN", :airport => "MAN")
Location.create(:id => 18, :name => "Newcastle", :bus => "63", :station => "NCL", :airport => "NCL")
Location.create(:id => 19, :name => "Newquay", :bus => "65", :station => "NQY", :airport => "NQY")
Location.create(:id => 20, :name => "Norwich", :bus => "66", :station => "NRW", :airport => "NWI")
Location.create(:id => 21, :name => "Oban", :bus => "69", :station => "OBN", :airport => "OBN")
Location.create(:id => 22, :name => "Penzance", :bus => "74", :station => "PNZ", :airport => "PZE")
Location.create(:id => 23, :name => "Perth", :bus => "75", :station => "PTH", :airport => "PSL")
Location.create(:id => 24, :name => "Southampton", :bus => "93", :station => "Southampton", :airport => "SOU")
Location.create(:id => 25, :name => "Swansea", :bus => "97", :station => "SWA", :airport => "SWS")
Location.create(:id => 26, :name => "Blackpool", :bus => "115", :station => "Blackpool", :airport => "BLK")
Location.create(:id => 27, :name => "Chester", :bus => "130", :station => "CTR", :airport => "CEG")

# USERS/ADMINS
User.create(:id => 1, :email => "reguser@hello.com", :encrypted_password => "$2a$10$M52EpykdvxQbqSwhfAvEc.CJOeqQL84EGfAXH0EIkOkLDsZUq6MUG", :sign_in_count => 5, :current_sign_in_at => Sun, 10 Nov 2013 13:48:48 UTC +00:00, :last_sign_in_at => Sun, 10 Nov 2013 13:36:53 UTC +00:00, :current_sign_in_ip => "127.0.0.1", :last_sign_in_ip => "127.0.0.1")
Admin.create(:id => 1, :email => "da_admin@traveller.com", :encrypted_password => "$2a$10$KlfmoTFdFS9Y8Vr7hZuKOe8mFw4Azk.C7RG28.AXdeBu5wAZWrNMa", :sign_in_count => 14, :current_sign_in_at => Sun, 10 Nov 2013 14:03:54 UTC +00:00, :last_sign_in_at => Sun, 10 Nov 2013 14:02:59 UTC +00:00, :current_sign_in_ip => "127.0.0.1", :last_sign_in_ip => "127.0.0.1")

# JOURNEYS
Journey.create(:id => 1, :origin => "London", :destination => "Cambridge", :train_result => [[["19.90", 70], ["22.00", 81], ["22.00", 48], ["19.90", 83], ["22.00", 46]], [0.87, 4], "http://ojp.nationalrail.co.uk/service/timesandfares/London/CBG/141113/0900/dep"], :bus_result => [[], nil, "https://uk.megabus.com/JourneyResults.aspx?originCode=56&destinationCode=17&outboundDepartureDate=14%2f11%2f2013&passengerCount=1&transportType=-1"], :plane_result => [[], nil, "http://www.tripsta.co.uk/airline-tickets/results?dep=LON&arr=CBG&passengersAdult=1&passengersChild=0&passengersInfant=0&class=&airlineCode=&directFlightsOnly=0&extendedDates=0&isRoundtrip=0&obDate=14%2f11%2f2013&obTime=&ibDate=&ibTime="], :best_result => [["22.00", 46], "train"], :date => "141113", :owner => 1)
Journey.create(:id => 2, :origin => "Cambridge", :destination => "Swansea", :train_result => [[["47.20", 314], ["28.30", 293], ["33.30", 319], ["28.30", 293], ["47.20", 318]], [0.86, 1], "http://ojp.nationalrail.co.uk/service/timesandfares/CBG/SWA/141113/0900/dep"], :bus_result => [[], nil, "https://uk.megabus.com/JourneyResults.aspx?originCode=17&destinationCode=97&outboundDepartureDate=14%2f11%2f2013&passengerCount=1&transportType=-1"], :plane_result => [[], nil, "http://www.tripsta.co.uk/airline-tickets/results?dep=CBG&arr=SWS&passengersAdult=1&passengersChild=0&passengersInfant=0&class=&airlineCode=&directFlightsOnly=0&extendedDates=0&isRoundtrip=0&obDate=14%2f11%2f2013&obTime=&ibDate=&ibTime="], :best_result => [["28.30", 293], "train"], :date => "141113", :owner => 1)
Journey.create(:id => 3, :origin => "Swansea", :destination => "Cardiff", :train_result => [[["9.90", 51], ["8.20", 64], ["8.20", 54], ["8.20", 68], ["8.20", 53]], [0.937, 4], "http://ojp.nationalrail.co.uk/service/timesandfares/SWA/Cardiff/221113/0900/dep"], :bus_result => [[["3.50", 60], ["5.00", 65], ["5.00", 65]], [0.863, 0], "https://uk.megabus.com/JourneyResults.aspx?originCode=97&destinationCode=20&outboundDepartureDate=22%2f11%2f2013&passengerCount=1&transportType=-1"], :plane_result => [[], nil, "http://www.tripsta.co.uk/airline-tickets/results?dep=SWS&arr=CWL&passengersAdult=1&passengersChild=0&passengersInfant=0&class=&airlineCode=&directFlightsOnly=0&extendedDates=0&isRoundtrip=0&obDate=22%2f11%2f2013&obTime=&ibDate=&ibTime="], :best_result => [["3.50", 60], "bus"], :date => "221113", :owner => 1)
Journey.create(:id => 4, :origin => "Exeter", :destination => "Inverness", :train_result => [[["234.50", 643], ["234.50", 698], ["220.80", 638], ["220.80", 707], ["220.80", 647]], [0.966, 2], "http://ojp.nationalrail.co.uk/service/timesandfares/Exeter/INV/201113/0900/dep"], :bus_result => [[], nil, "https://uk.megabus.com/JourneyResults.aspx?originCode=36&destinationCode=49&outboundDepartureDate=20%2f11%2f2013&passengerCount=1&transportType=-1"], :plane_result => [[["143.88", 1110], ["149.30", 1110], ["150.14", 190], ["151.35", 385], ["159.41", 425], ["160.14", 200], ["160.29", 940], ["162.85", 1565], ["168.20", 1175], ["183.80", 1685]], [0.58, 2], "http://www.tripsta.co.uk/airline-tickets/results?dep=EXT&arr=INV&passengersAdult=1&passengersChild=0&passengersInfant=0&class=&airlineCode=&directFlightsOnly=0&extendedDates=0&isRoundtrip=0&obDate=20%2f11%2f2013&obTime=&ibDate=&ibTime="], :best_result => [["150.14", 190], "plane"], :date => "201113", :owner => 1)
Journey.create(:id => 5, :origin => "Aberdeen", :destination => "London", :train_result => [[["146.50", 456], ["45.50", 419], ["146.50", 458], ["77.50", 464], ["84.50", 463]], [0.691, 1], "http://ojp.nationalrail.co.uk/service/timesandfares/ABD/London/201113/0900/dep"], :bus_result => [[["13.00", 770], ["13.00", 775], ["13.00", 745], ["13.00", 690]], [0.963, 3], "https://uk.megabus.com/JourneyResults.aspx?originCode=1&destinationCode=56&outboundDepartureDate=20%2f11%2f2013&passengerCount=1&transportType=-1"], :plane_result => [[["54.99", 100], ["61.99", 100], ["88.72", 90], ["91.22", 100], ["91.99", 85], ["102.91", 100], ["112.30", 100], ["116.26", 100], ["123.77", 100], ["123.99", 100]], [0.797, 0], "http://www.tripsta.co.uk/airline-tickets/results?dep=ABZ&arr=LON&passengersAdult=1&passengersChild=0&passengersInfant=0&class=&airlineCode=&directFlightsOnly=0&extendedDates=0&isRoundtrip=0&obDate=20%2f11%2f2013&obTime=&ibDate=&ibTime="], :best_result => [["54.99", 100], "plane"], :date => "201113", :owner => 1)
Journey.create(:id => 6, :origin => "Aberdeen", :destination => "Liverpool", :train_result => [[["103.00", 415], ["103.00", 398], ["103.00", 412], ["103.00", 418], ["103.00", 384]], [0.974, 4], "http://ojp.nationalrail.co.uk/service/timesandfares/ABD/Liverpool/201113/0900/dep"], :bus_result => [[], nil, "https://uk.megabus.com/JourneyResults.aspx?originCode=1&destinationCode=54&outboundDepartureDate=20%2f11%2f2013&passengerCount=1&transportType=-1"], :plane_result => [[["105.46", 770], ["149.52", 1500], ["154.53", 620], ["165.38", 770], ["170.16", 1500], ["185.58", 770], ["194.59", 640], ["195.20", 1585], ["200.20", 1730], ["201.31", 1265]], [0.652, 0], "http://www.tripsta.co.uk/airline-tickets/results?dep=ABZ&arr=LPL&passengersAdult=1&passengersChild=0&passengersInfant=0&class=&airlineCode=&directFlightsOnly=0&extendedDates=0&isRoundtrip=0&obDate=20%2f11%2f2013&obTime=&ibDate=&ibTime="], :best_result => [["103.00", 384], "train"], :date => "201113", :owner => 1)
Journey.create(:id => 7, :origin => "Aberdeen", :destination => "Leeds", :train_result => [[["135.90", 357], ["135.90", 361], ["39.50", 357], ["135.90", 360], ["135.90", 362]], [0.666, 2], "http://ojp.nationalrail.co.uk/service/timesandfares/ABD/LDS/211113/0900/dep"], :bus_result => [[["24.00", 505]], [1.0, 0], "https://uk.megabus.com/JourneyResults.aspx?originCode=1&destinationCode=52&outboundDepartureDate=21%2f11%2f2013&passengerCount=1&transportType=-1"], :plane_result => [[["123.36", 495], ["147.56", 445], ["151.48", 1255], ["153.40", 450], ["153.98", 315], ["154.41", 345], ["156.93", 455], ["160.92", 515], ["168.17", 1315], ["168.17", 460]], [0.761, 4], "http://www.tripsta.co.uk/airline-tickets/results?dep=ABZ&arr=LBA&passengersAdult=1&passengersChild=0&passengersInfant=0&class=&airlineCode=&directFlightsOnly=0&extendedDates=0&isRoundtrip=0&obDate=21%2f11%2f2013&obTime=&ibDate=&ibTime="], :best_result => [["39.50", 357], "train"], :date => "211113", :owner => 1)


