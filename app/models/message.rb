class Message
  attr_reader :owner_email, :owner_phone, :message, :sender_email

  def initialize(info)
    @owner_email = info["owner_email"]
    @owner_phone = info["owner_phone"]
    @message = info["message"]
    @sender_email = info["sender_email"]
  end
end

