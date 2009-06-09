require 'test_helper'

class LearnGeneralsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learn_generals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learn_general" do
    assert_difference('LearnGeneral.count') do
      post :create, :learn_general => { }
    end

    assert_redirected_to learn_general_path(assigns(:learn_general))
  end

  test "should show learn_general" do
    get :show, :id => learn_generals(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => learn_generals(:one).id
    assert_response :success
  end

  test "should update learn_general" do
    put :update, :id => learn_generals(:one).id, :learn_general => { }
    assert_redirected_to learn_general_path(assigns(:learn_general))
  end

  test "should destroy learn_general" do
    assert_difference('LearnGeneral.count', -1) do
      delete :destroy, :id => learn_generals(:one).id
    end

    assert_redirected_to learn_generals_path
  end
end
