class PetsController < ApplicationController

#  before_filter :authorize, only: [:create, :show]

  def index
    @pets = Pet.all
  end


  def new
    @pet = Pet.new
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
  end


  def show
    @pet = Pet.find params[:id]
  end


  def update
    @pet = Pet.find params[:id]
    if @pet.update pet_params
      redirect_to root_path
    else
      render 'edit'
    end
  end


  def destroy
    @pet = Pet.find params[:id]
    @pet.destroy
    redirect_to '/pets'
  end


  private


  def pet_params
    params.require(:pet).permit(:species, :breed, :color, :loc_lost, :lost, :description, :avatar)
  end


end
