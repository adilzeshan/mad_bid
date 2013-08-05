require 'spec_helper'

# make sure css selection is valid

feature 'making a bid' do
	scenario "when signed out" do
		visit '/'
		expect(page).to have_css('#popup_login', visible: false)
		find('.auctions :first-child .listing').click_link('Bid')
		expect(page).to have_css('#popup_login', visible: true)
		expect('#popup_login').to have_content "You are not logged in."
		# (optional) add signup link & a login form
	end
	scenario "when logged in" do
		create_user('bob', 'bob@me.com', 'password')
		@user = User.find_by(email: 'bob@me.com')
		login(@user.email, @user.password)
		@price_before = find('.auctions :first-child .listing .price').value.split('£')[1].to_f
		find('.auctions :first-child .listing').click_link('Bid')
		@price_after = find('.auctions :first-child .listing .price').value.split('£')[1].to_f
		(@price_before-@price_after).shoud be > 0
	end

end