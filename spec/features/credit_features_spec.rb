require 'spec_helper'

feature 'credits' do

	# Setup

	background do

	end

	#Helpers

	def select_top_up
		visit '/'
		click_link 'Top up'
		click_link '500 credits'
		visit '/payment'
	end

	#Examples

	scenario 'select a top-up' do
		select_top_up
		expect(page).to have_css 'h2', text: 'Choose a payment'
	end

	scenario 'choose to pay by PayPal' do
		select_top_up
		choose('Paypal')
		click_button 'OK'
	end

	scenario 'choose to pay by credit card' do
		select_top_up
		choose('Credit card')
		click_button('OK')
	end
end