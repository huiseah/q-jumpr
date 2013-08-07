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
#  winner     :boolean
#

class Bid < ActiveRecord::Base
	attr_accessible :bid_price, :qposition, :offer_id, :user_id, :winner
	belongs_to :user 
	belongs_to :offer

	validates :bid_price, :presence => true, :numericality => { :greater_than => 1 }
	validates_uniqueness_of :winner, :scope => :offer_id, :conditions => lambda { where(:winner => true) }
end
