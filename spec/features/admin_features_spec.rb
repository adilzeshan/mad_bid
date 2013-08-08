# require 'spec_helper'

# feature 'admin duties' do

# 	background do
# 		@admin = create(:admin)
# 		@listing = create(:listing)
# 	end

# 	scenario 'logs in' do
# 		admin_login
# 		visit '/admin/dashboard'
# 		expect(page).to_have_css 'h1', text: 'Admin Dashboard'
# 	end

# 	scenario 'logs out' do
# 		admin_logout(@admin)
# 		visit '/admin'
# 		expect(page).to have_content 'Log in'
# 		expect(page).to_not have_content 'Admin'
# 	end

# 	scenario 'creates listing' do
# 		admin_login
# 		visit '/admin/dashboard' 
# 		input_listing
#   	expect(page).to have_content "New listing created."	
#  	end
# end

# test that error messages are displayer