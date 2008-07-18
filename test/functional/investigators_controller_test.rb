require 'test_helper'

class InvestigatorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investigators)
  end

  test "should show investigator" do
    get :show, :id => investigators(:one).id
    assert_response :success
  end
end
