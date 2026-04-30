require "test_helper"

class TreatmentsTest < ActionDispatch::IntegrationTest
  setup do
    @owner = Owner.create!(
      first_name: "Juan",
      last_name: "Perez",
      email: "o@test.com",
      phone: "123"
    )

    @pet = Pet.create!(
      name: "Firulais",
      species: "dog",
      date_of_birth: Date.new(2020,1,1),
      weight: 10,
      owner: @owner
    )

    @vet = Vet.create!(
      first_name: "Ana",
      last_name: "Diaz",
      email: "v@test.com",
      phone: "123",
      specialization: "General"
    )

    @appointment = Appointment.create!(
      date: Time.current,
      reason: "Checkup",
      status: "scheduled",
      pet: @pet,
      vet: @vet
    )

    @treatment = @appointment.treatments.create!(
      name: "Injection",
      administered_at: Time.current
    )
  end

  test "should create treatment" do
    assert_difference("Treatment.count") do
      post appointment_treatments_url(@appointment), params: {
        treatment: {
          name: "New Treatment",
          administered_at: Time.current
        }
      }
    end
    assert_redirected_to appointment_path(@appointment)
  end

  test "should update treatment" do
    patch appointment_treatment_url(@appointment, @treatment), params: {
      treatment: { name: "Updated" }
    }
    assert_redirected_to appointment_path(@appointment)
  end

  test "should destroy treatment" do
    assert_difference("Treatment.count", -1) do
      delete appointment_treatment_url(@appointment, @treatment)
    end
    assert_redirected_to appointment_path(@appointment)
  end
end