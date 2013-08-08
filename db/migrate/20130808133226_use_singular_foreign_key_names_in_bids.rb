class UseSingularForeignKeyNamesInBids < ActiveRecord::Migration
  def change
  	rename_column :bids, :users_id, :user_id
  	rename_column :bids, :listings_id, :listing_id
  end
end
