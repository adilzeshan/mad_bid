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

	#Exampless

	scenario 'select a top-up' do
		top_up_credits
		expect(page).to have_css 'h2', text: 'Choose a payment'
	end

	scenario 'choose to pay by PayPal' do
		top_up_credits
		choose('Paypal')
		click_button 'OK'
	end

	scenario 'choose to pay by credit card' do
		top_up_credits
		choose('Credit card')
		click_button('OK')
	end
end