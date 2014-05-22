require "spec_helper"


describe "lost or found pet" do
  before :each do
    @user = create(:user)
  end

  describe "add new found pet" do
    it "creates a new listing" do
      sign_in_as(@user)
      visit "/"
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

  describe "reporting a lost pet sighting" do
    it "sends an email to the pet owner" do
      pet = create(:pet, :lost => true)
      sign_in_as(@user)
      visit pet_path(pet)
      click_link "Have you seen me?"
      fill_in "Message", :with => "I have your dog!"
      click_button "Send Email"
      ActionMailer::Base.deliveries.last.to.should eq [pet.user.email]
    end
  end

  describe "reporting the ID of a lost pet" do
    it "sends an email to a lost pet finder" do
      pet = create(:pet, :lost => false)
      sign_in_as(@user)
      visit pet_path(pet)
      click_link "Do you know who I belong to?"
      fill_in "Message", :with => "That's my cousin Dre-Dre's dog!"
      click_button "Send Email"
      ActionMailer::Base.deliveries.last.to.should eq [pet.user.email]
    end
  end
end
