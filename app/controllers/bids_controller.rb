class BidsController < ApplicationController
  def create
  	if current_user
  	  @listing = Listing.find(params['id'].to_i)
  	  puts params['id'].to_i
  	  puts @listing.to_s
  	  current_user.makes_bid @listing
  	#else
  		# if post successful
  		#flash, login popup?

    #WebsocketRails[:bids].trigger 'new',
    #  { id: @listing.id, current_price: @listing.current_price, latest_bidder: @listing.latest_bidder, active: @listing.active }
     Pusher[:bids].trigger 'new',
       { id: @listing.id, current_price: @listing.current_price, latest_bidder: @listing.latest_bidder, active: @listing.active }
  	end
  end
end
