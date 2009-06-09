require 'test_helper'

class LearnProcessesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learn_processes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learn_process" do
    assert_difference('LearnProcess.count') do
      post :create, :learn_process => { }
    end

    assert_redirected_to learn_process_path(assigns(:learn_process))
  end

  test "should show learn_process" do
    get :show, :id => learn_processes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => learn_processes(:one).id
    assert_response :success
  end

  test "should update learn_process" do
    put :update, :id => learn_processes(:one).id, :learn_process => { }
    assert_redirected_to learn_process_path(assigns(:learn_process))
  end

  test "should destroy learn_process" do
    assert_difference('LearnProcess.count', -1) do
      delete :destroy, :id => learn_processes(:one).id
    end

    assert_redirected_to learn_processes_path
  end
end
