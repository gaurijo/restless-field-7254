class FlightPassengersController < ApplicationController 
   def destroy
      FlightPassenger.find_by(flight_id: params[:flight_id], passenger_id: params[:passenger_id]).destroy 
      redirect_to "/flights"
   end
end
      