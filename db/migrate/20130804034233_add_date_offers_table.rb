class AddDateOffersTable < ActiveRecord::Migration
  def change
  	add_column :offers, :date, :datetime
  end
end
