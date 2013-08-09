require 'spec_helper'

describe Bid do

	# let(:macbook) {double :listing, current_price: '£20.00', credits_per_bid: '£0.50'}
	# let(:user) {double :user}

	context 'a newly placed bid' do

		before(:each) do
			user = mock_model("User")
			@macbook = mock_model("Listing")
			@macbook.stub(current_price: 20).stub(credits_per_bid: 1)

			@my_bid = Bid.create user: user, listing: @macbook
		end

		it 'applies to a current price before bid is made' do
			@my_bid.update_price @macbook.current_price
			expect(@my_bid.before_price).to eq 20
		end

		it 'results in a new price after the bid is made' do
			@my_bid.update_price @macbook.current_price
			expect(@my_bid.after_price).to eq 21
		end
	end

	context '' do

	end
end