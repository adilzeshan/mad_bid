require 'spec_helper'

describe Listing do

# let(:listing) {Factory.build(:listing)}
#	let(:bid) {Factory.build(:bid)}
#	let(:user) {Factory.build(:user)}

  context 'new listing' do 
	  it 'is currently queued and not active yet' do
	  	listing = FactoryGirl.build(:listing)
	  	expect(listing.active).to be_false
	  	expect(listing).to be_valid

	  end
	  it 'calling Listing.activate method activates the listing' do
	  	listing = FactoryGirl.build(:listing)
	  	listing.activate
	  	expect(listing.active).to be_true
	  	expect(listing).to be_valid
	  end

	  it "validates input and prints approtiate message" do
	    listing = FactoryGirl.build(:listing, starting_price: "")
	    expect(listing).to_not be_valid
	    listing = FactoryGirl.build(:listing, starting_price: 123123132)
	  	expect(listing).to_not be_valid
	  	listing = FactoryGirl.build(:listing, cost_per_bid: 2132133)
	  	expect(listing).to_not be_valid
	  	listing = FactoryGirl.build(:listing, cost_per_bid: "2d3")
	  	expect(listing).to_not be_valid
	  end

	  xit "has instance variable @price_now set to the value of current_price" do
	  	listing = FactoryGirl.build(:listing)
	  	expect(listing.price).to eq listing.current_price
	  end
  end


  context 'bidding' do
	  it 'bidding increments cost of listing' do
	  	listing = FactoryGirl.create(:listing)
	  	user = FactoryGirl.create(:user)
	  	bid = FactoryGirl.create(:bid)
	  	old_price = listing.current_price
	  	time = Time.now
	 		listing.bid(user.username, bid.id, time) # change to email
	  	expect(listing.current_price).to eq (old_price + listing.cost_per_bid)
	  	expect(listing.latest_bidder).to eq "user1"
	  	expect(listing.latest_bid_time).to eq time
	  	expect(listing.latest_bid_id).to eq bid.id
	  	Listing.destroy_all	# after each
	  	User.destroy_all
	  	Bid.destroy_all
	  end
  end
end

# latest, test
# user, bids relationship
