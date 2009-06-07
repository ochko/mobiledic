require 'test_helper'

class QuizTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quiz_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quiz_type" do
    assert_difference('QuizType.count') do
      post :create, :quiz_type => { }
    end

    assert_redirected_to quiz_type_path(assigns(:quiz_type))
  end

  test "should show quiz_type" do
    get :show, :id => quiz_types(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => quiz_types(:one).id
    assert_response :success
  end

  test "should update quiz_type" do
    put :update, :id => quiz_types(:one).id, :quiz_type => { }
    assert_redirected_to quiz_type_path(assigns(:quiz_type))
  end

  test "should destroy quiz_type" do
    assert_difference('QuizType.count', -1) do
      delete :destroy, :id => quiz_types(:one).id
    end

    assert_redirected_to quiz_types_path
  end
end
