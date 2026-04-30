require "test_helper"

class OwnersTest < ActionDispatch::IntegrationTest
  setup do
    @owner = Owner.create!(
      first_name: "Juan",
      last_name: "Perez",
      email: "juan@test.com",
      phone: "123"
    )
  end

  test "should get index" do
    get owners_url
    assert_response :success
  end

  test "should show owner" do
    get owner_url(@owner)
    assert_response :success
  end

  test "should create owner" do
    assert_difference("Owner.count") do
      post owners_url, params: {
        owner: {
          first_name: "Maria",
          last_name: "Lopez",
          email: "maria@test.com",
          phone: "456"
        }
      }
    end
    assert_redirected_to owner_path(Owner.last)
  end

  test "should not create owner invalid" do
    assert_no_difference("Owner.count") do
      post owners_url, params: {
        owner: { first_name: "", email: "" }
      }
    end
    assert_response :unprocessable_entity
  end

  test "should update owner" do
    patch owner_url(@owner), params: {
      owner: { first_name: "Updated" }
    }
    assert_redirected_to owner_path(@owner)
  end

  test "should destroy owner" do
    assert_difference("Owner.count", -1) do
      delete owner_url(@owner)
    end
    assert_redirected_to owners_path
  end
end