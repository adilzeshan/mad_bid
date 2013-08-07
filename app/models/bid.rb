class Bid < ActiveRecord::Base

	  t.belongs_to :users
      t.belongs_to :listings
end
