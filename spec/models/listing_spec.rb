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
	  	listing = FactoryGirl.build(:listing, credits_per_bid: 2132133)
	  	expect(listing).to_not be_valid
	  	listing = FactoryGirl.build(:listing, credits_per_bid: "2d3")
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
	 		listing.add_bid(user.username, bid.id, time)
	  	expect(listing.current_price).to eq (old_price + 1)
	  	expect(listing.latest_bidder).to eq "user1"
	  	expect(listing.latest_bid_time).to eq time
	  	expect(listing.latest_bid_id).to eq bid.id
	  	Listing.destroy_all	# after each
	  	User.destroy_all
	  	Bid.destroy_all
	  end
  end

  context 'countdown_timer' do

  	describe 'is active' do
      it 'the timer has just kicked off' do
        listing = FactoryGirl.build(:active_listing)
        listing.starting_date = Time.now - listing.countdown_duration
        expect(listing.expired?).to be_false
      end
  	end

  	describe 'is inactive' do
      it 'set countdown duration' do
        listing = FactoryGirl.build(:listing)
        listing.set_countdown_duration 30
        expect(listing.countdown_duration).to eq 30
      end

      it 'the timer has ended' do
        listing = FactoryGirl.build(:listing)
        expect(listing.expired?).to be_true
      end
  	end
  end
end

# latest, test
# user, bids relationship
