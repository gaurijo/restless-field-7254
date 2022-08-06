Rails.application.routes.draw do
  resources :flights, only: [:index] 
  
  delete '/flights/:flight_id/passengers/:passenger_id', to: 'flight_passengers#destroy'
end
