require "spec_helper"

describe "lost or found pet" do
  describe "add new found pet" do
    it "creates a new listing" do
      user = User.create(:email => 'user@user.com', :password => '12341234', :password_confirmation => '12341234')
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
      visit "/"
      click_link "Report a Lost Pet"
      select("Bird", :from => "pet_species")
      fill_in "Breed", :with => "Eagle"
      select("Brown", :from => "pet_color")
      select("Downtown", :from => "pet_loc_lost")
      fill_in 'Description', :with => "My eagle done flew away!"
      click_button "Create Pet"
      page.should have_content "Pet description: My eagle done flew away!"
    end
  end


  describe "edit listing" do
    it "edits a lost pet listing" do
      user = User.create(:email => 'user@user.com', :password => '12341234', :password_confirmation => '12341234')
      pet = Pet.create(:species => 'Bird', :breed => 'eagle', :color => 'brown', :loc_lost => 'Downtown', :description => "it's an eagle!", :lost => true)
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
      visit pet_path(pet)
      click_link "Edit This Listing"
      select("Other - Please Describe", :from => "pet_species")
      fill_in "Breed", :with => "Gopher"
      select("Black", :from => "pet_color")
      select("NE Portland", :from => "pet_loc_lost")
      fill_in 'Description', :with => "gopher gopher gopher"
      click_button "Update Pet"
      page.should have_content "Pet description: gopher gopher gopher"
    end
  end

  describe "select listing" do
    it "selects an existing listing" do
      user = User.create(:email => 'user@user.com', :password => '12341234', :password_confirmation => '12341234')
      pet = Pet.create(:species => 'Bird', :breed => 'eagle', :color => 'brown', :loc_lost => 'Downtown', :description => "it's an eagle!", :lost => true)
      visit pets_path
      click_link "Bird"
      page.should have_content "Reported Lost: Species: Bird"
    end
  end
end
