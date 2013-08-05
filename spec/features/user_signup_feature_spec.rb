require 'spec_helper'








# feature, scenario

describe "visiting an index page" do
	context "should see a signup form that" do
		it "allows successful sign up" do
		  visit '/'
	      expect(page).to have_content 'Sign up now'
		  within(".signup-form") do
		    fill_in 'Username', :with => 'crazy_frog'
		    fill_in 'E-mail', :with => 'crazy_frog@me.com'
		    fill_in 'Password', :with => 'Password'
	  	  end
	  	  expect(page).to have_content 'Succefully signed up!'
		end

		context "prevent" do
		  it "blank Password signups (!!just an examples, more invalid scenarios needed)" do
		    visit '/'
		    expect(page).to have_content 'Sign up now'
			within(".signup-form") do
			  fill_in 'Username', :with => 'crazy_frog'
			  fill_in 'E-mail', :with => 'crazy_frog@me.com'
			  fill_in 'Password', :with => ''
			end
	  	  	expect(page).to have_content "Password can't be blank"
		  end
		  it "invalid email signups" do
		    visit '/'
		    expect(page).to have_content 'Sign up now'
			within(".signup-form") do
			  fill_in 'Username', :with => 'crazy_frog'
			  fill_in 'E-mail', :with => 'crazy_frog@me'
			  fill_in 'Password', :with => 'password'
			end
	  	  	expect(page).to have_content "Invalid email"
		  end
		end
	end
	context "should see a login form !!!(create a user to test login)" do
	  it "that allows valid login" do
	    visit '/'
	    expect(page).to have_content 'Login'
		within(".login-form") do
		  fill_in 'E-mail', :with => 'crazy_frog@me'
		  fill_in 'Password', :with => 'password'
		end
	  	  expect(page).to have_content 'Succefully logged in!'
	  end
	  it "prevent invalid login (!!just an examples, more invalid scenarios needed)" do
	    visit '/'
	    expect(page).to have_content 'Login'
		within(".login-form") do
		  fill_in 'E-mail', :with => 'crazy_frog@me'
		  fill_in 'Password', :with => 'password'
		end
		expect(page).to have_content "Invalid email"
	  end
	end

	context "as a logged in user (!run this test on every page)" do
	  it "should have a logout link" do
	    visit '/'
	    expect(page).to have_content 'Login'
		within(".login-form") do
		  fill_in 'E-mail', :with => 'crazy_frog@me'
		  fill_in 'Password', :with => 'password'
		end
		visit '/'
	    expect(page).to_not have_content 'Login'
	    click_link 'Sign Out'
	    expect(page).to have_content 'Successfully signout' #may be a problem if the content is a flash message?
	  end
	end
end



# click submit button