require 'spec_helper'

describe User do
  it { should validate_presence_of :role }
  it { should ensure_inclusion_of(:role).in_array(User::ROLES) }
  it { should have_many :pets }

  context "creating new user" do
    it "should send a welcome email" do
      user = FactoryGirl.create(:user)
      ActionMailer::Base.deliveries.last.to.should eq [user.email]
    end
  end
end


