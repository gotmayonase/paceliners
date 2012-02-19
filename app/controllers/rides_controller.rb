class RidesController < ApplicationController
  
  def index
    @rides = Ride.near([current_location['latitude'], current_location['longitude']]).to_gmaps4rails
  end
  
  def new
    @ride = Ride.new
  end
  
  def create
    @ride = Ride.new(params[:ride])
    if @ride.save
      redirect_to rides_path, :notice => 'Your ride has been added, thanks for contributing!'
    else
      render :new, :error => "There were errors adding your ride: #{@ride.errors.full_messages}"
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
end
