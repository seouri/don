require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations)
  end

  test "should show organization" do
    get :show, :id => organizations(:one).id
    assert_response :success
  end
end
