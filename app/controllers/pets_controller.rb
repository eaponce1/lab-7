class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  # INDEX
  def index
    @pets = Pet.includes(:owner)
  end

  # SHOW
  def show
  end

  # NEW
  def new
    @pet = Pet.new
  end

  # CREATE
  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to @pet, notice: "Pet was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # EDIT
  def edit
  end

  # UPDATE
  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: "Pet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DESTROY
  def destroy
    @pet.destroy
    redirect_to pets_path, notice: "Pet was successfully deleted."
  end

  private

  def set_pet
    @pet = Pet.includes(:owner).find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(
      :name,
      :species,
      :breed,
      :date_of_birth,
      :weight,
      :owner_id,
      :photo
    )
  end
end