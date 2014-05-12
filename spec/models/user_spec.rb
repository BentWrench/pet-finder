require 'spec_helper'

describe User do
  it 'should have an email thats unique and not an empty string' do
    user = User.create(email: 'test@email.com')
    should validate_presence_of(:email)
    should validate_uniqueness_of(:email)
    (user.email).should_not eq('')
  end
end
