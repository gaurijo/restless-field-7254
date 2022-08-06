# User Story 3, Airline's Passengers

# As a visitor
# When I visit an airline's show page
# Then I see a list of passengers that have flights on that airline
# And I see that this list is unique (no duplicate passengers)
# And I see that this list only includes adult passengers

# (Note: an adult is anyone with age greater than or equal to 18)

require 'rails_helper'
RSpec.describe "airlines show page" do 
   it "has a list of adult (18+) passengers (unique values) that have flights on that airline" do 
      united = Airline.create!(name: "United")
      flight_1 = united.flights.create!(number: "458", date: 8/12/2022, departure_city: "San Francisco",
                              arrival_city: "Austin")
      flight_2 = united.flights.create!(number: "448", date: 8/12/2022, departure_city: "Denver",
                              arrival_city: "Orlando") 

      passenger1 = Passenger.create!(name: "Bobby", age: 24)
      passenger2 = Passenger.create!(name: "Alex", age: 46)
      passenger3 = Passenger.create!(name: "John", age: 40)

      passenger4 = Passenger.create!(name: "Luis", age: 15)
      

      flight_pass1 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger1.id)
      flight_pass2 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger2.id)

      flight_pass3 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger3.id)
      flight_pass4 = FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger3.id) #should not see passenger 3 twice

      flight_pass5 = FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger4.id) #should not see passenger 4 bc less than 18 yrs

      visit "/airlines/#{united.id}"

      expect(page).to have_content("Bobby")
      expect(page).to have_content("Alex")
      expect(page).to have_content("John") 
      expect(page).to_not have_content("Luis")
   end
end
      

