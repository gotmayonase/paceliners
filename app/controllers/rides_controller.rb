class RidesController < ApplicationController
  
  def index
    lat = params[:latitude].blank? ? current_location['latitude'] : params[:latitude]
    lng = params[:longitude].blank? ? current_location['longitude'] : params[:longitude]
    @rides = Ride.near([lat, lng])
    @rides_json = @rides.to_gmaps4rails
    respond_to do |format|
      format.html { render }
      format.json { render :json => @rides_json }
    end
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
  
  def check_similar
    @rides = Ride.near([params[:ride][:latitude], params[:ride][:longitude]], 1)
    if @rides.blank?
      render :status => 404, :nothing => true
    else
      render :layout => false
    end
  end
  
end
