class Bid < ActiveRecord::Base

	  belongs_to :user
      belongs_to :listing

      def update_price before
      	self.update(before_price: before)
      	self.update(after_price: before + 1)
      end
end