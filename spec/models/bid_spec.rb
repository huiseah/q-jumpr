require 'spec_helper'

describe Bid do

  describe '#show' do
    it 'creates an instance of Bid' do
      bid = Bid.new
      expect(bid).to be_an_instance_of(Bid)
    end
  end

  describe '#new' do
    it 'creates an instance of Bid' do
      bid = Bid.new
      expect(bid).to be_an_instance_of(Bid)
    end
  end

  describe '#make_bid_winner' do
    # it 'has an id' do
    #   bid = Bid.create
    #   expect(bid.id).to_not eq(nil)
    # end
  end

end
