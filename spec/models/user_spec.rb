require 'spec_helper'

describe User do
  it { should validate_presence_of :role }
  it { should ensure_inclusion_of(:role).in_array(User::ROLES) }
  it { should have_many :pets }
end
