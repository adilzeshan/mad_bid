require 'spec_helper'

describe User do

  context 'bidding' do
  	it 'makes a bid' do
  		
  		item = double :listing
  		item.should_receive(:bid)

  		me = User.new
  		me.makes_bid item
  	end
  end
end