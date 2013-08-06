class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :starting_price
      t.integer :rrp
      t.integer :cost_per_bid
      t.integer :countdown_duration
      t.datetime :starting_date
      t.datetime :expiring_date

      t.timestamps
    end
  end
end
