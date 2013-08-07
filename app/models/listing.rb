  # create_table "listings", force: true do |t|
  #   t.string   "title"
  #   t.text     "description"
  #   t.integer  "starting_price"
  #   t.integer  "rrp"
  #   t.integer  "cost_per_bid"
  #   t.integer  "countdown_duration"
  #   t.datetime "starting_date"
  #   t.datetime "expiring_date"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  #   t.integer  "current_price"
  #   t.boolean  "active"
  #   t.string   "latest_bidder"
  #   t.datetime "latest_bid_time"
  #   t.integer  "latest_bid_id"
  # end


class Listing < ActiveRecord::Base
	
	validates :title, :starting_price, :rrp, :cost_per_bid, :countdown_duration,
						:starting_date, :expiring_date, presence: true

	validates :starting_price, :rrp, :current_price, :cost_per_bid,
	length: {
		minimum: 1,
		maximum: 6,
    too_short: "The price must have at least %{count} digits",
    too_long: "The price must have at most %{count} digits"
	}
	
	validates :starting_price, :rrp, :current_price, :cost_per_bid, :countdown_duration,
	numericality: { only_integer: true }


	has_many :bids

	def activate
		self.update(active:true)
	end

	def bid(username, bid_id, time)
		self.update(latest_bidder:username, latest_bid_time:time, latest_bid_id:bid_id, current_price: self.current_price + self.cost_per_bid)
	end
end
