require 'spec_helper'

  describe Pet do
    it { should validate_presence_of :species }
    it { should validate_presence_of :breed }
    it { should validate_presence_of :description }
    it { should validate_presence_of :color }
    it { should validate_presence_of :loc_lost }

  end
