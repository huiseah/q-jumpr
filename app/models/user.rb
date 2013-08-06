# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  balance         :decimal(, )
#

class User < ActiveRecord::Base
	has_secure_password
	attr_accessible :email, :balance, :password, :password_confirmation
	has_many :offers, :inverse_of => :user
	has_many :bids, :inverse_of => :user

	validates :email, :uniqueness => true, :presence => true
end
