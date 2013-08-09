module  ListingHelper
	def create_listing(title, description, starting_price, rrp, cpb)
		Listing.create(title: title, description: description, starting_price: starting_price,
										rrp: rrp, credits_per_bid: cpb, coundown_duration: 5, starting_date: Time.now, expiring_date: Time.now + 43200)
	end
end