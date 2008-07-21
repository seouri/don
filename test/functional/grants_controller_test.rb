require 'test_helper'

class GrantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grants)
  end

  test "should show grant" do
    get :show, :id => grants(:grants_1).id
    assert_response :success
  end

end
