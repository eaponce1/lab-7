require "test_helper"

class VetsTest < ActionDispatch::IntegrationTest
  setup do
    @vet = Vet.create!(
      first_name: "Ana",
      last_name: "Diaz",
      email: "vet@test.com",
      phone: "123",
      specialization: "General"
    )
  end

  test "should get index" do
    get vets_url
    assert_response :success
  end

  test "should show vet" do
    get vet_url(@vet)
    assert_response :success
  end

  test "should create vet" do
    assert_difference("Vet.count") do
      post vets_url, params: {
        vet: {
          first_name: "Carlos",
          last_name: "Rojas",
          email: "carlos@test.com",
          phone: "456",
          specialization: "Surgery"
        }
      }
    end
    assert_redirected_to vet_path(Vet.last)
  end

  test "should not create vet invalid" do
    assert_no_difference("Vet.count") do
      post vets_url, params: {
        vet: { first_name: "", email: "" }
      }
    end
    assert_response :unprocessable_entity
  end

  test "should update vet" do
    patch vet_url(@vet), params: {
      vet: { first_name: "Updated" }
    }
    assert_redirected_to vet_path(@vet)
  end

  test "should destroy vet" do
    assert_difference("Vet.count", -1) do
      delete vet_url(@vet)
    end
    assert_redirected_to vets_path
  end
end