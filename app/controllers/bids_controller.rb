class BidsController < ApplicationController
  def create
    if current_user
      # verify that params['id'] is within the range
      # of ids of the active listings. Or catch an exception
      # => find will return a massive exceptiom
      # => find_by will return a nil.
    @listing = Listing.find(params['id'])
   # puts params['id'].to_i
   # puts @listing.to_s
      current_user.makes_bid @listing
  #else
  # if post successful
  #flash, login popup?

     websocket[:bids].trigger 'new',
       { id: @listing.id, current_price: @listing.current_price, latest_bidder: @listing.latest_bidder, active: @listing.active }
  	end
  end
end
