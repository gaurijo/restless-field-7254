# User Story 1, Flights Index Page

# And under each flight number I see the names of all that flight's passengers
require 'rails_helper' 
RSpec.describe "Flights index page" do 
  it "has a list of all flight numbers, name of Airline, and name of passengers" do 
    united = Airline.create!(name: "United")
    southwest = Airline.create!(name: "Southwest")
    alaska = Airline.create!(name: "Alaska Airlines")

    flight_1 = united.flights.create!(number: "458", date: 8/12/2022, departure_city: "San Francisco",
                              arrival_city: "Austin")
    flight_2 = united.flights.create!(number: "448", date: 8/12/2022, departure_city: "Denver",
                              arrival_city: "Orlando")         
    flight_3 = southwest.flights.create!(number: "22", date: 8/18/2022, departure_city: "New York City",
                              arrival_city: "Los Angeles")  

    passenger1 = flight_1.passengers.create!(name: "Bobby", age: 24)
    passenger2 = flight_1.passengers.create!(name: "Alex", age: 4)
    passenger3 = flight_1.passengers.create!(name: "John", age: 40)

    passenger4 = flight_2.passengers.create!(name: "Luis", age: 15)
    passenger4 = flight_2.passengers.create!(name: "Sam", age: 35)

    passenger5 = flight_3.passengers.create!(name: "Mary", age: 30)
    passenger6 = flight_3.passengers.create!(name: "Suzie", age: 3)

    # flight_pass1 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger1.id)
    # flight_pass2 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger2.id)
    # flight_pass3 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger3.id)
    
    visit "/flights"

    within "#flight-#{flight_1.id}" do 
      expect(page).to have_content("458")
      expect(page).to have_content("United")
      expect(page).to have_content("Bobby")
      expect(page).to have_content("Alex")
      expect(page).to have_content("John")
      expect(page).to_not have_content("Luis")
    end

    within "#flight-#{flight_2.id}" do 
      expect(page).to have_content("448")
      expect(page).to have_content("United")
      expect(page).to have_content("Luis")
      expect(page).to have_content("Sam")
      expect(page).to_not have_content("Bobby")
    end

    within "#flight-#{flight_3.id}" do 
      expect(page).to have_content("22")
      expect(page).to have_content("Southwest")
      expect(page).to have_content("Mary")
      expect(page).to have_content("Suzie")
      expect(page).to_not have_content("Bobby")
    end
  end
end

    

