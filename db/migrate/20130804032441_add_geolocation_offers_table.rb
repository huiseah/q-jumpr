class AddGeolocationOffersTable < ActiveRecord::Migration
  def change
  	add_column :offers, :address, :text 
  	add_column :offers, :latitude, :float, :default => 0
  	add_column :offers, :longitude, :float, :default => 0
  end
end
