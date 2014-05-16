require "spec_helper"



describe "lost or found pet" do
  before :each do
    @user = create(:user)
  end

  describe "add new" do
    it "creates a new listing" do
      sign_in_as(@user)
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
    before :each do
      @user = create(:user)
    end

    it "edits a lost pet listing" do
      pet = create(:pet, user: @user, description: 'eagle eagle eagle' )
      sign_in_as(@user)
      visit "/pets/#{pet.id}/edit"
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
    before :each do
      @user = create(:user)
    end

    it "selects an existing listing" do
      pet = create(:pet, user: @user, description: 'eagle eagle eagle' )
      sign_in_as(@user)
      visit "/pets/#{pet.id}"
      page.should have_content "Reported Lost: Species: Bird"
    end
  end
end