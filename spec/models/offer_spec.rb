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

require 'spec_helper'

describe Offer do

  describe '#new' do
    it 'creates an instance of offer' do
      offer = Offer.new
      expect(offer).to be_an_instance_of(Offer)
    end
  end

  describe '.bid' do
    it 'has many bids' do
      bid = Bid.new
      offer = Offer.new
      offer.bids << bid
      expect(offer.bids).to_not be nil
    end
  end

end
