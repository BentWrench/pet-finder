class PetsController < ApplicationController
  def index
    authorize! :index, Pet
    @pets = Pet.all
    @lost = Pet.lost.last(5)
    @found = Pet.found.last(5)
  end

  def search
    authorize! :index, Pet
    @pets = Pet.filter(filtering_params)
  end

  def show
    @pet = Pet.find(params[:id])
    authorize! :show, @pet
    if @pet.nil?
      render 'public/404.html'
    end
  end

  def new
    authorize! :create, Pet
    if !current_user
      render "please_sign_in"
    else
      @pet = Pet.new(pet_params)
      render 'new'
    end
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
    @pet = Pet.find(params[:id])
    authorize! :update, @pet
    if !current_user
      render "please_sign_in.html.erb"
    else
      render 'edit'
    end
  end


  def update
    @pet = Pet.find(params[:id])
    authorize! :update, @pet
    if @pet.update pet_params
      redirect_to pets_path
    else
      render 'edit'
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    authorize! :destroy, @pet
    @pet.destroy
    flash[:notice] = 'Pet listing successfully deleted.'
    redirect_to pets_path
  end




private
  def pet_params
    params.require(:pet).permit(:user_id, :species, :breed, :loc_lost, :lost, :description, :avatar, color_ids: [])
  end


  def filtering_params
    params.require(:search).permit(:user_id, :species, :breed, :loc_lost, :lost)
  end


end
