# == Schema Information
#
# Table name: offers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  address    :text
#  latitude   :float            default(0.0)
#  longitude  :float            default(0.0)
#  price      :decimal(, )
#  date       :datetime
#  enddate    :datetime
#

class Offer < ActiveRecord::Base
	before_save :geocode
	
	attr_accessible :name, :address, :user_id, :date, :enddate, :price
	belongs_to :user, :inverse_of => :offers
	has_many :bids

	validates :price, :presence => true, :numericality => { :greater_than => 10 }
	validates :enddate, :presence => true
	validates :date, :presence => true
	validates :name, :presence => true

	private
		def geocode
			result = Geocoder.search(self.address).first

			if result.present?
				self.latitude = result.latitude
				self.longitude = result.longitude
			
		end
	end
end
