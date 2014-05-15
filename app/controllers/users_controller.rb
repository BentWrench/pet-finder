class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @user = self.current_user
  end
end
