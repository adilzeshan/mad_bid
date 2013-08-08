require 'spec_helper'

describe User do

  context 'bidding' do
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