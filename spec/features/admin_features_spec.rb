require 'spec_helper'

# Setup

background do
	@admin = create(:admin)
end

# Helpers

def admin_login
		visit '/admin'
		fill_in "Username", :with => 'admin'
		fill_in "Password", :with => '12345678'
		click_button "Log in"
end

def admin_logout(admin)
    click_button 'Log Out'
end

# Specifications

describe 'an admin logs in under /admin' do

	it 'logs in' do
		admin_login
		visit '/admin/dashboard'
		expect(page).to_have_css 'h1', text: 'Admin Dashboard'
	end

	it 'logs out' do
		admin_logout(@admin)
		visit '/admin'
		expect(page).to have_content 'Log in'
		expect(page).to_not have_content 'Admin'
	end

end

