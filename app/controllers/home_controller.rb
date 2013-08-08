class HomeController < ApplicationController
  def index
  	if current_admin
  		render 'admins_pannel/index'
  	else
  		#render 'listings/index'
			#@listings = Listing.find_by(active:true)
			#@listings = Listing.find_by_active(false)
			#@listings = Listing.find_all_by_active(true)
			@listings = Listing.where(active: true)
  	end
  end
end
