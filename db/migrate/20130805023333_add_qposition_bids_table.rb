class AddQpositionBidsTable < ActiveRecord::Migration
  def change
  	add_column :bids, :qposition, :integer
  end
end
