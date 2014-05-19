require 'spec_helper'

feature 'Visiting homepage' do
  scenario 'Not logged in' do
    visit '/'
    expect(page).to have_content 'Sign up'
    expect(page).to have_content 'Sign in'
  end

  scenario 'Logged in' do
    sign_in_as(create(:user))
    visit '/'
    expect(page).to have_content 'Edit profile'
    expect(page).to have_content 'Sign out'
  end
end

feature 'Signing up' do
  scenario 'Providing valid credentials' do
    email = 'nil@nil.com'
    sign_up_with(email)
    expect(page).to have_content 'Logged in as ' + email + '.'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  # scenario 'Providing invalid email address' do
  #   email = 'nil'
  #   sign_up_with(email)
  #   # expect(page).to have_content
  # end
end

feature 'Signing in' do
  before :each do
    @user = create(:user)
  end

  scenario 'Providing correct credentials' do
    sign_in_as(@user)
    expect(page).to have_content 'Signed in successfully.'
  end
end

feature 'Signing out' do
  before :each do
    @user = create(:user)
  end

  scenario 'Signing out' do
    sign_in_as(@user)
    click_link 'Sign out'
    expect(page).to have_content 'Signed out successfully.'
  end
end

feature 'Visiting the edit profile page' do
  scenario 'Logged in' do
    user = create(:user)
    sign_in_as(user)
    click_link 'Edit profile'
    expect(page).to have_content 'Edit User'
  end

  scenario 'Not logged in' do
    visit '/users/edit'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end

feature 'Cancelling account' do
  scenario '' do
    user = create(:user)
    email = user.email
    sign_in_as(user)
    click_link 'Edit profile'
    click_button 'Cancel my account'
    expect(page).to have_content 'Bye! Your account was successfully cancelled. We hope to see you again soon.'
    sign_up_with(email)
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end

