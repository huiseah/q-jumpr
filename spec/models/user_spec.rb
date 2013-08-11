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

require 'spec_helper'

describe User do
  describe '.new' do
    it 'creates an instance of user' do
      user = User.new
      expect(user).to be_an_instance_of(User)
    end
  end

  describe '.offer' do
    it 'has many offers' do
      user = User.new
      offer = Offer.new
      user.offers << offer
      expect(user.offers).to_not be nil
    end
  end

  describe '.bids' do
    it 'has many bids' do
      user = User.new
      bid = Bid.new
      user.bids << bid
      expect(user.bids).to_not be nil
    end
  end

end
