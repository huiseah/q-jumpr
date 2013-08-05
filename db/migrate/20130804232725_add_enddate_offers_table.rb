class AddEnddateOffersTable < ActiveRecord::Migration
  def change
  	add_column :offers, :enddate, :datetime
  end
end
