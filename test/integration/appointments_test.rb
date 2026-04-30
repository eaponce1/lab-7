require "test_helper"

class AppointmentsTest < ActionDispatch::IntegrationTest
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
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should show appointment" do
    get appointment_url(@appointment)
    assert_response :success
  end

  test "should create appointment" do
    assert_difference("Appointment.count") do
      post appointments_url, params: {
        appointment: {
          date: Time.current,
          reason: "New appointment",
          status: "scheduled",
          pet_id: @pet.id,
          vet_id: @vet.id
        }
      }
    end
    assert_redirected_to appointment_path(Appointment.last)
  end

  test "should not create appointment invalid" do
    assert_no_difference("Appointment.count") do
      post appointments_url, params: {
        appointment: { reason: "" }
      }
    end
    assert_response :unprocessable_entity
  end

  test "should update appointment" do
    patch appointment_url(@appointment), params: {
      appointment: { reason: "Updated" }
    }
    assert_redirected_to appointment_path(@appointment)
  end

  test "should destroy appointment" do
    assert_difference("Appointment.count", -1) do
      delete appointment_url(@appointment)
    end
    assert_redirected_to appointments_path
  end
end