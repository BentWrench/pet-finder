class UsersController < ApplicationController
  load_and_authorize_resource


  def index
    # authorize! :index, User
    @user = self.current_user
  end
=begin
  def show
    @user = User.find(params[:id])
    authorize! :show, @user
  end

  def new
    @user = User.new
    authorize! :create, @user
  end

  def create
    @user = User.create(email: params[:email], password: params[:password])
    authorize! :create, @user
    if @user.save
      flash[:notice] = 'New user account successfully created.'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end
=end
end
