class BidsController < ApplicationController
  def create
  	if current_user
  	  listing = Listing.find(params['id'].to_i)
  	  puts params['id'].to_i
  	  puts listing.to_s
  	  current_user.makes_bid listing
  	#else
  		# if post successful
  		#flash, login popup?
  	end
  end
end
