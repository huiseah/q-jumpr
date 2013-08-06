class OffersController < ApplicationController
	before_filter :only_authorized

	def index
		@offers = Offer.order([:enddate, :name])
	end

	def show
		@offer = Offer.find(params[:id])
		@bids = @offer.bids.order([:qposition, :bid_price])
		@bid = Bid.new
	end


	def new
		@offer = Offer.new
	end

	def create
		offer = Offer.create(params[:offer])
		@offers = @auth.offers.order(:enddate).order(:name)

		cost = params[:offer][:price].to_i
		@auth.balance = @auth.balance - cost
		@auth.save

		@auth.offers << offer

		# render :json => offer
	end

	private
	def only_authorized
		redirect_to(root_path) if @auth.nil?
	end
end