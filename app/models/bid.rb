# == Schema Information
#
# Table name: bids
#
#  id         :integer          not null, primary key
#  bid_price  :decimal(, )
#  offer_id   :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  qposition  :integer
#

class Bid < ActiveRecord::Base
	attr_accessible :bid_price, :qposition, :offer_id, :user_id
	belongs_to :user 
	belongs_to :offer

	validates :bid_price, :presence => true, :numericality => { :greater_than => 1 }
end
