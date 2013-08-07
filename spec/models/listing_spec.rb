require 'spec_helper'

describe Listing do

let(:listing) {Factory.build(:listing)}
let(:bid) {Factory.build(:bid)}
let(:user) {Factory.build(:user)}

  context 'active status' do 
  it 'is currently queued and not active yet'
  it 'is now active'
  end

  context 'bidding' do
  it 'bidding increments cost of listing'
  end

  context 'timer'

  context ''
end