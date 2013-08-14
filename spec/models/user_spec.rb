require 'spec_helper'

describe User do

  context 'bidding' do

    context 'user makes bid after listing expires' do
      item = FactoryGirl.build(:inactive_listing)
      me = FactoryGirl.build(:user)

        it 'should check if the item is expired' do
          expect(item.expired?).to be_true
        end

        it 'should not be able to bid' do
          # bid =  me.makes_bid item
          expect(me.makes_bid item).to be_false
        end
    end

    context 'user makes bid before listing expires' do
      
    end

  	it 'should add their bid to the listing' do
  		item = double :listing
  		bid = double :bid
  		bid.stub(:id).and_return(1)

  		bid.stub(:id).and_return(1)
  		me = User.create
  		Bid.stub(:create).with(user: me, listing: item).and_return(bid)

  		item.should_receive(:add_bid)
  		me.makes_bid item
  	end
  end
end