class Airline < ApplicationRecord
  has_many :flights
  has_many :flight_passengers, through: :flights
  has_many :passengers, through: :flight_passengers

  validates_presence_of :name 

  def adult_passengers 
    passengers
    .where("age > 17").distinct
    .pluck(:name)
  end
end