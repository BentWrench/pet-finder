require 'spec_helper'

  describe Pet do
    it { should validate_presence_of :species }
    it { should validate_presence_of :breed }
    it { should validate_presence_of :description }
    it { should validate_presence_of :loc_lost }
    it { should belong_to :user }
    it { should have_and_belong_to_many :colors }

  end
