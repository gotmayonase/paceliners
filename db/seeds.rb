# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ride.create(
  :name => "Bike's Etc",
  :ride_distance => 30.1,
  :time_of_day => Time.parse('18:00:00'),
  :day_of_week => 'T,R',
  :average_pace => 20,
  :average_size => 10,
  :address => '3723 E Texas St',
  :city => 'Bossier City',
  :state => 'LA',
  :zipcode => '71111',
  :bike_type => 'road',
  :url => 'http://bikesetcbossier.com/'
)
