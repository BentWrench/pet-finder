class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @user = self.current_user
  end

  def new
    @user = User.new
  end

  def create
    new_params = user_params.merge({ password: "74108520" })
    @user = User.new(new_params)
    if @user.save
      flash[:notice] = "#{@user.email} successfully added as admin."
      redirect_to users_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:notice] = "User successfully deleted."
    redirect_to users_path
  end

private

  def user_params
    params.require(:user).permit(:id, :email, :role, :phone)
  end

end
