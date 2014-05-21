class UserMailer < ActionMailer::Base
  default from: 'notifications@example.com'

  def found_pet_email(message)
    @owner_email = message.owner_email
    @owner_phone = message.owner_phone
    @message = message.message
    @sender_email = message.sender_email

    mail(to: @owner_email, subject: 'Oregon Humane Society- Someone may have found your lost pet!')
   end
end

