class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # INDEX
  def index
    @appointments = Appointment.upcoming.includes(:pet, :vet)
  end

  # PAST
  def past
    @appointments = Appointment.past.includes(:pet, :vet)
    render :index
  end

  # SHOW
  def show
  end

  # NEW
  def new
    @appointment = Appointment.new
  end

  # CREATE
  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to @appointment, notice: "Appointment created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # EDIT
  def edit
  end

  # UPDATE
  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: "Appointment updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DESTROY
  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: "Appointment deleted."
  end

  private

  def set_appointment
    @appointment = Appointment.includes(:pet, :vet).find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(
      :date,
      :reason,
      :status,
      :pet_id,
      :vet_id
    )
  end
end