class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :name
      t.decimal :ride_distance
      t.time :time_of_day
      t.string :day_of_week
      t.date :start_date
      t.date :end_date
      t.boolean :drop
      t.decimal :average_pace
      t.integer :average_size
      t.string :bike_type
      t.string :url
      
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
