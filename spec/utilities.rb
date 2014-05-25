def sign_in_as(user)
  visit '/'
  click_link 'Sign in'
  within("#new_user") do
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
  end
  click_button 'Sign in'
end

def sign_up_with(email, password='74108520')
  visit '/users/sign_up'
  within('#new_user') do
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in "Password confirmation", with: password
  end
  click_button 'Sign up'
end

