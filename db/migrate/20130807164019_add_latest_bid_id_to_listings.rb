class AddLatestBidIdToListings < ActiveRecord::Migration
  def change
    add_column :listings, :latest_bid_id, :integer
  end
end
