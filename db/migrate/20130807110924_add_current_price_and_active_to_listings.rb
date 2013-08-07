class AddCurrentPriceAndActiveToListings < ActiveRecord::Migration
  def change
    add_column :listings, :current_price, :integer
    add_column :listings, :active, :boolean
  end
end
