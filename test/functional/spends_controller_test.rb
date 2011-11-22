require 'test_helper'

class SpendsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spend" do
    assert_difference('Spend.count') do
      post :create, :spend => { }
    end

    assert_redirected_to spend_path(assigns(:spend))
  end

  test "should show spend" do
    get :show, :id => spends(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => spends(:one).to_param
    assert_response :success
  end

  test "should update spend" do
    put :update, :id => spends(:one).to_param, :spend => { }
    assert_redirected_to spend_path(assigns(:spend))
  end

  test "should destroy spend" do
    assert_difference('Spend.count', -1) do
      delete :destroy, :id => spends(:one).to_param
    end

    assert_redirected_to spends_path
  end
end
