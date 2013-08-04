class AddPriceOffersTable < ActiveRecord::Migration
  def change
  	add_column :offers, :price, :decimal
  end
end
