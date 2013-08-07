# # WATCH OUT: capybara specs do not work with devise
# require 'spec_helper'
# # make sure the database is clean with each run
# # watchout for record conflicts

# feature "User Sign Up" do
# 	scenario "Successful" do
# 		sign_up('crazy_frog', 'crazy_frog@me.com', 'Password')
# 		expect(page).to have_content "Sign up complete. Please check your inbox for activation email."
# 	end
# 	scenario "Blank password" do
# 		sign_up('crazy_frog', 'crazy_frog@me.com', '')
# 		expect(page).to have_content "Password can't be blank"
# 	end
# 	scenario "Invalid email" do
# 		sign_up('crazy_frog', 'crazy_frog@me', 'Password')
#   	expect(page).to have_content "Invalid email"
# 	end
# 	# test double password-email? or not?
# end

# feature "User Log In & Log Out" do
# 	background  do
# 		create_user('calm_monkey', 'calm_monkey@me.com', 'Password')
# 	end
# 	scenario "Invalid input" do
# 		login('crazy_frog@me', 'Password')
# 		expect(page).to have_content "Invalid email"
# 		login('crazy_frog@me.com', '')
# 		expect(page).to have_content "Invalid password"
# 		# also test not-matching details
# 	end
# 	scenario "Successful login after signup" do
# 		sign_up('smelly_cat', 'smelly_cat@me.com', 'Password')
# 		@user = User.find_by(email: 'smelly_cat@me.com')	# using credentials from the sign-up test
# 		login(@user.login, @user.password)
# 	  expect(page).to have_content 'Succefully logged in!'
# 	end
# 	scenario "Successful login with a manually created user" do
# 		@user = User.find_by(email: 'calm_monkey@me.com')
# 		login(@user.email, @user.password)
# 	  expect(page).to have_content 'Succefully logged in!'
# 	end
# 	scenario "User Log Out" do
# 		@user = User.find_by(email: 'calm_monkey@me.com')
# 		login(@user.email, @user.password)
# 	  expect(page).to_not have_content 'Login'
# 		click_link 'Log Out'
# 	  expect(page).to have_content 'Successfully signout' # may be a problem if the content is a flash message?
# 	  expect(page).to have_content 'Login'
# 	  expect(page).to_not have_content 'Log Out'
# 	end
# end

# # after(:all) do
# #   User.delete_all
# # end