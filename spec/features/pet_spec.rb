require "spec_helper"

describe "lost or found pet" do
  describe "add new" do
    it "creates a new lost pet" do
      visit "/pets/new"
      select("Bird", :from => "pet_species")
      fill_in "Breed", :with => "Eagle"
      fill_in "Color", :with => "Golden"
      select("Central", :from => "pet_loc_lost")
      choose('pet_lost_1')
      fill_in 'Description', :with => "My eagle done flew away!"
      click_button "Create Pet"
      page.should have_content "Pet description: My eagle done flew away!"
    end
  end
end

  # describe "view all" do


  # end


  # describe "" do
  # end


  # describe "" do
  # end





