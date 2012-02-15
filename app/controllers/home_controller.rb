class HomeController < ApplicationController
  
  def index
    @rides = Ride.near([current_location['latitude'], current_location['longitude']]).to_gmaps4rails
  end
  
end