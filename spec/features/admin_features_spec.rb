require 'spec_helper'

feature 'admin duties' do

	background do
		@admin = create(:admin)
		@listing = create(:listing)
	end

	scenario 'logs in' do
		admin_login
		visit '/admin/dashboard'
		expect(page).to_have_css 'h1', text: 'Admin Dashboard'
	end

	scenario 'logs out' do
		admin_logout(@admin)
		visit '/admin'
		expect(page).to have_content 'Log in'
		expect(page).to_not have_content 'Admin'
	end

end