require 'spec_helper'

describe Message do
  it 'initializes with an owner\'s phone and email address' do
    test_message = Message.new({'owner_phone' => 5038675309, 'owner_email' => 'herp@derp.net'})
    test_message.should be_an_instance_of Message
  end

  it 'initializes with a message and the sender\'s email address' do
    test_message = Message.new({'message' => 'I may have found your lost pet.', 'sender_email' => 'tonyCEO@starkindustries.com'})
    test_message.should be_an_instance_of Message
  end



end
