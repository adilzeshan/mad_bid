require 'spec_helper'

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

feature 'an admin logs in under /admin', %q{
    As the site owner
    I want to provide an user management
    so that I can protect functions and grant access based on roles
  } do

	background do
		@admin = create(:admin)
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