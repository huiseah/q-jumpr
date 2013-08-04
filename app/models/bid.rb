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
#

class Bid < ActiveRecord::Base
	attr_accessible :bid_price, :offer_id, :user_id
	belongs_to :user 
	belongs_to :offer

validates :bid_price, :numericality => { :greater_than => 0 }
end
