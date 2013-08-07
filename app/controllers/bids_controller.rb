class BidsController < ApplicationController
	before_filter :only_authorized


	def index
		offer = Offer.where(:offer_id => params[:offer][:id])
		@bids = @current_offer.bids.order([:qposition, :bid_price])
	end

	def show
		@bid = Bid.find(params[:id])

	end

	def new
		@bid = Bid.new
		@offer = Offer.find(params[:id])
	end

	def create
		@offer = Offer.find(params[:bid][:offer_id])
		@bid = Bid.new(params[:bid])
		@bid.user_id = @auth.id

			if @offer.present?
				@bid.offer_id = @offer.id
				@bid.save
				# binding.pry
				@bids = @offer.bids.order([:qposition, :bid_price])

				cost = @bid.bid_price.to_i
				@auth.balance = @auth.balance - cost
				@auth.save

				@auth.bids << @bid

			else
				redirect_to(offer_path)
			end
		end

		def make_bid_winner
			# binding.pry
			@bid = Bid.find(params[:bid_id])
			@bid.winner = true
			@bid.save
			@offer = @bid.offer

			if @auth = @bid.offer.user
				reward = @bid.bid_price.to_i 
				@bid.user.balance = @bid.user.balance + (reward * 2)
				@bid.user.save
				cost = @bid.bid_price.to_i
				original_offer = @offer.price.to_i
				@auth.balance = @auth.balance - cost + original_offer
				@auth.save

			else
				redirect_to(offer_path)
			end
		end
			

	private
	def only_authorized
		redirect_to(root_path) if @auth.nil?
	end
end