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
		# binding.pry
		@offer = Offer.find(params[:bid][:offer_id])
		@bid = Bid.new

			if @offer.present?
				@bid.offer_id = @offer.id
				@bid.save
				@bids = @offer.bids.order([:qposition, :bid_price])

				cost = @bid.bid_price.to_i
				@auth.balance = @auth.balance - cost
				@auth.save

				@auth.bids << @bid

			else
				redirect_to(offer_path)
			end
		end
	# def create
	# 	offer = Offer.where(:offer_id => params[:offer][:id])
	# 		if offer.present?
	# 			bid[:offer_id] = offer.id
	# 			bid = Bid.create(params[:bid])
	# 			@bids = @current_offer.offers.order(:enddate).order(:name)

	# 			cost = params[:bid][:bid_price].to_i
	# 			@auth.balance = @auth.balance - cost
	# 			@auth.save

	# 			@auth.bids << bid
	# 		else
	# 			redirect_to(offer_path)
	# 		end
	# 	end
		# render :json => offer

	private
	def only_authorized
		redirect_to(root_path) if @auth.nil?
	end
end