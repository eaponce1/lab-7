require "test_helper"

class PetsTest < ActionDispatch::IntegrationTest
  setup do
    @owner = Owner.create!(
      first_name: "Juan",
      last_name: "Perez",
      email: "owner@test.com",
      phone: "123"
    )

    @pet = Pet.create!(
      name: "Firulais",
      species: "dog",
      date_of_birth: Date.new(2020,1,1),
      weight: 10,
      owner: @owner
    )
  end

  test "should get index" do
    get pets_url
    assert_response :success
  end

  test "should show pet" do
    get pet_url(@pet)
    assert_response :success
  end

  test "should create pet" do
    assert_difference("Pet.count") do
      post pets_url, params: {
        pet: {
          name: "NewPet",
          species: "dog",
          date_of_birth: Date.today,
          weight: 5,
          owner_id: @owner.id
        }
      }
    end
    assert_redirected_to pet_path(Pet.last)
  end

  test "should not create pet invalid" do
    assert_no_difference("Pet.count") do
      post pets_url, params: {
        pet: { name: "", species: "" }
      }
    end
    assert_response :unprocessable_entity
  end

  test "should update pet" do
    patch pet_url(@pet), params: {
      pet: { name: "Updated" }
    }
    assert_redirected_to pet_path(@pet)
  end

  test "should destroy pet" do
    assert_difference("Pet.count", -1) do
      delete pet_url(@pet)
    end
    assert_redirected_to pets_path
  end
end