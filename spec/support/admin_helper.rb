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

end