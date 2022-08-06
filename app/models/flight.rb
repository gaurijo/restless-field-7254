class Flight < ApplicationRecord
  belongs_to :airline
  has_many :passengers
  has_many :flight_passengers, through: :passengers

  validates_presence_of :number
  validates_presence_of :date
  validates_presence_of :departure_city
  validates_presence_of :arrival_city
end