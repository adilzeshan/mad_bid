class AddLatestBidderAndLatestBidTimeToListings < ActiveRecord::Migration
  def change
    add_column :listings, :latest_bidder, :string
    add_column :listings, :latest_bid_time, :datetime
  end
end
