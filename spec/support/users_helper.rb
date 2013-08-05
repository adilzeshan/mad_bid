module  UserHelper  
  def sign_up(username, email, password)
    visit root_path     # visit '/'
    expect(page).to_not have_content 'Sign Out'
    within(".signup-form") do
      fill_in 'Username', :with => username
      fill_in 'E-mail', :with => email
      fill_in 'Password', :with => password
    end
    click_button 'Sign Up'
  end
  def login(email, password)
    visit root_path     # visit '/'
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
end