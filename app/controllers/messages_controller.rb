class MessagesController < ApplicationController

 def new
  @pet = Pet.find(params[:pet_id])
 end

 def create
  @message = Message.new(params)
  UserMailer.found_pet_email(@message).deliver
  flash[:notice] = "An email to the pet owner has been sent!"
  redirect_to pets_path
 end
end
