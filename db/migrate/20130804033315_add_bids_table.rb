class AddBidsTable < ActiveRecord::Migration
  def change
  	create_table :bids do |t|
  		t.decimal :bid_price
  		t.integer :offer_id
  		t.timestamps
  	end
  end
end
