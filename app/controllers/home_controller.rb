class HomeController < ApplicationController
	def index
		@offers = Offer.order([:enddate, :name])
	end
end
