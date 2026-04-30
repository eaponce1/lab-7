class VetsController < ApplicationController
  before_action :set_vet, only: [:show, :edit, :update, :destroy]

  # INDEX
  def index
    @vets = Vet.includes(:appointments)
  end

  # SHOW
  def show
  end

  # NEW
  def new
    @vet = Vet.new
  end

  # CREATE
  def create
    @vet = Vet.new(vet_params)

    if @vet.save
      redirect_to @vet, notice: "Vet was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # EDIT
  def edit
  end

  # UPDATE
  def update
    if @vet.update(vet_params)
      redirect_to @vet, notice: "Vet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DESTROY
  def destroy
    @vet.destroy
    redirect_to vets_path, notice: "Vet was successfully deleted."
  end

  private

  def set_vet
    @vet = Vet.find(params[:id])
  end

  def vet_params
    params.require(:vet).permit(:first_name, :last_name, :email, :phone, :specialization)
  end
end