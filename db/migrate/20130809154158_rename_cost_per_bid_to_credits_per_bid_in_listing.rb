class RenameCostPerBidToCreditsPerBidInListing < ActiveRecord::Migration
  def change
  	rename_column :listings, :cost_per_bid, :credits_per_bid
  end
end
