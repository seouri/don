require 'test_helper'

class GrantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grant" do
    assert_difference('Grant.count') do
      post :create, :grant => { }
    end

    assert_redirected_to grant_path(assigns(:grant))
  end

  test "should show grant" do
    get :show, :id => grants(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => grants(:one).id
    assert_response :success
  end

  test "should update grant" do
    put :update, :id => grants(:one).id, :grant => { }
    assert_redirected_to grant_path(assigns(:grant))
  end

  test "should destroy grant" do
    assert_difference('Grant.count', -1) do
      delete :destroy, :id => grants(:one).id
    end

    assert_redirected_to grants_path
  end
end
