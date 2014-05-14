require 'spec_helper'

def sign_in(user)
  visit '/users/sign_in'
  within("#new_user") do
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
  end
  click_button 'Sign in'
end


feature 'the sign in and out processes' do
  before :each do
    @user = create(:user)
  end

  it 'signs me in' do
    sign_in(@user)
    expect(page).to have_content 'Signed in successfully'
  end

  it 'signs me out' do
    sign_in(@user)
    click_link 'Sign out'
    expect(page).to have_content 'Signed out successfully'
  end
end

feature 'visiting the user profile' do
  it 'should not show edit page if not logged in' do
    visit '/users/edit'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  it 'should show edit page if logged in' do
    @user = create(:user)
    sign_in(@user)
    visit '/users/edit'
    expect(page).to have_content 'Edit User'
  end
end

