require "spec_helper"

describe "lost or found pet" do
  describe "add new" do
    it "creates a new listing" do
      visit "/pets/new"
      select("Bird", :from => "pet_species")
      fill_in "Breed", :with => "Eagle"
      select("Brown", :from => "pet_color")
      select("Downtown", :from => "pet_loc_lost")
      choose('pet_lost_1')
      fill_in 'Description', :with => "My eagle done flew away!"
      click_button "Create Pet"
      page.should have_content "Pet description: My eagle done flew away!"
    end
  end


  describe "edit listing" do
    it "edits a lost pet listing" do
      visit "/"
      click_link "Sign up"
      fill_in "Email", :with => "test@test.com"
      fill_in "Password", :with => "12345678"
      fill_in "Password confirmation", :with => "12345678"
      click_button "Sign up"
      visit "/pets/new"
      select("Bird", :from => "pet_species")
      fill_in "Breed", :with => "Eagle"
      select("Brown", :from => "pet_color")
      select("Downtown", :from => "pet_loc_lost")
      choose('pet_lost_1')
      fill_in 'Description', :with => "eagle eagle eagle"
      click_button "Create Pet"
      click_link "Bird"
      click_link "Edit This Listing"
      select("Other - Please Describe", :from => "pet_species")
      fill_in "Breed", :with => "Gopher"
      select("Black", :from => "pet_color")
      select("NE Portland", :from => "pet_loc_lost")
      choose('pet_lost_1')
      fill_in 'Description', :with => "gopher gopher gopher"
      click_button "Update Pet"
      page.should have_content "Pet description: gopher gopher gopher"
    end
  end

  describe "select listing" do
    it "selects an existing listing" do
      visit "/pets/new"
      select("Bird", :from => "pet_species")
      fill_in "Breed", :with => "Eagle"
      select("Brown", :from => "pet_color")
      select("Downtown", :from => "pet_loc_lost")
      choose('pet_lost_1')
      fill_in 'Description', :with => "eagle eagle eagle"
      click_button "Create Pet"
      click_link "Bird"
      page.should have_content "Reported Lost: Species: Bird"
    end
  end





end
