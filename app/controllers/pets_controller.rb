class PetsController < ApplicationController

   # before_filter :authorize, only: [:new,:edit, :destroy]

  def index
    @pets = Pet.all
  end


  def new
    if !current_user
      render "please_sign_in.html.erb"
    else
      @pet = Pet.new(:lost => params[:lost])
    end
  end


  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pets_path
    else
      render 'new'
    end
  end


  def edit
    @pet = Pet.find params[:id]
    if !current_user
      render "please_sign_in.html.erb"
    else
      render 'edit'
    end
  end


  def show
    @pet = Pet.find_by_id(params[:id])
    if @pet.nil?
      render 'public/404.html'
    end
  end

  # Ellie's Alternate method:
  #   begin
  #     @pet = Pet.find params[:id]
  #   rescue ActiveRecord::RecordNotFound => e
  #     @pet = nil
  #   end



  def update
    @pet = Pet.find params[:id]
    if @pet.update pet_params
      redirect_to pets_path
    else
      render 'edit'
    end
  end


  def destroy
    if !current_user
      render "please_sign_in.html.erb"
    else
      @pet = Pet.find params[:id]
      @pet.destroy
      redirect_to '/pets'
    end
  end



  private


  def pet_params
    params.require(:pet).permit(:user_id, :species, :breed, :color, :loc_lost, :lost, :description, :avatar)
  end


end
