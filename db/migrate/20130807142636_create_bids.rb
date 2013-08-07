class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|

      t.timestamps
      t.belongs_to :users
      t.belongs_to :listings
    end
  end
end
