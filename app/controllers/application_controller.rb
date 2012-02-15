class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_location
  
  def current_location
    session[:location] ||= request.location.data
  end

end
