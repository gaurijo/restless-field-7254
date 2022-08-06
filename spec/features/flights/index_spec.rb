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

    passenger1 = Passenger.create!(name: "Bobby", age: 24)
    passenger2 = Passenger.create!(name: "Alex", age: 4)
    passenger3 = Passenger.create!(name: "John", age: 40)

    passenger4 = Passenger.create!(name: "Luis", age: 15)
    passenger5 = Passenger.create!(name: "Sam", age: 35)

    passenger5 = Passenger.create!(name: "Mary", age: 30)
    passenger6 = Passenger.create!(name: "Suzie", age: 3)

    flight_pass1 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger1.id)
    flight_pass2 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger2.id)
    flight_pass3 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger3.id)
    flight_pass4 = FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger4.id)
    flight_pass5 = FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger5.id)

    flight_pass6 = FlightPassenger.create!(flight_id: flight_3.id, passenger_id: passenger6.id)
    
    
    visit "/flights"

    within "#flight-#{flight_1.id}" do 
      expect(page).to have_content("458")
      expect(page).to have_content("United")
      expect(page).to have_content("Bobby")
      expect(page).to have_content("Alex")
    end

    within "#flight-#{flight_2.id}" do 
      expect(page).to have_content("448")
      expect(page).to have_content("United")
      expect(page).to have_content("Luis")
    end
  end

  it "has a link to remove a passenger and returns the user to the flight index page where the deleted passenger is no longer listed" do 
    united = Airline.create!(name: "United")
    southwest = Airline.create!(name: "Southwest")

    flight_1 = united.flights.create!(number: "458", date: 8/12/2022, departure_city: "San Francisco",
                              arrival_city: "Austin")
    flight_2 = united.flights.create!(number: "448", date: 8/12/2022, departure_city: "Denver",
                              arrival_city: "Orlando")         
    flight_3 = southwest.flights.create!(number: "22", date: 8/18/2022, departure_city: "New York City",
                              arrival_city: "Los Angeles")  

    passenger1 = Passenger.create!(name: "Bobby", age: 24)
    passenger2 = Passenger.create!(name: "Alex", age: 4)
    passenger3 = Passenger.create!(name: "John", age: 40)

    passenger4 = Passenger.create!(name: "Luis", age: 15)
    passenger5 = Passenger.create!(name: "Sam", age: 35)

    passenger6 = Passenger.create!(name: "Mary", age: 30)
    passenger7 = Passenger.create!(name: "Suzie", age: 3)

    flight_pass1 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger1.id)
    flight_pass2 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger2.id)
    flight_pass3 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger3.id)

    flight_pass4 = FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger4.id)
    flight_pass5 = FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger5.id)

    flight_pass6 = FlightPassenger.create!(flight_id: flight_3.id, passenger_id: passenger6.id)
    flight_pass7 = FlightPassenger.create!(flight_id: flight_3.id, passenger_id: passenger7.id)

    visit "/flights"
    # save_and_open_page
    within "#flight-#{flight_1.id}" do 
      expect(page).to have_content("Bobby")
      click_link "Remove Bobby"
      expect(page).to_not have_content("Bobby")
    end
  end
end


