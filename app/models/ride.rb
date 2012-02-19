class Ride < ActiveRecord::Base
  
  attr_accessor :force_geocode
  
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode, :unless => :geocoded?
  acts_as_gmappable :process_geocoding => false
  
  validates_presence_of :name, :day_of_week, :time_of_day, :ride_distance, :bike_type
  
  DAYS = {
    'Su' => 'Sunday',
    'M' => 'Monday',
    'T' => 'Tuesday',
    'W' => 'Wednesday',
    'R' => 'Thursday',
    'F' => 'Friday',
    'S' => 'Saturday'
  }
  
  def full_street_address
    "#{address} #{city}, #{state}, #{zipcode}"
  end
  alias :gmap4rails_address :full_street_address
  
  def geocoded?
    !latitude.blank? && !longitude.blank? && !self.force_geocode
  end
  
  def gmaps4rails_infowindow
    info = <<-INFOWINDOW
      <h2 class="#{bike_type}">#{name}</h2>
      <p><span>Days of the Week:</span> <a href="#" title="#{day_of_week.split(',').map { |d| DAYS[d]}.join(',')}" class="tip" onmouseover="$(this).tooltip('toggle')">#{day_of_week}</a></p>
      <p><span>Time of Day:</span> #{time_of_day.getlocal.strftime('%I:%M %p')}</p>
      <p><span>Distance:</span> #{ride_distance} miles</p>
    INFOWINDOW
    info << drop_string if drop
    info << "<p><span>Average Pace:</span> #{average_pace}mph</p>" if average_pace
    info << "<p><span>Group Size:</span> #{average_size}" if average_size
    info << "<p><span>Dates:</span> #{start_date.strftime('%b %e')} - #{end_date.strftime('%b %e')}</p>" if start_date && end_date
    info << "<p class='addressBox'>
      <span>Starts at:</span>
      #{infowindow_address}
    </p>"
    info << "<p><a href='#{url}'>More info</a></p>" if url
    info
  end
  
  def drop_string
    "<span>Drop?:</span> #{drop ? 'Yes' : 'No'}"
  end
  
  def infowindow_address
    address_string = "<span class='address'>#{address_name}</span>"    
    address_string << "<span class=\"address addressExtraLine\">#{address}</span><br />" if address
    if !city.blank? || !state.blank? || !zipcode.blank?
      address_string << "<span class=\"address addressExtraLine\">"
      address_string << "#{city}" unless city.blank?
      if !city.blank? && (!state.blank? || !zipcode.blank?)
        address_string << ", "
      end
      address_string << "#{state} " unless state.blank?
      address_string << "#{zipcode}" unless zipcode.blank?
      address_string << "</span>"
    end
    address_string
  end
  
  def days=(days_array)
    self.day_of_week = days_array.join(',')
  end
  
  def time=(time_hash)
    self.time_of_day = Time.parse "#{time_hash[:hour]}:#{time_hash[:minute]} #{time_hash[:period]}"
  end
  
end
