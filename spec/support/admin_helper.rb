module AdminHelper

	def admin_login
		visit '/admin'
		fill_in "Username", :with => 'admin'
		fill_in "Password", :with => '12345678'
		click_button "Log in"
	end

	def admin_logout(admin)
	    click_button 'Log Out'
	end

	def input_listing
		fill_in "Title", :with => 'iPhone 5 16GB'
		fill_in "Description", :with => 'Brilliant 4-inch Retina display'
		fill_in "Starting Price", :with => '£12.99'
		fill_in "RRP", :with => '£529.99'
		fill_in "Cost per bid", :with => '£0.01'
		fill_in "Starting date", :with => '06/08/2013 08:44:00'
		fill_in "Expiring date", :with => '06/08/2013 10:44:00'
		fill_in "Countdown Timer", :with => "30"
		click_button 'Create New Listing'
	end

end