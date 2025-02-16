require 'rails_helper'

RSpec.describe Airline, type: :model do
  it { should have_many :flights }
  it { should have_many(:flight_passengers).through(:flights) }
  it { should have_many(:passengers).through(:flight_passengers)}

  it { should validate_presence_of :name }

  describe 'model methods' do 
    it 'has a list of unique passengers' do 
      united = Airline.create!(name: "United")
      flight_1 = united.flights.create!(number: "458", date: 8/12/2022, departure_city: "San Francisco",
                              arrival_city: "Austin")
      flight_2 = united.flights.create!(number: "448", date: 8/12/2022, departure_city: "Denver",
                              arrival_city: "Orlando") 
      passenger1 = Passenger.create!(name: "Alan", age: 24)
      passenger2 = Passenger.create!(name: "Bill", age: 46)
      passenger3 = Passenger.create!(name: "John", age: 40)

      passenger4 = Passenger.create!(name: "Luis", age: 15)

      flight_pass1 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger1.id)
      flight_pass2 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger2.id)

      flight_pass3 = FlightPassenger.create!(flight_id: flight_1.id, passenger_id: passenger3.id)
      flight_pass4 = FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger3.id) #should not see passenger 3 twice

      flight_pass5 = FlightPassenger.create!(flight_id: flight_2.id, passenger_id: passenger4.id) #should not see passenger 4 bc less than 18 yrs

      expect(united.adult_passengers).to eq([passenger1.name, passenger2.name, passenger3.name])
    end
  end
end