    # t.string   "email",                  default: "", null: false
    # t.string   "encrypted_password",     default: "", null: false
    # t.string   "reset_password_token"
    # t.datetime "reset_password_sent_at"
    # t.datetime "remember_created_at"
    # t.integer  "sign_in_count",          default: 0
    # t.datetime "current_sign_in_at"
    # t.datetime "last_sign_in_at"
    # t.string   "current_sign_in_ip"
    # t.string   "last_sign_in_ip"
    # t.datetime "created_at"
    # t.datetime "updated_at"

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	has_many :bids

  def makes_bid item
    time_now = Time.now
    my_bid = Bid.create
    item.bid(self.username, my_bid.id, time_now)
  end

    #   time = Time.now
    # my_bid = Bid.new
    # item.bid(self.email, my_bid.id, time)

	# @time_of_the_bid
	# @listing = Listing.find(params[:listing])
	# @current_user.makes_bid(@listing)

	# def makes_bid(listing, @time_of_the_bid)
	# 	bid = Bid.new(self.user.id,listing.id, listing.before_price, listing.after_price)
		
	# 	@listing.increment_price(user.username)

	# 	@listing.bid(self.username, bid.id)

	# 	#insider listing mode
	# 	def bid(username, bid_id, Time.now)
	# 		self.increment_price
	# 	end

	# end
end
