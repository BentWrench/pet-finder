class MessagesController < ApplicationController

 def new
  @pet = Pet.find(params[:pet_id])
 end



end
