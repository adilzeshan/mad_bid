require 'spec_helper'

feature "winning a bid" do
	scenario 'winning a bid' do
		create_user('calm_monkey', 'calm_monkey@me.com', 'Password')
		visit '/'
		@user = User.find_by(email: 'calm_monkey@me.com')
		login(@user.email, @user.password)
		create_listing('iPhone 5 16GB', 'Brilliant 4-inch Retina display', '12.99', '529.99', '0.01', 10)
		visit '/'
		expect(page).to_not have_content 'You won!', visible: true
		find('.auctions :first-child .listing').click_link('Bid')
		sleep 10
		expect(page).to have_content 'You won!', visible: true
		# test that that particular user has indeed won
	end
end

# after (:all) do
# 	User.delete_all
# 	Listing.delete_all
# end