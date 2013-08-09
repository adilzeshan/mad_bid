class ListingsController < ApplicationController
	# don't display edit pannel if not admin
	before_filter :authenticate_admin!, except: :show

	# before filter only admin is authorised here
	layout "listing"
		# test expiry data is > starting date

  def index
  	@listings = Listing.all
  end

  def new
  end

  def create
	  @listing = Listing.new(permited_params)
	  if @listing.save
	  	flash[:message] = 'Successfuly created'
	  	redirect_to :listings
	  else
	  	render :new	# render same page with error highlights (not a priority)
	  end
  end

  def show
  	current_listing
  end

  def edit
		current_listing
  end

  def update
		@listing = current_listing
	   if @listing.update(permited_params)
	  	flash[:message] = 'Successfuly created'
	  	redirect_to :listings
	  else
	  	flash[:message] = "You left one of the fields empty. That's a no-no!"
	  	redirect_to edit_listing_path
	  end
  end

	def destroy
		current_listing
	  @listing.destroy
	  flash[:message] = 'Successfuly deleted listing'
	  redirect_to :listings
	end


  private # push to helper
  def current_listing
  	@listing = Listing.find(params[:id])
  end

  def permited_params
  	params[:listing].permit(
	  			:title, :description, :starting_price, :rrp, :current_price,
	  			:cost_per_bid, :countdown_duration, :starting_date, :expiring_date, :active)
  end
end
