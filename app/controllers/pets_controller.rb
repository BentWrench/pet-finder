class PetsController < ApplicationController

  def index
    authorize! :index, Pet
    @pets = Pet.all
  end

  def new
<<<<<<< HEAD
    authorize! :create, Pet
    @pet = Pet.new(:lost => params[:lost])
=======
    if !current_user
      render "please_sign_in.html.erb"
    else
      @pet = Pet.new(:lost => params[:lost])
    end
>>>>>>> add_email
  end

  def create
    authorize! :create, Pet
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pets_path
    else
      render 'new'
    end
  end

  def edit
    @pet = Pet.find params[:id]
<<<<<<< HEAD
    authorize! :update, @pet
=======
    if !current_user
      render "please_sign_in.html.erb"
    else
      render 'edit'
    end
>>>>>>> add_email
  end

  def show
    @pet = Pet.find_by_id(params[:id])
    authorize! :show, @pet
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
    authorize! :update, @pet
    if @pet.update pet_params
      redirect_to pets_path
    else
      render 'edit'
    end
  end

  def destroy
<<<<<<< HEAD
    @pet = Pet.find params[:id]
    authorize! :destroy, @pet
    @pet.destroy
    flash[:notice] = 'Pet listing successfully deleted.'
    redirect_to '/pets'
  end

private
=======
    if !current_user
      render "please_sign_in.html.erb"
    else
      @pet = Pet.find params[:id]
      @pet.destroy
      redirect_to '/pets'
    end
  end



  private


>>>>>>> add_email
  def pet_params
    params.require(:pet).permit(:user_id, :species, :breed, :color, :loc_lost, :lost, :description, :avatar)
  end


end
