require 'rails_helper'

RSpec.describe Passenger, type: :model do
  it { should have_many :flight_passengers}
  it { should have_many(:flights).through(:flight_passengers)}
  it { should have_many(:airlines).through(:flights)}

  it { should validate_presence_of :name}
  it { should validate_presence_of :age }
end