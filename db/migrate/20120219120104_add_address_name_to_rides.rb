class AddAddressNameToRides < ActiveRecord::Migration
  def change
    add_column :rides, :address_name, :string

  end
end
