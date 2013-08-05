require 'spec_helper'

feature 'bids' do

	# Setup
	background do
		# @item = create(:item)
		# @user = create(:user)
	end

	# Helpers

	# Examples

	scenario 'making a bid' do
		visit root_path


		find('#item_one').click_link('Bid')
	end

end