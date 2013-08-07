class AddBeforePriceAndAferPriceToBids < ActiveRecord::Migration
  def change
    add_column :bids, :before_price, :integer
    add_column :bids, :after_price, :integer
  end
end
