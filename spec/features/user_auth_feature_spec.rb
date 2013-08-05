require 'spec_helper'
# make sure the database is clean with each run

# Helpers
def sign_up(username, email, password)
	visit root_path			# visit '/'
	expect(page).to_not have_content 'Sign Out'
	within(".signup-form") do
		fill_in 'Username', :with => username
		fill_in 'E-mail', :with => email
		fill_in 'Password', :with => password
	end
	click_button 'Sign Up'
end
def login(email, password)
	visit root_path			# visit '/'
  expect(page).to_not have_content 'Sign Out'
	within(".login-form") do
		fill_in 'E-mail', :with => email
		fill_in 'Password', :with => password
	end
	click_button 'Log In'
end
def create_user(username, password)
	User.create(username: username, email: email, password: password)
end

feature "User Sign Up" do
	scenario "Successful" do
		sign_up('crazy_frog', 'crazy_frog@me.com', 'Password')
		expect(page).to have_content "Sign up complete. Please check your inbox for activation email."
	end
	scenario "Blank password" do
		sign_up('crazy_frog', 'crazy_frog@me.com', '')
		expect(page).to have_content "Password can't be blank"
	end
	scenario "Invalid email" do
		sign_up('crazy_frog', 'crazy_frog@me', 'Password')
  	expect(page).to have_content "Invalid email"
	end
	# test double password-email? or not?
end

feature "User Log In & Log Out" do
	scenario "Successful login after signup" do
		@user = User.find_by(email: 'crazy_frog@me.com')	# using credentials from the sign-up test
		login(@user.login, @user.password)
	  expect(page).to have_content 'Succefully logged in!'
	end
	scenario "Successful login with a user created manually" do
		create_user('calm_monkey', 'calm_monkey@me.com', 'Password')
		@user = User.find_by(email: 'calm_monkey@me.com')
		login(@user.email, @user.password)
	  expect(page).to have_content 'Succefully logged in!'
	end

	scenario "Invalid input" do
		login('crazy_frog@me', 'Password')
		expect(page).to have_content "Invalid email"
		login('crazy_frog@me.com', '')
		expect(page).to have_content "Invalid password"
		# also test not-matching details
	end
	scenario "User Log Out" do
		@user = User.find_by(email: 'calm_monkey@me.com')
		login(@user.email, @user.password)
	  expect(page).to_not have_content 'Login'
		click_link 'Log Out'
	  expect(page).to have_content 'Successfully signout' # may be a problem if the content is a flash message?
	  expect(page).to have_content 'Login'
	  expect(page).to_not have_content 'Log Out'
	end
end

# after(:all) do
#   User.delete_all
# end