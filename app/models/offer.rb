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
#

class Offer < ActiveRecord::Base
	attr_accessible :name, :address, :user_id, :date, :price
	belongs_to :user, :inverse_of => :offers

	validates :price, :numericality => { :greater_than => 0 }
end
