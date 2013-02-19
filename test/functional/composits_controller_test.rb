require 'test_helper'

class CompositsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get compose" do
    get :compose
    assert_response :success
  end

end
