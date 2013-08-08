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
