class TreatmentsController < ApplicationController
  before_action :set_appointment
  before_action :set_treatment, only: [:edit, :update, :destroy]

  # NEW
  def new
    @treatment = @appointment.treatments.build
  end

  # CREATE
  def create
    @treatment = @appointment.treatments.build(treatment_params)

    if @treatment.save
      redirect_to @appointment, notice: "Treatment created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # EDIT
  def edit
  end

  # UPDATE
  def update
    if @treatment.update(treatment_params)
      redirect_to @appointment, notice: "Treatment updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DESTROY
  def destroy
    @treatment.destroy
    redirect_to @appointment, notice: "Treatment deleted."
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:appointment_id])
  end

  def set_treatment
    @treatment = @appointment.treatments.find(params[:id])
  end

  # Action Text
  def treatment_params
    params.require(:treatment).permit(
      :name,
      :administered_at,
      :clinical_notes   
    )
  end
end