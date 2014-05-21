require "spec_helper"

describe "lost or found pet" do
  before :each do
    @user = create(:user)
  end

  describe "add new found pet" do
    it "creates a new listing" do
      sign_in_as(@user)
      # visit root_path
      click_link 'Report a Lost Pet'
      select("Bird", :from => "pet_species")
      fill_in "Breed", :with => "Eagle"
      select("Brown", :from => "pet_color")
      select("Downtown", :from => "pet_loc_lost")
      fill_in 'Description', :with => "My eagle done flew away!"
      click_button "Create Pet"
      page.should have_content "My eagle done flew away!"
    end
  end

  describe "cancelling account with pets" do
    it "deletes all pet listings linked to account" do
      cat = create(:pet, user: @user, species: 'Cat')
      dog = create(:pet, user: @user, species: 'Dog')
      sign_in_as(@user)
      visit edit_user_registration_path
      click_button 'Cancel my account'
      visit pets_path
      expect(page).to_not have_content('Dog')
      expect(page).to_not have_content('Cat')
    end
  end


  describe "edit listing" do
    it "edits a lost pet listing" do
      pet = create(:pet, user: @user, description: 'eagle eagle eagle' )
      sign_in_as(@user)
      visit pet_path(pet)
      click_link "Edit This Listing"
      select("Other - Please Describe", :from => "pet_species")
      fill_in "Breed", :with => "Gopher"
      select("Black", :from => "pet_color")
      select("NE Portland", :from => "pet_loc_lost")
      fill_in 'Description', :with => "gopher gopher gopher"
      click_button "Update Pet"
      page.should have_content "gopher gopher gopher"
    end
  end

  describe "select listing" do
    it "selects an existing listing" do
      pet = create(:pet, user: @user, description: 'eagle eagle eagle' )
      sign_in_as(@user)
      visit pets_path
      click_link "Bird"
      page.should have_content "Reported Lost: Species: Bird"
    end
  end
end
