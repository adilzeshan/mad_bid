require 'spec_helper'

describe Admin do
  it "a valid admin can be created" do
  	a = FactoryGirl.build(:admin)
		expect(a).to be_valid
  end
end
