class UsersController < ApplicationController
  def index
    authorize! :index, User
    @user = self.current_user
  end
end
