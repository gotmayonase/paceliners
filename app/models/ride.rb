class Ride < ActiveRecord::Base
  
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  acts_as_gmappable :process_geocoding => false
  
  validates_presence_of :name, :day_of_week, :time_of_day, :ride_distance, :bike_type
  
  DAYS = {
    'M' => 'Monday',
    'T' => 'Tuesday',
    'W' => 'Wednesday',
    'R' => 'Thursday',
    'F' => 'Friday',
    'S' => 'Saturday',
    'Su' => 'Sunday'
  }
  
  def full_street_address
    "#{address} #{city}, #{state}, #{zipcode}"
  end
  alias :gmap4rails_address :full_street_address
  
  def gmaps4rails_infowindow
    info = <<-INFOWINDOW
      <h2 class="#{bike_type}">#{name}</h2>
      <p><span>Days of Week:</span> <a href="#" title="#{day_of_week.split(',').map { |d| DAYS[d]}.join(',')}" class="tip" onmouseover="$(this).tooltip('toggle')">#{day_of_week}</a></p>
      <p><span>Time of Day:</span> #{time_of_day.getlocal.strftime('%I:%M %p')}</p>
      <p><span>Distance:</span> #{ride_distance}m</p>
    INFOWINDOW
    info << drop_string if drop
    info << "<p><span>Average Pace:</span> #{average_pace}mph</p>" if average_pace
    info << "<p><span>Group Size:</span> #{average_size}" if average_size
    info << "<p><span>Dates:</span> #{start_date.strftime('%b %e')} - #{end_date.strftime('%b %e')}</p>" if start_date && end_date
    info << "<p>
      <span>Starts at:</span><br />
      <span class=\"address\">#{address}</span><br />
      <span class=\"address\">#{city}, #{state}, #{zipcode}</span>
    </p>"
    info << "<p><a href='#{url}'>More info</a></p>" if url
    info
  end
  
  def drop_string
    "<span>Drop?:</span> #{drop ? 'Yes' : 'No'}"
  end
  
end
